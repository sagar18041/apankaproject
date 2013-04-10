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

	public static void getAllCustomers(ArrayList<Bank> customerList) {

		Bank customer;

		sqlQuery = "SELECT * FROM flipkart.bank;";
		conn = DbConnection.getConnection();

		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				customer = new Bank();
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

}
