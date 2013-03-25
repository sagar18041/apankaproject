package com.flipkart.model.placeorder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;

public class ShippingAddressModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	/**********************************************************
	 * This method is used to fetch the list of all shipping
	 * addresses of the registered user.
	 * @param uid - user id of the registered user
	 * @return address list
	 **********************************************************/
	public static ArrayList<ShippingAddress> fetchAddrList(int uid) {

		ArrayList<ShippingAddress> addrList = new ArrayList<ShippingAddress>();

		sqlQuery = "select name, streetAddress, landmark, city, stateName, pincode, phoneNumber from flipkart_shippingaddress sa, flipkart_state s where userID = ? and sa.stateID = s.stateID";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, uid);
			rs=ps.executeQuery();

			while(rs.next()){
				ShippingAddress addr = new ShippingAddress();
				addr.setName(rs.getString(1));
				addr.setStreetAddress(rs.getString(2));
				if(!rs.getString(3).equals("")) {
					addr.setLandmark(", "+rs.getString(3));
				}
				addr.setCity(rs.getString(4));
				addr.setStateName(rs.getString(5));
				addr.setPincode(rs.getString(6));
				addr.setPhoneNumber(rs.getString(7));

				addrList.add(addr);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return addrList;
	}

	/***************************************************************
	 * This method is used to fetch the list of all states present
	 * in the database
	 * @return state list
	 ***************************************************************/
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

}
