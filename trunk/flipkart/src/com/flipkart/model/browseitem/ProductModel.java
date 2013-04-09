package com.flipkart.model.browseitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.w3c.dom.Attr;

import com.flipkart.model.recommendation.RecentlyViewed;
import com.flipkart.util.DbConnection;
import com.flipkart.util.MyLog;
import com.sun.org.apache.bcel.internal.classfile.Attribute;

/**
 * @author bril
 *
 */
public class ProductModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
	/**
	 * funtion to fetch product details
	 * @param itemID
	 * @return
	 */
	public Product getProductDetails(Integer itemID) {
		Product prod = new Product();
		sqlQuery = "select itemID, itemName, productID, thumbnail from flipkart_item where itemID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			if(rs.next()){
				prod.setItemID(rs.getInt(1));
				prod.setItemName(rs.getString(2));
				prod.setProductID(rs.getInt(3));
				prod.setThumbnail(rs.getString(4));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return prod;
	}

	/**
	 * function to fetch attributes
	 * @param itemID
	 * @return
	 */
	public ArrayList<Attributes> getProductAttributes(Integer itemID) {
		ArrayList<Attributes> attrib  = new ArrayList<Attributes>();
		sqlQuery = "select attribute, value from flipkart_itemattributes where itemID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			while(rs.next()){
				Attributes attribute = new Attributes();
				attribute.setAttribute(rs.getString(1));
				attribute.setValue(rs.getString(2));
				attrib.add(attribute);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return attrib;
	}	
	
	/**
	 * function to fetch specific attributes with priority 1 and 2 to display on browse page
	 * @param itemID
	 * @return
	 */
	public ArrayList<Attributes> getSpecificProductAttributes(Integer itemID) {
		ArrayList<Attributes> attrib  = new ArrayList<Attributes>();
		sqlQuery = "SELECT attribute, value FROM flipkart_itemattributes WHERE itemID = ? AND priorityLevel IN ( 1, 2 );";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			while(rs.next()){
				Attributes attribute = new Attributes();
				attribute.setAttribute(rs.getString(1));
				attribute.setValue(rs.getString(2));
				attrib.add(attribute);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return attrib;
	}

	/**
	 * function to fetch the reviews of product
	 * @param productID
	 * @return reviews (arrayList)
	 */
	public ArrayList<Review> getProductReview(Integer productID) {
		ArrayList<Review> reviews  = new ArrayList<Review>();
		sqlQuery = "SELECT rw.reviewTitle, rw.reviewText, rw.reviewDate, user.firstName FROM flipkart_productreview rw, " +
				"flipkart_userinfo user WHERE productID = ? AND rw.userID = user.userID;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			while(rs.next()){
				Review rw = new Review();
				rw.setReviewTitle(rs.getString(1));
				rw.setReviewText(rs.getString(2));
				rw.setReviewDate(rs.getDate(3));
				rw.setUserName(rs.getString(4));
				reviews.add(rw);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return reviews;
		
	}

	
	/** 
	 * functon to fetch productID of item
	 * @param itemID
	 * @return productID
	 */
	public Integer getProductID(Integer itemID) {
		Integer productID = null;
		sqlQuery = "select productID from flipkart_item where itemID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			if(rs.next()){
				productID = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return productID;
	}

	public ArrayList<Rating> getProductRating(Integer productID) {
		ArrayList<Rating> rating  = new ArrayList<Rating>();
		sqlQuery = "SELECT rat.ratingStar, user.firstName FROM flipkart_productrating rat, " +
				"flipkart_userinfo user WHERE productID = ? AND rat.userID = user.userID;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			while(rs.next()){
				Rating rt = new Rating();
				rt.setRatingStar(rs.getInt(1));
				rt.setUserName(rs.getString(2));
				rating.add(rt);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return rating;
	}

	public void putBrowingHistory(String ipAddr, Integer itemID) {
		sqlQuery = "INSERT INTO `flipkart`.`flipkart_browsinghistory`"
				+ " (`ipAddress`, `itemID`) VALUES (?,?);";
		MyLog.log("Query: " + sqlQuery);
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, ipAddr);
			ps.setInt(2, itemID);
			MyLog.log("after prepared statement");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Integer> getRecentlyViewedItems(String ipAddr) {
		ArrayList<Integer> itemIDS  = new ArrayList<Integer>();
		sqlQuery = "SELECT DISTINCT itemID from flipkart_browsinghistory WHERE ipAddress = ? " +
				"ORDER BY browseTime DESC LIMIT 2";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, ipAddr);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			while(rs.next()){
				itemIDS.add(rs.getInt(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return itemIDS;
	}

	public ArrayList<RecentlyViewed> getRecentlyViewedItems(
			ArrayList<Integer> itemIDsForRecentlyViewedItems) throws SQLException {
			ArrayList<RecentlyViewed> recentlyViewedItems = new ArrayList<RecentlyViewed>();
			for (int i= 0; i< itemIDsForRecentlyViewedItems.size(); i++) {
				PreparedStatement ps=null;
				ResultSet rs=null;
				String sqlQuery="";
				Connection conn = null;
				
			sqlQuery = "SELECT itm.itemID, itm.itemName, itm.thumbnail, attrib.value FROM flipkart_item itm, " +
					"flipkart_itemattributes attrib WHERE itm.itemID = attrib.itemID AND itm.itemID = ? AND attrib.attribute = 'price';";
			try{
				MyLog.log("SQL = " + sqlQuery);
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setInt(1, itemIDsForRecentlyViewedItems.get(i));
				//System.out.println(itemIDsForRecentlyViewedItems.get(i));
				MyLog.log("after prepared statement");
				rs=ps.executeQuery();
				if(rs.next()){
					RecentlyViewed rw = new RecentlyViewed();
					rw.setItemID(rs.getInt(1));
					rw.setItemName(rs.getString(2));
					//System.out.println(rs.getString(2));
					rw.setThumbnail(rs.getString(3));
					//System.out.println(rs.getString(3));
					rw.setPrice(rs.getString(4));
					//System.out.println(rs.getString(4));	
					recentlyViewedItems.add(rw);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			}
			return recentlyViewedItems;
	}

	public ArrayList<Integer> getbrowsedItems(String ipAddr) {
		ArrayList<Integer> itemIDS  = new ArrayList<Integer>();
		sqlQuery = "SELECT itemID FROM (SELECT itemID, COUNT( itemID ) AS freq, ipAddress " +
				"FROM flipkart_browsinghistory WHERE ipAddress = ? GROUP BY itemID " +
				"ORDER BY freq DESC LIMIT 2) AS items";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, ipAddr);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			while(rs.next()){
				itemIDS.add(rs.getInt(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return itemIDS;
	}	
}
