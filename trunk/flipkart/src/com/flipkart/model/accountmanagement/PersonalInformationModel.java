package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flipkart.util.DbConnection;
import com.flipkart.util.DbManager;
import com.flipkart.util.MyLog;

public class PersonalInformationModel {
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	public static PersonalInformation getUserInformation(int userId){
		PersonalInformation pi = new PersonalInformation();
		sqlQuery = "select firstName, lastName, contactNumber, gender from flipkart_userinfo where userID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			while(rs.next()){
				pi.setFirstName(rs.getString(1));
				pi.setLastName(rs.getString(2));
				pi.setMobileNumber(rs.getString(3));
				pi.setGender(rs.getString(4));
			}
			
			MyLog.log("after adding personal info in the PersonalInformation object");
		}catch(Exception e){
			e.printStackTrace();
		}
		return pi;
	}
	
	public static int updateUserInformation(PersonalInformation pi, int userId){
		int result=0;
		sqlQuery = "update flipkart_userinfo set firstName = ?, lastName = ?, contactNumber = ?, gender = ? where userID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, pi.getFirstName());
			ps.setString(2, pi.getLastName());
			ps.setString(3, pi.getMobileNumber());
			ps.setString(4, pi.getGender());
			ps.setInt(5, userId);
			MyLog.log("after prepared statement");
			result = ps.executeUpdate();
			
			MyLog.log("after changing personal info in the PersonalInformation object");
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
