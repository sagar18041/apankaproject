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
	
	public static ArrayList<SearchList> fetchList(String category){
		ArrayList<SearchList> serList = new ArrayList<SearchList>();
		
		System.out.println("Coming to query");
		System.out.println("Parameter is " + category);
		if(category == null)
			{	System.out.println("Query for null value");
				sqlQuery = "SELECT distinct itemName AS field FROM fielditemview";
			}
		else 
		{System.out.println("Query for parameters");
			sqlQuery = "SELECT distinct itemName AS field FROM fielditemview where categoryName = '" + category + "'";
	
		}
			
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
