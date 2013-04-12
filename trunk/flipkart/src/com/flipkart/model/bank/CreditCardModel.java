package com.flipkart.model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class CreditCardModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static void getAllEntries(ArrayList<Card> recordList) {
		Card record;
		sqlQuery = "select * from flipkart.creditcard natural join flipkart.bank;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				record = new Card();
				record.setAccountNumber(rs.getString("accountNumber"));
				record.setBalance(rs.getString("balance"));
				record.setCustomerID(rs.getString("customerID"));
				record.setCustomerName(rs.getString("customerName"));
				record.setCardNumber(rs.getString("cardNumber"));
				record.setCvv(rs.getString("cvv"));
				record.setExpiry(rs.getString("expiryMonth") + "/"
						+ rs.getString("expiryYear"));
				record.setCreditLimit(rs.getString("creditLimit"));
				recordList.add(record);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static void getNonCCCustomers(ArrayList<BankCustomer> recordList) {
		BankCustomer record;
		sqlQuery = "select * from flipkart.bank where accountNumber "
				+ "not in (select accountNumber from flipkart.creditcard);";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				record = new BankCustomer();
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

	public static void insertCCEntry(Card DBCard, String expiryMonth,
			String expiryYear) {

		sqlQuery = "INSERT INTO `flipkart`.`creditcard` "
				+ "(`cardNumber`, `cvv`, `expiryMonth`, `expiryYear`, `accountNumber`, `creditLimit`, `password`) "
				+ "VALUES (?, ?, ?, ?, ?, ?,?);";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, DBCard.getCardNumber());
			ps.setString(2, DBCard.getCvv());
			ps.setString(3, expiryMonth);
			ps.setString(4, expiryYear);
			ps.setString(5, DBCard.getAccountNumber());
			ps.setString(6, DBCard.getCreditLimit());
			ps.setString(7, DBCard.getPassword());
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public static boolean isExisting(String cardNumber) {
		sqlQuery = "SELECT * FROM flipkart.creditcard where cardNumber = ?;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, cardNumber);
			rs = ps.executeQuery();
			if (rs.next())
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;

	}

	public static void deleteCCEntry(String accountNumber) {
		sqlQuery = "DELETE FROM `flipkart`.`creditcard` WHERE `accountNumber`=?;";

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
