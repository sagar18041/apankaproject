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

	public static void getAllEntries(ArrayList<NetBanking> recordList) {
		NetBanking record;
		sqlQuery = "select * from flipkart.netbanking natural join flipkart.bank;";
		conn = DbConnection.getConnection();
		try {
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				record = new NetBanking();
				record.setAccountNumber(rs.getInt("accountNumber"));
				record.setBalance(rs.getFloat("balance"));
				record.setCustomerID(rs.getInt("customerID"));
				record.setCustomerName(rs.getString("customerName"));
				recordList.add(record);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
