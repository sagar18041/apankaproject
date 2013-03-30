package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flipkart.util.DbConnection;
import com.flipkart.util.MyUtilityFunctions;

public class ForgotPasswordModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static void deleteIfPresent(String emailAddress) {
		sqlQuery = "delete FROM flipkart.flipkart_password_change_requests"
				+ " where emailAddress = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, emailAddress);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void saveRequest(String emailAddress) {
		sqlQuery = "INSERT INTO flipkart.flipkart_password_change_requests "
				+ "(requestID,emailAddress) VALUES (?,?);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, MyUtilityFunctions.createVerificationUrl());
			ps.setString(2, emailAddress);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static String getLink(String emailAddress) {
		String link = "";
		sqlQuery = "select requestID FROM flipkart.flipkart_password_change_requests"
				+ " where emailAddress = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, emailAddress);
			rs = ps.executeQuery();
			if (rs.next())
				return "http://localhost:8080/flipkart/recoverpassword?requestID="
						+ rs.getString(1);
			else
				return link;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return link;

	}

	public static boolean isValidLink(String requestID) {

		sqlQuery = "select * from flipkart.flipkart_password_change_requests "
				+ "where requestID = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, requestID);
			rs = ps.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static String getEmailAddress(String requestID) {
		String emailAddress = "";
		sqlQuery = "select emailAddress from flipkart.flipkart_password_change_requests "
				+ "where requestID = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, requestID);
			rs = ps.executeQuery();
			if (rs.next())
				emailAddress = rs.getString("emailAddress");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return emailAddress;
	}

	public static void resetPassword(String emailAddress, String password) {
		sqlQuery = "UPDATE `flipkart`.`flipkart_userinfo`"
				+ " SET `password`= ? WHERE `userID`= ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, MyUtilityFunctions.generateMD5(password));
			ps.setInt(2, LoginModel.getUserID(emailAddress));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
