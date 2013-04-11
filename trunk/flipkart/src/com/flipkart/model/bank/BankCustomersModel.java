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

}
