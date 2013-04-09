package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flipkart.util.DbConnection;

public class UserPasswordModel {
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	public static String getUserEmailAddress(int userId){
		String email="";
		sqlQuery = "select emailAddress from flipkart_userinfo where userID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()){
				email=rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return email;
	}
	
	public static String getUserPassword(int userId){
		String password="";
		sqlQuery = "select password from flipkart_userinfo where userID = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()){
				password=rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return password;
	}
	
	public static int updateUserPassword(String password, int userId){
		int result=0;
		sqlQuery = "update flipkart_userinfo set password = ? where userID = ?;";
		try{
			
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, password);
			ps.setInt(2, userId);
			result = ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
