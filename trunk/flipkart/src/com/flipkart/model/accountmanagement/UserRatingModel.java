package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.flipkart.util.DbConnection;

public class UserRatingModel {
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	public static ArrayList<UserRating> getUserRatings(int userId){
		ArrayList<UserRating> ratings = new ArrayList<UserRating>();
		
		sqlQuery = "select distinct productID, ratingStar from flipkart_productrating where userID=?";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			rs=ps.executeQuery();
			
			while(rs.next()){
				UserRating rating = new UserRating();
				rating.setProductID(rs.getInt(1));
				rating.setRatingStar(rs.getInt(2));
				
				ResultSet innerset = null;
				PreparedStatement innerps = null;
				String innerQuery = "select fi.itemID, fp.productName, fia.value, fi.thumbnail " +
									"from flipkart_item fi, flipkart_itemattributes fia, flipkart_product fp " +
									"where fp.productID=fi.productID and fia.itemID=fi.itemID and fia.attribute='Price' " +
									"and fp.productID=? limit 1;";
				innerps=conn.prepareStatement(innerQuery);
				innerps.setInt(1, rating.getProductID());
				innerset=innerps.executeQuery();
				
				while(innerset.next()){
					rating.setProductName(innerset.getString(2));
					rating.setPrice(innerset.getString(3));
					rating.setThumbnail(innerset.getString(4));
					rating.setProductID(innerset.getInt(1));
					ratings.add(rating);
					
				}
							
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ratings;
	}

}
