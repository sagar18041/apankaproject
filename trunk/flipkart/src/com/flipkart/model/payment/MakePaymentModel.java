package com.flipkart.model.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class MakePaymentModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static ResultSet rs1=null;
	static String sqlQuery="";
	static Connection conn = null;

	/**
	 * Check Card validation and order amount 
	 * @param cardNo
	 * @param cardName
	 * @param cvv
	 * @param Month
	 * @param year
	 * @return Flag = true is card validates false if doesn't
	 */
	public Boolean validateCard(int cardNo , String cardName , int cvv , String Month , int year , String orderNo , String card){
		
		Boolean flag = false;
		/*
		 * Card Validation
		 */
		if(card.equals("cc")){
			sqlQuery = "select distinct 'true' as flag from creditcard cc join bank b on b.accountNumber=cc.accountNumber " +
					" where cc.accountNumber = ? and cc.expiryMonth= ? and cc.expiryYear= ? " +
					" and cc.cvv= ? and b.customerName= ?" ;
		}
		else if(card.equals("db")){
			sqlQuery = "select distinct 'true' as flag from debitcard db join bank b on b.accountNumber=db.accountNumber " +
					" where db.accountNumber = ? and db.expiryMonth= ? and db.expiryYear= ? " +
					" and db.cvv= ? and b.customerName= ?" ;
		}
		System.out.println("Validate Query 1 = " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, cardNo);
			ps.setString(2, Month);
			ps.setInt(3, year);
			ps.setInt(4, cvv);
			ps.setString(5, cardName);
			
			rs=ps.executeQuery();

			while(rs.next()){
				flag = rs.getBoolean("flag");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		/*
		 * Amount Validation
		 * Check if amount is greater than available amount in bank table and
		 * creditCardLimit
		 */
		if(card.equals("cc")){
			sqlQuery = "select 'true' as flag from flipkart_order where (totalPrice+shippingCharge) < (select balance " +
					 "from bank where accountNumber = (select accountNumber from creditCard where cardNumber = ?" +  
					 ")) and (totalPrice+shippingCharge) < (select creditLimit from creditcard where accountNumber = " +
					 "(select accountNumber from creditCard where cardNumber =  ? )) and orderNumber = ?";
			System.out.println("Validate Query 2 is " + sqlQuery);
			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setInt(1, cardNo);
				ps.setInt(2, cardNo);
				ps.setString(3, orderNo);
				rs=ps.executeQuery();

				while(rs.next()){
					flag = rs.getBoolean("flag");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(card.equals("db")){
			sqlQuery = "select 'true' as flag from flipkart_order where (totalPrice+shippingCharge) < (select balance " +
					 "from bank where accountNumber = (select accountNumber from debitCard where cardNumber = ?" +  
					 ")) and orderNumber = ?";
			System.out.println("Validate Query 2 is " + sqlQuery);
			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setInt(1, cardNo);
				ps.setString(2, orderNo);
				rs=ps.executeQuery();

				while(rs.next()){
					flag = rs.getBoolean("flag");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
				
		
				return flag;
	}
	
	/**
	 * This method is to update the status of order in flipkart_order table
	 * and insert the records in banktransaction table for each orderid
	 * For one ordernum there can be multiple orderids
	 * @param orderNum
	 * @param cardNo
	 * @return flag to check if records are inserted and updated properly
	 */
	public Boolean insertUpdateRecords(String orderNum , int cardNo , String paymentType){
		Boolean checkFlag = true;
		/*
		 * Update flipkart_order status = "delievered"
		 */
		sqlQuery = "update flipkart_order set status = 'Delievered' where orderNumber = ?";
		System.out.println("Update Query 1 = " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, orderNum);			
			ps.executeUpdate();
		}catch(Exception e){
			checkFlag = false;
			e.printStackTrace();
		}
		
		/*
		 * Insert records in banktransaction for each orderid for the ordernumber 
		 */ 
		int customerId = 0;
		sqlQuery = "select customerid from bank where accountnumber = (select accountnumber from creditcard where cardNumber = ?)";
		System.out.println("Update Query 1 = " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, cardNo);			
			rs=ps.executeQuery();
			while(rs.next()){
				customerId = rs.getInt("customerid");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		sqlQuery = "select orderID , (totalPrice+shippingCharge) as amount from flipkart_order where orderNumber = ?";
		 System.out.println("Insert Query 2 is " + sqlQuery);
			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setString(1, orderNum);
				rs=ps.executeQuery();

				while(rs.next()){
					/*
					 * Insert
					 */
					sqlQuery = "insert into banktransaction(customerID,orderID,amount,paymentType)" +
					 "VALUES(?,?,?,?)";
					System.out.println("Insertion Script " + sqlQuery);
					
					try{
						conn=DbConnection.getConnection();
						ps=conn.prepareStatement(sqlQuery);
						ps.setInt(1, customerId);
						ps.setInt(2, rs.getInt("orderID"));
						ps.setInt(3, rs.getInt("amount"));
						ps.setString(4, paymentType);
						ps.executeUpdate();
						
					}catch(Exception ex){
						checkFlag = false;
						ex.printStackTrace();
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		return checkFlag;
	}
	
	/**
	 * @param orderNumber
	 * @return araylist of cartForEmail
	 * This arraylist contains all the fields which are required to show in the email which is to be sent 
	 * after successful payment
	 */
	public ArrayList<CartForEmail> cartDetails(String orderNumber){
		ArrayList<CartForEmail> cfe = new ArrayList<CartForEmail>();
		System.out.println("Order Number " + orderNumber);
		/*
		 * Data for orderNumber
		 */
		sqlQuery = "Select orderID , orderNumber , itemID , quantity , totalPrice , addressID , status , (quantity*totalPrice) as subTotal from flipkart_order where orderNumber='" + orderNumber + "'";
		System.out.println("Cart Details Query " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
		//	ps.setString(1, orderNumber);
			rs = ps.executeQuery(sqlQuery);
			while(rs.next()){
				/*
				 * For one orderNumber there can be multiple orderID
				 */
				CartForEmail cart = new CartForEmail();
				cart.setOrderID(rs.getInt("orderID"));
				cart.setOrderNum(rs.getString("orderNumber"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setPrice(rs.getInt("totalPrice"));
				cart.setSubTotal(rs.getInt("subTotal"));
				cart.setStatus(rs.getString("status"));
				
				int itemid = rs.getInt("itemID");
				/*
				 * item NAme
				 */
				sqlQuery = "select itemName from flipkart_item where itemID = " + itemid;
				System.out.println("item description sql Query " + sqlQuery);
				try{
					conn=DbConnection.getConnection();
					ps=conn.prepareStatement(sqlQuery);
				//	ps.setInt(1, orderid);
					rs1 = ps.executeQuery(sqlQuery);
					while(rs1.next()){
						cart.setItemDetails(rs1.getString("itemName"));
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}
				rs1.close();
				
				/*
				 * Address
				 */
				int addId = rs.getInt("addressID");
				sqlQuery = "select concat(a.name , ' , ' , a.streetAddress , ' , ' , a.city , ' , ' , s.stateName , ' , ' , " +
				"a.pincode) as address from flipkart_shippingAddress a join flipkart_state s " +
						"on a.stateID=s.stateID where addressID=" + addId ;
				System.out.println("Address sql Query " + sqlQuery);
				try{
					conn=DbConnection.getConnection();
					ps=conn.prepareStatement(sqlQuery);
				//	ps.setInt(1, rs.getInt("addressID"));
					rs1 = ps.executeQuery(sqlQuery);
					while(rs1.next()){
						cart.setShippingAddress(rs1.getString("address"));
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}
				rs1.close();
				cfe.add(cart);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return cfe;
	}
	
	/**
	 * This method updates the balance available on successful completion of payment
	 * @param cardNum
	 * @param amt
	 * @param card
	 * @return
	 */
	public boolean updateBankAmount(int cardNum , int amt , String card){
		if(card.equals("cc")){
			sqlQuery = "update bank set balance = (balance-?) where accountNumber = (select accountNumber from creditCard where cardNumber =?)";
		}
		else if(card.equals("db")){
			sqlQuery = "update bank set balance = (balance-?) where accountNumber = (select accountNumber from debitCard where cardNumber =?)";
		}
		
		System.out.println("Balance Update " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, amt);
			ps.setInt(2, cardNum);
			ps.executeUpdate();
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * This method is to check if the customerid and password is validated
	 * @param customerid
	 * @param password
	 * @return
	 */
	public boolean validateBank(int customerid , String password){
		boolean flag = false;
		sqlQuery = "select 'true' flag from netbanking n join bank b on b.accountNumber = n.accountNumber " +
		"where b.customerID=" + customerid + " and n.password='" + password + "'";
		System.out.println("Bank validation " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			//ps.setInt(1, customerid);
			//ps.setString(2, password);
			rs=ps.executeQuery(sqlQuery);
			while(rs.next()){
				flag = rs.getBoolean("flag");
			}
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		return flag;
	}
	
	/**
	 * This method is to update the status of order in flipkart_order table
	 * and insert the records in banktransaction table for each orderid
	 * For one ordernum there can be multiple orderids
	 * @param orderNum
	 * @param customerid
	 * @return flag to check if records are inserted and updated properly
	 */
	public Boolean insertAndUpdateForNetBanking(String orderNum , int customerId){
		Boolean checkFlag = true;
		/*
		 * Update flipkart_order status = "delievered"
		 */
		sqlQuery = "update flipkart_order set status = 'Delievered' where orderNumber = ?";
		System.out.println("Update Query 1 = " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, orderNum);			
			ps.executeUpdate();
		}catch(Exception e){
			checkFlag = false;
			e.printStackTrace();
		}
		
		/*
		 * Insert records in banktransaction for each orderid for the ordernumber 
		 */ 
		
		sqlQuery = "select orderID , (totalPrice+shippingCharge) as amount from flipkart_order where orderNumber = ?";
		 System.out.println("Insert Query 2 is " + sqlQuery);
			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setString(1, orderNum);
				rs=ps.executeQuery();

				while(rs.next()){
					/*
					 * Insert
					 */
					sqlQuery = "insert into banktransaction(customerID,orderID,amount,paymentType)" +
					 "VALUES(?,?,?,?)";
					System.out.println("Insertion Script " + sqlQuery);
					
					try{
						conn=DbConnection.getConnection();
						ps=conn.prepareStatement(sqlQuery);
						ps.setInt(1, customerId);
						ps.setInt(2, rs.getInt("orderID"));
						ps.setInt(3, rs.getInt("amount"));
						ps.setString(4, "netBanking");
						ps.executeUpdate();
						
					}catch(Exception ex){
						checkFlag = false;
						ex.printStackTrace();
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		return checkFlag;
	}
	
	/**
	 * This method updates the balance available on successful completion of payment for netBanking
	 * @param cardNum
	 * @param amt
	 * @param card
	 * @return
	 */
	public boolean updateBankAmountForNetBanking(int customerid , int amt){
		
		sqlQuery = "update bank set balance = (balance-?) where customerID=?";
			
		System.out.println("Balance Update " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, amt);
			ps.setInt(2, customerid);
			ps.executeUpdate();
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
		return true;
	}
	
}
