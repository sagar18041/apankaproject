package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;


/**
 * @author neha
 * This method is used to fetch all the searchable field values
 * @return arrayList of search values 
 */
public class SearchListModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	public static ArrayList<SearchList> fetchList(){
		ArrayList<SearchList> serList = new ArrayList<SearchList>();
		
		sqlQuery = "SELECT itemName AS field FROM flipkart_item UNION SELECT value AS field FROM flipkart_itemattributes";
		
		System.out.println("SQL query is " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchList sList = new SearchList();
				sList.setFieldValue(rs.getString("field"));
				
				serList.add(sList);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return serList;
	}
}
