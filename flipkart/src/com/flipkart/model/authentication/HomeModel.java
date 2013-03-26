package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.flipkart.util.DbConnection;
import com.flipkart.util.MyLog;

/**
 * @author bril
 *
 */
public class HomeModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
	/**
	 * @return
	 */
	public ArrayList<String> getCategoryList() {
		ArrayList<String> categoryList  = new ArrayList<String>();
		sqlQuery = "select categoryName from flipkart_category where level = ?;";
		try{
			MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, 0);
			MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			while(rs.next()){
				categoryList.add(rs.getString(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return categoryList;
	}
	
	

}
