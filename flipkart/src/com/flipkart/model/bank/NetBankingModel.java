package com.flipkart.model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class NetBankingModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static void getAllEntries(ArrayList<Bank> recordList) {
		Bank record;
		sqlQuery = "select * from flipkart.netbanking natural join flipkart.bank;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				record = new Bank();
				record.setAccountNumber(rs.getString("accountNumber"));
				record.setBalance(rs.getString("balance"));
				record.setCustomerID(rs.getInt("customerID"));
				record.setCustomerName(rs.getString("customerName"));
				recordList.add(record);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static void getNonNetBankingCustomers(
			ArrayList<Bank> recordList) {
		Bank record;
		sqlQuery = "select * from bank where accountNumber not in (select accountNumber from netbanking);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				record = new Bank();
				record.setAccountNumber(rs.getString("accountNumber"));
				record.setBalance(rs.getString("balance"));
				record.setCustomerID(rs.getInt("customerID"));
				record.setCustomerName(rs.getString("customerName"));
				recordList.add(record);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public static void insertEntry(String accountNumber, String password) {

		sqlQuery = "INSERT INTO `flipkart`.`netbanking` (`accountNumber`, `password`) VALUES (?, ?);";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, accountNumber);
			ps.setString(2, password);
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public static void deleteEntry(String accountNumber) {

		sqlQuery = "DELETE FROM `flipkart`.`netbanking` WHERE `accountNumber`=?;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, accountNumber);
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
}
