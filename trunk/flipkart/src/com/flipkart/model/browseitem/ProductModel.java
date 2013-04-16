package com.flipkart.model.browseitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.model.recommendation.RecentlyViewed;
import com.flipkart.util.DbConnection;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

/**
 * @author bril
 *
 */
public class ProductModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
	//get 5 items
	public Product getFiveItemDetails(Integer productID) {
		Product prod = new Product();
		sqlQuery = "select itemID, itemName, productID, thumbnail from flipkart_item where productID = ? LIMIT 1;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				prod.setItemID(rs.getInt(1));
				prod.setItemName(rs.getString(2));
				prod.setAvailableQuantity(rs.getInt(3));
				prod.setProductID(rs.getInt(4));
				prod.setThumbnail(rs.getString(5));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return prod;
	}

	
	//get any 5 products
	public ArrayList<Integer> getAnyFiveProductDetails(int catID) {
		ArrayList<Integer> pd = new ArrayList<>();	
		sqlQuery = "select productID from flipkart_product WHERE categoryID = ? LIMIT 5;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, catID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				pd.add(rs.getInt(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * funtion to fetch product details
	 * @param itemID
	 * @return
	 */
	public Product getProductDetails(Integer itemID) {
		Product prod = new Product();
		sqlQuery = "select itemID, itemName,availableQuantity, productID, thumbnail from flipkart_item where itemID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				prod.setItemID(rs.getInt(1));
				prod.setItemName(rs.getString(2));
				prod.setAvailableQuantity(rs.getInt(3));
				prod.setProductID(rs.getInt(4));
				prod.setThumbnail(rs.getString(5));
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
		sqlQuery = "select itemID, attribute, value from flipkart_itemattributes where itemID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			rs=ps.executeQuery();
			
			while(rs.next()){
				Attributes attribute = new Attributes();
				attribute.setItemID(rs.getInt(1));
				attribute.setAttribute(rs.getString(2));
				attribute.setValue(rs.getString(3));
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
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
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

	public ArrayList<Attributes> getVerySpecificProductAttributes(Integer itemID) {
		ArrayList<Attributes> attrib  = new ArrayList<Attributes>();
		sqlQuery = "SELECT itemID, attribute, value FROM flipkart_itemattributes WHERE itemID = ? AND priorityLevel IN ( 2 );";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			rs=ps.executeQuery();
			while(rs.next()){
				Attributes attribute = new Attributes();
				attribute.setItemID(rs.getInt(1));
				attribute.setAttribute(rs.getString(2));
				attribute.setValue(rs.getString(3));
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
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
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
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
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
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
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
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, ipAddr);
			ps.setInt(2, itemID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Integer> getRecentlyViewedItems(String ipAddr) {
		ArrayList<Integer> itemIDS  = new ArrayList<Integer>();
		sqlQuery = "SELECT DISTINCT itemID from flipkart_browsinghistory WHERE ipAddress = ? " +
				"ORDER BY browseTime DESC LIMIT 4";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, ipAddr);
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
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setInt(1, itemIDsForRecentlyViewedItems.get(i));
				//System.out.println(itemIDsForRecentlyViewedItems.get(i));
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
				"ORDER BY freq DESC LIMIT 3) AS items";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, ipAddr);
			rs=ps.executeQuery();
			while(rs.next()){
				itemIDS.add(rs.getInt(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return itemIDS;
	}

	public boolean getUserRating(Integer userID, Integer productID) {
		sqlQuery = "select * from flipkart_productrating where userID = ? AND productID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userID);
			ps.setInt(2, productID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				System.out.println("here");
				return true;
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	public boolean getUserReview(Integer userID, Integer productID) {
		sqlQuery = "select * from flipkart_productreview where userID = ? AND productID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userID);
			ps.setInt(2, productID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	public void putUserRating(Integer ratingStar, Integer userID,
			Integer productID) {
		sqlQuery = "INSERT INTO `flipkart`.`flipkart_productrating`"
				+ " (`ratingStar`, `userID`, `productID`) VALUES (?,?,?);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, ratingStar);
			ps.setInt(2,  userID);
			ps.setInt(3,  productID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void putUserReview(String reviewTitle, String reviewText,
			Integer productID, Integer userID) {
		sqlQuery = "INSERT INTO `flipkart`.`flipkart_productreview`"
				+ " (`reviewTitle`, `reviewText`, `productID`, `userID`) VALUES (?,?,?,?);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, reviewTitle);
			ps.setString(2,  reviewText);
			ps.setInt(3,  productID);
			ps.setInt(4,  userID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public boolean getUserWishList(Integer userID, Integer itemID) {
		sqlQuery = "select * from flipkart_wishlist where userID = ? AND itemID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userID);
			ps.setInt(2, itemID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<Variant> getVariantDetails(Integer productID, Integer itemID) {
		
		ArrayList<Variant> variantList = new ArrayList<Variant>();
		sqlQuery = "select itemName, itemID from flipkart_item where productID = ? AND itemID != ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
			ps.setInt(2, itemID);
			rs=ps.executeQuery();
			while(rs.next()){
				Variant variant = new Variant();
				variant.setVariantName(rs.getString(1));
				variant.setVariantID(rs.getInt(2));
				variantList.add(variant);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return variantList;
	}


	public ArrayList<Integer> getTrendingItemIDs(int num) {
		ArrayList<Integer> itemIDS  = new ArrayList<Integer>();
		sqlQuery = "SELECT  Count(itemID) as count, itemID from flipkart_order GROUP BY itemID" +
				" DESC ORDER BY count DESC LIMIT ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			while(rs.next()){
				itemIDS.add(rs.getInt(2));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return itemIDS;
	}	
}
