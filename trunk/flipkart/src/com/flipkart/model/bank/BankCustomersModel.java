package com.flipkart.model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class BankCustomersModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static void getAllCustomers(ArrayList<BankCustomer> customerList) {

		BankCustomer customer;

		sqlQuery = "SELECT * FROM flipkart.bank;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				customer = new BankCustomer();
				customer.setAccountNumber(rs.getString("accountNumber"));
				customer.setBalance(rs.getString("balance"));
				customer.setCustomerID(rs.getInt("customerID"));
				customer.setCustomerName(rs.getString("customerName"));
				customerList.add(customer);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static void insertCustomer(BankCustomer customer) {

		sqlQuery = "INSERT INTO `flipkart`.`bank` "
				+ "(`customerName`, `accountNumber`, `balance`) VALUES (?, ?, ?);";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, customer.getCustomerName());
			ps.setString(2, customer.getAccountNumber());
			ps.setString(3, customer.getBalance());
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	/* 'isExisting' returns true if accountNumber already exists. */
	public static boolean isExisting(String accountNumber) {

		sqlQuery = "select * from flipkart.bank where accountNumber = ?;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, accountNumber);
			rs = ps.executeQuery();
			if (rs.next())
				return true;

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;

	}

	public static void deleteCustomer(String accountNumber) {

		sqlQuery = "DELETE FROM `flipkart`.`bank` WHERE `accountNumber`=?;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, accountNumber);
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public static void getOneCustomer(BankCustomer customer) {
		sqlQuery = "select * from flipkart.bank where accountNumber = ?;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, customer.getAccountNumber());
			rs = ps.executeQuery();
			if (rs.next()) {
				customer.setCustomerName(rs.getString("customerName"));
				customer.setCustomerID(rs.getInt("customerID"));
				customer.setBalance(rs.getString("balance"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	/*
	 * The function edits balance. returns 0 when insufficient funds. returns 1
	 * on success. returns 2 on database error.
	 */
	public static int editBalance(String accountNumber, String credit,
			String debit, String balance) {

		float creditAmount;
		float debitAmount;
		float currentBalance;

		if (credit.equals("")) {
			creditAmount = 0;
		} else {
			creditAmount = Float.parseFloat(credit);
		}

		if (debit.equals("")) {
			debitAmount = 0;
		} else {
			debitAmount = Float.parseFloat(debit);
		}

		currentBalance = Float.parseFloat(balance);

		if (currentBalance + creditAmount < debitAmount)
			return 0;

		currentBalance = (currentBalance + creditAmount) - debitAmount;

		sqlQuery = "UPDATE `flipkart`.`bank` SET `balance`=? WHERE `accountNumber`=?;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			ps.setFloat(1, currentBalance);
			ps.setString(2, accountNumber);
			ps.executeUpdate();
			return 1;
		} catch (SQLException e) {

			e.printStackTrace();
			return 2;
		}

	}

}
