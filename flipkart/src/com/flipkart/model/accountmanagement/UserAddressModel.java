package com.flipkart.model.accountmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.model.accountmanagement.UserAddress;
import com.flipkart.util.DbConnection;

public class UserAddressModel {
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	public static String getUserName(int userId) {
		
		String name="";
		
		sqlQuery = "select concat(firstName,' ',lastName) from flipkart_userinfo where userID=?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			rs=ps.executeQuery();
			
			while(rs.next()){
				name=rs.getString(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return name;
	}
	
	public static ArrayList<UserAddress> fetchAddrList(int userId) {

		ArrayList<UserAddress> addrList = new ArrayList<UserAddress>();

		sqlQuery = "select addressID, name, streetAddress, landmark, city, stateName, pincode, phoneNumber from flipkart_shippingaddress sa, flipkart_state s where userID = ? and sa.stateID = s.stateID";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, userId);
			rs=ps.executeQuery();

			while(rs.next()){
				UserAddress addr = new UserAddress();
				addr.setAddressID(rs.getInt(1));
				addr.setName(rs.getString(2));
				addr.setStreetAddress(rs.getString(3));
				if(!rs.getString(4).equals("")) {
					addr.setLandmark(", "+rs.getString(4));
				}
				addr.setCity(rs.getString(5));
				addr.setStateName(rs.getString(6));
				addr.setPincode(rs.getString(7));
				addr.setPhoneNumber(rs.getString(8));

				addrList.add(addr);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return addrList;
	}

	public static ArrayList<String> fetchStateList() {

		ArrayList<String> stateList = new ArrayList<String>();
		sqlQuery = "select stateName from flipkart_state order by stateName";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				stateList.add(rs.getString(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return stateList;
	}

	public static int insertShippingAddress(UserAddress addr, int userId) {

		int stateid=0;

		sqlQuery = "select stateID from flipkart_state where stateName='"+addr.getStateName()+"'";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			if(rs.next()){
				stateid = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		System.out.println("**********stateid****"+stateid);
		int result=0;
		sqlQuery = "insert into flipkart_shippingaddress(name, streetAddress, landmark, city, stateID, pincode, phoneNumber, userID) " +
				"values(?,?,?,?,?,?,?,?);";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getStreetAddress());
			ps.setString(3, addr.getLandmark());
			ps.setString(4, addr.getCity());
			ps.setInt(5, stateid);
			ps.setString(6, addr.getPincode());
			ps.setString(7, addr.getPhoneNumber());
			ps.setInt(8, userId);

			result=ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteShippingAddress(int addressId, int userId) {

		int result=0;
		sqlQuery = "delete from flipkart_shippingaddress where addressID = ? and userID = ? ;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, addressId);
			ps.setInt(2, userId);

			result=ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}


}
