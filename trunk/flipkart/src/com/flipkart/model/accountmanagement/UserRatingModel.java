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
				
				ratings.add(rating);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ratings;
	}

}
