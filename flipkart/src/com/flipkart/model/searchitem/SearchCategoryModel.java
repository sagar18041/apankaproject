package com.flipkart.model.searchitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.util.DbConnection;


/**
 * @author neha
 * This method fetches the list of categories and count of items on searchText and category.
 *  This is shown on the left side of the na-bar of the page
 *  @return array list of categories
 */
public class SearchCategoryModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	/**
	 * @param searchText
	 * This method is used when "all the category" is selected
	 * @return Arraylist of category and number of items
	 */
	public ArrayList<SearchCategory> fetchForAllCat(String searchText){
		ArrayList<SearchCategory> searchCat = new ArrayList<SearchCategory>();
		
		sqlQuery = "select categoryName , count(itemID) as noOfItems from fielditemview where upper(itemName) like upper('%" +
		searchText + "%')";
		
		System.out.println("SQL query is " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return searchCat;
	}
}
