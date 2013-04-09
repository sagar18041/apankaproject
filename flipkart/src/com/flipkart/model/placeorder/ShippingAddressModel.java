package com.flipkart.model.placeorder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.flipkart.util.DbConnection;
import com.opensymphony.xwork2.ActionContext;

public class ShippingAddressModel {

	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;

	/**********************************************************
	 * This method is used to fetch the list of all shipping addresses of the
	 * registered user.
	 * 
	 * @param uid
	 *            - user id of the registered user
	 * @return address list
	 **********************************************************/
	public static ArrayList<ShippingAddress> fetchAddrList(int uid) {

		ArrayList<ShippingAddress> addrList = new ArrayList<ShippingAddress>();

		sqlQuery = "select addressID, name, streetAddress, landmark, city, stateName, pincode, phoneNumber from flipkart_shippingaddress sa, flipkart_state s where userID = ? and sa.stateID = s.stateID";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, uid);
			rs = ps.executeQuery();

			while (rs.next()) {
				ShippingAddress addr = new ShippingAddress();
				addr.setAddressID(rs.getInt(1));
				addr.setName(rs.getString(2));
				addr.setStreetAddress(rs.getString(3));
				if (!rs.getString(4).equals("")) {
					addr.setLandmark(", " + rs.getString(4));
				}
				addr.setCity(rs.getString(5));
				addr.setStateName(rs.getString(6));
				addr.setPincode(rs.getString(7));
				addr.setPhoneNumber(rs.getString(8));

				addrList.add(addr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addrList;
	}

	/***************************************************************
	 * This method is used to fetch the list of all states present in the
	 * database
	 * 
	 * @return state list
	 ***************************************************************/
	public static ArrayList<String> fetchStateList() {

		ArrayList<String> stateList = new ArrayList<String>();
		sqlQuery = "select stateName from flipkart_state order by stateName";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();

			while (rs.next()) {
				stateList.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return stateList;
	}

	/************************************************************
	 * This method is used to insert shipping address for a particular user.
	 * 
	 * @param addr
	 *            shipping address
	 * @return addressID of the newly added address
	 ***********************************************************/
	public static int insertShippingAddress(ShippingAddress addr) {

		Map sess = ActionContext.getContext().getSession();
		int stateid = 0;

		sqlQuery = "select stateID from flipkart_state where stateName='"
				+ addr.getStateName() + "'";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			rs = ps.executeQuery();

			if (rs.next()) {
				stateid = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		sqlQuery = "insert into flipkart_shippingaddress(name, streetAddress, landmark, city, stateID, pincode, phoneNumber, userID) "
				+ "values(?,?,?,?,?,?,?,?);";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, addr.getName());
			ps.setString(2, addr.getStreetAddress());
			ps.setString(3, addr.getLandmark());
			ps.setString(4, addr.getCity());
			ps.setInt(5, stateid);
			ps.setString(6, addr.getPincode());
			ps.setString(7, addr.getPhoneNumber());
			ps.setInt(8, Integer.parseInt(sess.get("userID").toString()));

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		int addressID = 0;System.out.println("userID:::::"+sess.get("userID").toString());
		sqlQuery = "select max(addressID) from flipkart_shippingaddress where userID=?";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, Integer.parseInt(sess.get("userID").toString()));
			rs = ps.executeQuery();

			if (rs.next()) {
				addressID = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addressID;
	}

	/********************************************************************
	 * This method is used to find all order entries(processing)in the Order
	 * table for the currently-logged in user.
	 * 
	 * @param emailID
	 * @return
	 ********************************************************************/
	public static ArrayList<Integer> findAllOrders(String emailID) {

		ArrayList<Integer> items = new ArrayList<Integer>();

		sqlQuery = "select itemID from flipkart_order where orderNumber=? and emailAddress=? and status='Processing'";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			if (ActionContext.getContext().getSession().get("OrderNum") != null) {
				ps.setString(1,
						ActionContext.getContext().getSession().get("OrderNum")
								.toString());
			}
			ps.setString(2, emailID);
			rs = ps.executeQuery();

			while (rs.next()) {
				items.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;
	}

	/**************************************************************
	 * This method is used to delete an item entry(Processing) in the Order
	 * table for the currently logged-in user.
	 * 
	 * @param itemID
	 * @param emailID
	 *************************************************************/
	public static void deleteItemOrder(int itemID, String emailID) {
		sqlQuery = "delete from flipkart_order where orderNumber=? and itemID=? and emailAddress=? and status='Processing'";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1,
					ActionContext.getContext().getSession().get("OrderNum")
							.toString());
			ps.setInt(2, itemID);
			ps.setString(3, emailID);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*************************************************************************
	 * This method is used to insert an item order entry, if it doesn't exist or
	 * updates the entry if it exists in the Order table.
	 * 
	 * @param order
	 ************************************************************************/
	public static void insertOrder(Order order) {

		sqlQuery = "select orderNumber from flipkart_order where orderNumber=? and itemID=? and emailAddress=? and status='Processing'";
		try {
			conn = DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setString(1, order.getOrderNumber());
			ps.setInt(2, order.getItemID());
			ps.setString(3, order.getEmailAddress());
			rs = ps.executeQuery();

			if (rs.next()) {
				order.setOrderNumber(rs.getString(1));
				sqlQuery = "update flipkart_order set addressID=?, quantity=?, totalPrice=?, shippingCharge=? where orderNumber=? and itemID=?";

				conn = DbConnection.getConnection();
				ps = conn.prepareStatement(sqlQuery);
				ps.setInt(1, order.getAddressID());
				ps.setInt(2, order.getQuantity());
				ps.setDouble(3, order.getTotalPrice());
				ps.setDouble(4, order.getShippingCharge());
				ps.setString(5, order.getOrderNumber());
				ps.setInt(6, order.getItemID());

				ps.executeUpdate();

			} else {System.out.println("address-id:::"+order.getAddressID());
				sqlQuery = "insert into flipkart_order(orderNumber, itemID, quantity, totalPrice, emailAddress, addressID, status, shippingCharge) "
						+ "values(?,?,?,?,?,?,?,?);";

				conn = DbConnection.getConnection();
				ps = conn.prepareStatement(sqlQuery);
				ps.setString(1, order.getOrderNumber());
				ps.setInt(2, order.getItemID());
				ps.setInt(3, order.getQuantity());
				ps.setDouble(4, order.getTotalPrice());
				ps.setString(5, order.getEmailAddress());
				ps.setInt(6, order.getAddressID());
				ps.setString(7, order.getStatus());
				ps.setDouble(8, order.getShippingCharge());

				ps.executeUpdate();

				ActionContext.getContext().getSession().remove("OrderNum");
				ActionContext.getContext().getSession()
						.put("OrderNum", order.getOrderNumber());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
