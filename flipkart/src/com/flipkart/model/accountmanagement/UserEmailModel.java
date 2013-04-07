package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flipkart.util.DbConnection;

public class UserEmailModel {
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	public static String getLink(String emailAddress) {
		String link ="http://localhost:8080/flipkart/emailupdate?newEmailAddress="+emailAddress;
		return link;
	}
	
	public static int modifyEmail(String newEmailAddress, String oldEmailAddress, int userId){
		int result=0;
		
		try{
			sqlQuery = "update flipkart_userinfo set emailAddress=? where userID=?;";
			
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, newEmailAddress);
			ps.setInt(2, userId);
			result=ps.executeUpdate();
			
			sqlQuery = "update flipkart_order set emailAddress=? where emailAddress=?;";
			
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, newEmailAddress);
			ps.setString(2, oldEmailAddress);
			result=ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
