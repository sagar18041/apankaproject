package com.flipkart.model.placeorder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.model.cartmanagement.Cart;
import com.flipkart.util.DbConnection;

public class OrderModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	
	/**********************************************************
	 * This method is used to get the subtotal price of all
	 * items that the user wishes to buy.
	 * @param itemID - ArrayList of items ids of all items
	 * @return subTotal
	 **********************************************************/
	public static double calculateSubTotal(ArrayList<Cart> cartList) {

		ArrayList<Double> priceList = new ArrayList<Double>();

		for(int i=0; i<cartList.size(); i++) {
			sqlQuery = "select value from flipkart_itemattributes where itemID = ? and attribute='price'";
			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setInt(1, cartList.get(i).getItemID());
				rs=ps.executeQuery();

				while(rs.next()){
					double price = 0.0;
					price = rs.getDouble(1)*cartList.get(i).getQuantity();

					priceList.add(price);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		double subTotal = 0.0;
		for(int i=0; i<priceList.size(); i++) {
			subTotal += priceList.get(i);
		}

		return subTotal;
	}
}
