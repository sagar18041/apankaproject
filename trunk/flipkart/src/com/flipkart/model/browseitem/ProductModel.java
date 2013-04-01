package com.flipkart.model.browseitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.w3c.dom.Attr;

import com.flipkart.util.DbConnection;
import com.flipkart.util.MyLog;
import com.sun.org.apache.bcel.internal.classfile.Attribute;

/**
 * @author bril
 *
 */
public class ProductModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
	/**
	 * funtion to fetch product details
	 * @param itemID
	 * @return
	 */
	public Product getProductDetails(Integer itemID) {
		Product prod = new Product();
		sqlQuery = "select itemID, itemName, productID from flipkart_item where itemID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			if(rs.next()){
				prod.setItemID(rs.getInt(1));
				prod.setItemName(rs.getString(2));
				prod.setProductID(rs.getInt(3));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return prod;
	}

	/**
	 * function to fetch attributes
	 * @param itemID
	 * @return
	 */
	public ArrayList<Attributes> getProductAttributes(Integer itemID) {
		ArrayList<Attributes> attrib  = new ArrayList<Attributes>();
		sqlQuery = "select attribute, value from flipkart_itemattributes where itemID = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			while(rs.next()){
				Attributes attribute = new Attributes();
				attribute.setAttribute(rs.getString(1));
				attribute.setValue(rs.getString(2));
				attrib.add(attribute);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return attrib;
	}	
}
