package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flipkart.util.DbConnection;

public class SignUpModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	/*
	 * Checks whether the user already exists. If yes returns true. If the user
	 * already exists, the account will not be created.
	 */
	public static boolean checkUser(String emailAddress) {

		sqlQuery = "select emailAddress from flipkart.flipkart_userinfo "
				+ "where emailAddress = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, emailAddress);
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

	public static void createAccount(String emailAddress, String password) {
		sqlQuery = "INSERT INTO `flipkart`.`flipkart_userinfo`"
				+ " (`password`, `emailAddress`, `role`) VALUES (?,?,?);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, password);
			ps.setString(2, emailAddress);
			ps.setInt(3, 0);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
