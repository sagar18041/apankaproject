package com.flipkart.model.stockmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class StockmanagementModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;
	static ArrayList<Stockmanagement> allItems=new ArrayList<Stockmanagement>();

	//ThresholdFlag = 1 means REORDER REQUESTED
	public static ArrayList<Stockmanagement> fetchAllItems(){
		allItems.clear();
		sqlQuery = "select itemID,itemName,availableQuantity from flipkart_item where thresholdflag=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, 1);
			rs=ps.executeQuery();

			while(rs.next()){
				Stockmanagement obj=new Stockmanagement();
				obj.setItemID(rs.getInt(1));
				obj.setItemName(rs.getString(2));
				obj.setAvailableQuantity(rs.getInt(3));
				obj.setPrice(getItemPrice(rs.getInt(1)));
				allItems.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return allItems;
	}

	public static int getItemPrice(int itemID){
		PreparedStatement pes = null;
		ResultSet res = null;
		String sqlQuery1 = "";
		Connection conn1 = null;
		try{
			sqlQuery1 = "select value from flipkart_itemattributes where itemID=? and attribute='Price';";
			conn1=DbConnection.getConnection();
			pes=conn1.prepareStatement(sqlQuery1);
			pes.setInt(1, itemID);
			res=pes.executeQuery();

			if(res.next()){
				return res.getInt(1);
				//System.out.println("item attributes   "+res.getString(1)+"::::"+res.getString(2));
			}
		}

		catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	public static void updateQuantityInStock(int itemID,int newQuantity){

			System.out.println("in updateQuantityInStock: newQty"+newQuantity);
		sqlQuery="update flipkart_item set availableQuantity=?,thresholdflag=? where itemID=?;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, newQuantity);
			ps.setInt(2, 0); //ThresholdFlag = 0 means NO REORDER REQUESTED
			ps.setInt(3, itemID);
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static void insertTransaction(int itemID,int price,int quantity){

		System.out.println("in insert transaction: price, qty: "+price+ " "+quantity);
		
		sqlQuery="INSERT INTO flipkart_sellertransaction (sellerID,itemID,quantity,totalPrice) " +
				"VALUES (?,?,?,?);";
		try {
			conn=DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, 1);
			ps.setInt(2, itemID);
			ps.setInt(3, quantity);
			ps.setInt(4, price * quantity);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static ArrayList<Stockmanagement> getItemsBelowThreshold() {

		allItems.clear();

		//assuming thresholdLevel to be 10
		sqlQuery = "SELECT itemID, itemName, availableQuantity FROM flipkart_item A WHERE " +
				"availableQuantity<=10 AND itemID IN " +
				"(SELECT itemID FROM flipkart_itemattributes WHERE attribute='price');";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				Stockmanagement obj=new Stockmanagement();
				obj.setItemID(rs.getInt(1));
				obj.setItemName(rs.getString(2));
				obj.setAvailableQuantity(rs.getInt(3));
				allItems.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return allItems;
	}


	public static ArrayList<Stockmanagement> getSellerInfo() {

		ArrayList<Stockmanagement> sellers = new ArrayList<Stockmanagement>(); 

		sqlQuery = "SELECT sellerID, sellerName, sellerEmailID FROM flipkart_seller;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				Stockmanagement obj=new Stockmanagement();
				obj.setSellerID(rs.getInt(1));
				obj.setSellerName(rs.getString(2));
				obj.setSellerEmail(rs.getString(3));
				sellers.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return sellers;
	}

	public static Stockmanagement getItemInfo(int itemID) {

		Stockmanagement item = new Stockmanagement(); 

		sqlQuery = "SELECT itemName, value FROM flipkart_item A, flipkart_itemattributes B " +
				"WHERE A.itemID=B.itemID AND attribute='Price' AND A.itemID=?";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			rs=ps.executeQuery();

			while(rs.next()){

				item.setItemID(itemID);
				item.setItemName(rs.getString(1));
				item.setPrice(rs.getInt(2));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return item;
	}

/*	//ThresholdFlag = 0 means NO REORDER REQUESTED
	public static void SetThresholdFlag0(int tempItemID) {

		sqlQuery="UPDATE flipkart_item SET thresholdflag=0 where itemID=?;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, tempItemID);
			ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
*/
	//ThresholdFlag = 1 means REORDER is REQUESTED
	public static void SetThresholdFlag1(int tempItemID) {

		sqlQuery="UPDATE flipkart_item SET thresholdflag=1 where itemID=?;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, tempItemID);
			ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
