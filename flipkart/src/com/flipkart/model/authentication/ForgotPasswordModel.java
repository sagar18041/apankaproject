package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flipkart.util.DbConnection;

public class ForgotPasswordModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static void deleteIfPresent(String emailAddress) {
		sqlQuery = "delete FROM flipkart.flipkart_password_change_requests"
				+ " where userID = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, LoginModel.getUserID(emailAddress));
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void saveRequest(String emailAddress) {
		sqlQuery = "INSERT INTO `flipkart`.`flipkart_password_change_requests` "
				+ "(`userID`) VALUES (?);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, LoginModel.getUserID(emailAddress));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static String getLink(String emailAddress) {
		String link = "";
		sqlQuery = "select requestID FROM flipkart.flipkart_password_change_requests"
				+ " where userID = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, LoginModel.getUserID(emailAddress));
			rs = ps.executeQuery();
			if (rs.next())
				return "http://localhost:8080/flipkart/test?requestID="
						+ rs.getInt(1);
			else
				return link;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return link;

	}

}
