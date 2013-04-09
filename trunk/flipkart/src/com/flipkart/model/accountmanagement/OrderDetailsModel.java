package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.model.placeorder.ShippingAddress;
import com.flipkart.util.DbConnection;

public class OrderDetailsModel {
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
	public static ShippingAddress getAddress(int userId, String orderNo){
		
		ShippingAddress addr = new ShippingAddress();
		sqlQuery = "select distinct sa.addressID, sa.name, streetAddress, landmark, city, stateName, pincode, phoneNumber " +
				"from flipkart_shippingaddress sa, flipkart_state s, flipkart_order o  " +
				"where sa.userID = ? and o.addressID=sa.addressID and sa.stateID = s.stateID  " +
				"and o.orderNumber=?;";
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			ps.setString(2, orderNo);
			rs=ps.executeQuery();

			while(rs.next()){
				
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
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return addr;
	}
	
	public static OrderDetails getOrderSummary(int userId, String orderNo){

		String emailID = UserPasswordModel.getUserEmailAddress(userId);
		OrderDetails order = new OrderDetails();
		ShippingAddress addr = getAddress(userId, orderNo);
		
		order.setName(addr.getName());
		order.setAddress(addr);
		order.setPhoneNumber(addr.getPhoneNumber());
		order.setOrderNumber(orderNo);
		
		
		int numOfItems = 0;
		sqlQuery = "select createdOn from flipkart_order where orderNumber=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, orderNo);
			rs=ps.executeQuery();

			while(rs.next()){
				order.setCreatedOn(rs.getDate(1));
				numOfItems+=1;
			}
	
			order.setTotalItems(numOfItems);
	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		double shippingCharge = 0;
		sqlQuery = "select distinct shippingCharge,status from flipkart_order where orderNumber=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, orderNo);
			rs=ps.executeQuery();

			while(rs.next()){
				shippingCharge = rs.getDouble(1);
				order.setStatus(rs.getString(2));
			}
			
			if(shippingCharge==0){
				order.setShippingCharge("FREE");
			}
			else{
				order.setShippingCharge("50");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		double totalPrice = 0;
		sqlQuery = "select totalPrice from flipkart_order where orderNumber=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, orderNo);
			rs=ps.executeQuery();

			while(rs.next()){
				totalPrice+=rs.getDouble(1);
			}
			
			totalPrice+=shippingCharge;
			order.setTotalPrice(totalPrice);
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return order;
	}

	public static ArrayList<OrderDetails> getProductDetails(int userId, String orderNo){
		
		ArrayList<OrderDetails> orderedProducts = new ArrayList<OrderDetails>();
		
		sqlQuery = "select fc.categoryName, fi.itemID, fi.itemName, fo.status, fia.value, quantity, totalPrice " +
				"from flipkart_order fo, flipkart_item fi, flipkart_itemattributes fia, flipkart_category fc, " +
				"flipkart_product fp where fo.itemID=fi.itemID and fia.attribute='price' and fia.itemID=fo.itemID " +
				"and fc.categoryID=fp.categoryID and fp.productID=fi.productID and orderNumber=?;";
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, orderNo);
			rs=ps.executeQuery();
			
			while(rs.next()){
				OrderDetails product = new OrderDetails();
				product.setType(rs.getString(1));
				product.setItemID(rs.getInt(2));
				product.setItemName(rs.getString(3));
				product.setStatus(rs.getString(4));
				product.setItemPrice(Double.valueOf(rs.getString(5)));
				product.setQuantity(rs.getInt(6));
				product.setTotalPrice(rs.getDouble(7));
				
				orderedProducts.add(product);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return orderedProducts;
		
	}
	
}
