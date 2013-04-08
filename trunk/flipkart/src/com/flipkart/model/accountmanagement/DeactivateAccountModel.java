package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flipkart.util.DbConnection;

public class DeactivateAccountModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static String getEmailAddress(int userID) {
		sqlQuery = "select emailAddress from flipkart.flipkart_userinfo where userID = ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, userID);
			rs = ps.executeQuery();
			if (rs.next())
				return rs.getString("emailAddress");
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return "";

	}

	public static void deactivateAccount(int userID) {
		sqlQuery = "UPDATE `flipkart`.`flipkart_userinfo` SET `status`= ? WHERE `userID`= ?;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, 0);
			ps.setInt(2, userID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
