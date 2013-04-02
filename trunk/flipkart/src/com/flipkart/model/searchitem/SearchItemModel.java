package com.flipkart.model.searchitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author neha
 * This method is used to fetch the items for the search text and category
 * @return returns the arraylist of the item list
 */
public class SearchItemModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
}
