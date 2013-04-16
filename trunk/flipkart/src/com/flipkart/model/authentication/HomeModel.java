package com.flipkart.model.authentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.flipkart.util.DbConnection;

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
			//MyLog.log("SQL = " + sqlQuery);
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, 0);
			//MyLog.log("after prepared statement");
			rs=ps.executeQuery();
			
			while(rs.next()){
				categoryList.add(rs.getString(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return categoryList;
	}
	

	/**
	 * To fetch list of categories and subcategories
	 * @return catalogue list
	 * @throws SQLException 
	 */
	public ArrayList<Catalogue> getCatalogueList() throws SQLException {
		ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
		sqlQuery = "select fc.categoryName, fp.categoryID, fp.parentID, fp.level " +
				"from flipkart_category fc, flipkart_path fp where fc.categoryID = fp.categoryID;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				
				//sets value to catalogue POJO class object
				Catalogue catalogueDetails = new Catalogue();
				catalogueDetails.setCatalogueName(rs.getString(1));
				catalogueDetails.setCatalogueParentID(rs.getInt(2));
				catalogueDetails.setCatalogueID(rs.getInt(3));
				catalogueDetails.setCatalogueLevel(rs.getInt(4));
				
				//add object to arraylist
				catalogueList.add(catalogueDetails);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return catalogueList;
	}
	
	public ArrayList<Catalogue> getParentCatalogueList() throws SQLException {
		ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
		sqlQuery = "select fc.categoryName, fp.categoryID, fp.parentID, fp.level " +
				"from flipkart_category fc, flipkart_path fp where fc.categoryID = fp.categoryID AND fc.level = ?;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, 0);
			rs=ps.executeQuery();
			while(rs.next()){
				
				//sets value to catalogue POJO class object
				Catalogue catalogueDetails = new Catalogue();
				catalogueDetails.setCatalogueName(rs.getString(1));
				catalogueDetails.setCatalogueParentID(rs.getInt(2));
				catalogueDetails.setCatalogueID(rs.getInt(3));
				catalogueDetails.setCatalogueLevel(rs.getInt(4));
				
				//add object to arraylist
				catalogueList.add(catalogueDetails);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return catalogueList;
	}
}
