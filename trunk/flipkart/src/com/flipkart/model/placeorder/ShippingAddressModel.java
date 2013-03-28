package com.flipkart.model.placeorder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.flipkart.util.DbConnection;
import com.opensymphony.xwork2.ActionContext;

public class ShippingAddressModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	/**********************************************************
	 * This method is used to fetch the list of all shipping
	 * addresses of the registered user.
	 * @param uid - user id of the registered user
	 * @return address list
	 **********************************************************/
	public static ArrayList<ShippingAddress> fetchAddrList(int uid) {

		ArrayList<ShippingAddress> addrList = new ArrayList<ShippingAddress>();

		sqlQuery = "select addressID, name, streetAddress, landmark, city, stateName, pincode, phoneNumber from flipkart_shippingaddress sa, flipkart_state s where userID = ? and sa.stateID = s.stateID";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, uid);
			rs=ps.executeQuery();

			while(rs.next()){
				ShippingAddress addr = new ShippingAddress();
				addr.setAddressID(rs.getInt(1));
				addr.setName(rs.getString(2));
				addr.setStreetAddress(rs.getString(3));
				if(!rs.getString(4).equals("")) {
					addr.setLandmark(", "+rs.getString(4));
				}
				addr.setCity(rs.getString(5));
				addr.setStateName(rs.getString(6));
				addr.setPincode(rs.getString(7));
				addr.setPhoneNumber(rs.getString(8));

				addrList.add(addr);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return addrList;
	}

	/***************************************************************
	 * This method is used to fetch the list of all states present
	 * in the database
	 * @return state list
	 ***************************************************************/
	public static ArrayList<String> fetchStateList() {

		ArrayList<String> stateList = new ArrayList<String>();
		sqlQuery = "select stateName from flipkart_state order by stateName";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				stateList.add(rs.getString(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return stateList;
	}


	/************************************************************
	 * This method is used to insert shipping address for a
	 * particular user.
	 * @param addr shipping address
	 ***********************************************************/
	public static int insertShippingAddress(ShippingAddress addr) {

		int uid =1;
		int stateid=0;

		sqlQuery = "select stateID from flipkart_state where stateName='"+addr.getStateName()+"'";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			if(rs.next()){
				stateid = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		System.out.println("**********stateid****"+stateid);

		sqlQuery = "insert into flipkart_shippingaddress(name, streetAddress, landmark, city, stateID, pincode, phoneNumber, userID) " +
				"values(?,?,?,?,?,?,?,?);";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getStreetAddress());
			ps.setString(3, addr.getLandmark());
			ps.setString(4, addr.getCity());
			ps.setInt(5, stateid);
			ps.setString(6, addr.getPincode());
			ps.setString(7, addr.getPhoneNumber());
			ps.setInt(8, uid);

			ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}

		Map sess=ActionContext.getContext().getSession();
		int addressID = 0;
		sqlQuery = "select max(addressID) from flipkart_shippingaddress where userID=?";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, Integer.parseInt(sess.get("userID").toString()));
			rs=ps.executeQuery();

			if(rs.next()){
				addressID = Integer.parseInt(rs.getString(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return addressID;
	}

	public static void insertOrder(Order order) {

		
		sqlQuery = "insert into flipkart_order(orderNumber, itemID, emailAddress, addressID, status) " +
				"values(?,?,?,?,?);";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, order.getOrderNumber());
			ps.setInt(2, order.getItemID());
			ps.setString(3, order.getEmailAddress());
			ps.setInt(4, order.getAddressID());
			ps.setString(5, order.getStatus());

			ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
