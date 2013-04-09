package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class OrderHistoryModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	public static ArrayList<String> getOrderNumberList(int userId){

		String emailID = UserPasswordModel.getUserEmailAddress(userId);
		ArrayList<String> orderList = new ArrayList<String>();

		sqlQuery = "select orderNumber from flipkart_order where emailAddress=?";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, emailID);
			rs=ps.executeQuery();

			while(rs.next()){
				orderList.add(rs.getString(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return orderList;	

	}

	public static ArrayList<OrderHistory> getOrderDetails(int userId, String orderNo){

		String emailID = UserPasswordModel.getUserEmailAddress(userId);
		ArrayList<OrderHistory> orderHistory = new ArrayList<OrderHistory>();

		sqlQuery = "select fo.itemID, itemName, quantity, totalPrice, status from flipkart_order fo, flipkart_item fi " +
				"where emailAddress=? and fo.itemID=fi.itemID and fo.orderNumber=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, emailID);
			ps.setString(2, orderNo);
			rs=ps.executeQuery();

			while(rs.next()){
				OrderHistory order = new OrderHistory();
				order.setItemID(rs.getInt(1));
				order.setItemName(rs.getString(2));
				order.setQuantity(rs.getInt(3));
				order.setItemPrice(rs.getDouble(4));
				order.setStatus(rs.getString(5));

				orderHistory.add(order);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return orderHistory;	

	}
	
	public static OrderHistory getOrderNumberTooltipContent(int userId, String orderNumber){
		String emailID = UserPasswordModel.getUserEmailAddress(userId);
		OrderHistory order = new OrderHistory();
		double totalPrice = 0;
		sqlQuery = "select createdOn, totalPrice, status from flipkart_order where emailAddress=? and orderNumber=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, emailID);
			ps.setString(2, orderNumber);
			rs=ps.executeQuery();

			while(rs.next()){
				order.setCreatedOn(rs.getDate(1));
				order.setItemPrice(rs.getDouble(2));
				order.setStatus(rs.getString(3));
				totalPrice+=order.getItemPrice();
				order.setTotalPrice(totalPrice);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return order;
	}
	
	
	public static ArrayList<OrderHistory> getOrderListTooltipContent(int userId, ArrayList<String> orderNumbers){
		
		ArrayList<OrderHistory> orderHistory = new ArrayList<OrderHistory>();
		
		for(int i = 0; i < orderNumbers.size(); i++){
			String orderNumber = orderNumbers.get(i);
			OrderHistory orderDetails = getOrderNumberTooltipContent(userId, orderNumber);
			orderHistory.add(orderDetails);
		}
		
		return orderHistory;
	}

}
