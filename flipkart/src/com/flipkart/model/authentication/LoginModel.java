package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flipkart.util.DbConnection;

public class LoginModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static boolean isAuthentic(String emailAddress, String password) {

		sqlQuery = "SELECT * FROM flipkart.flipkart_userinfo where "
				+ "emailAddress = ? and " + "password = ?;";

		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, emailAddress);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next())
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;

	}

	public static int getUserID(String emailAddress) {

		sqlQuery = "SELECT userID FROM flipkart.flipkart_userinfo"
				+ " where emailAddress = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, emailAddress);
			rs = ps.executeQuery();
			if (rs.next())
				return rs.getInt(1);
			else
				return 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static void setStatus(int userID) {
		sqlQuery = "UPDATE `flipkart`.`flipkart_userinfo` SET `status`= ? WHERE `userID`= ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, 1);
			ps.setInt(2, userID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
