package com.flipkart.model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class TransactionModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	public static void getAllTransactions(
			ArrayList<Transactions> transactionList) {

		sqlQuery = "SELECT * FROM flipkart.banktransaction;";
		conn = DbConnection.getConnection();
		Transactions transaction;

		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();

			while (rs.next()) {

				transaction = new Transactions();
				transaction.setAmount(rs.getString("amount"));
				transaction.setCustomerID(rs.getString("customerID"));
				transaction.setOrderID(rs.getString("orderID"));
				transaction.setPaymentType(rs.getString("paymentType"));
				transaction.setTransactionID(rs.getString("transactionID"));
				transaction.setTransactionTime(rs.getString("transactionTime"));
				transactionList.add(transaction);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
}
