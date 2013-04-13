package com.flipkart.model.systemadmincategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.flipkart.model.systemadminproduct.AdminProduct;
import com.flipkart.util.DbConnection;

public class AdminCategoryModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	/**
	 * This method fetches category names and their status, level and parentCategory
	 * @return category list
	 */
	public static ArrayList<AdminCategory> fetchCategoryList() {

		ArrayList<AdminCategory> categoryList = new ArrayList<AdminCategory>();

		sqlQuery = "SELECT categoryName, status, B.level," +
				"(SELECT categoryName FROM flipkart_category A WHERE A.categoryID=C.parentID) AS parentCategory " +
				"FROM flipkart_category B, flipkart_path C " +
				"WHERE B.categoryID=C.categoryID ORDER BY B.level;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				AdminCategory category = new AdminCategory();
				category.setCategoryName(rs.getString(1));
				category.setStatus(rs.getInt(2));
				category.setLevel(rs.getInt(3));
				category.setParentCategory(rs.getString(4));
				categoryList.add(category);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return categoryList;
	}


	/**
	 * This method fetches category names and their ID for a particular level
	 * @return category list
	 */
	public static HashMap<Integer,String> fetchParentCategories(int level) {
		
		HashMap<Integer,String> categoryList = new HashMap<Integer,String>();
		ArrayList<AdminCategory> categories = new ArrayList<AdminCategory>();

		sqlQuery = "SELECT categoryID, categoryName FROM flipkart_category WHERE status=1 AND " +
				"level=? AND categoryID IN (SELECT categoryID from flipkart_path);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, level);
			rs=ps.executeQuery();

			while(rs.next()){
				AdminCategory category = new AdminCategory();
				category.setCategoryID(rs.getInt(1));
				category.setCategoryName(rs.getString(2));
				categories.add(category);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		/* 
		 * adding arraylist entries to hashmap as (key,value) => (categoryID, categoryName)
		 */
		for(int i=0; i< categories.size();i++)
			categoryList.put(categories.get(i).getCategoryID(), categories.get(i).getCategoryName());

		return categoryList;

	}


	/**
	 * This method fetches all levels in flipkart category db
	 * @return levels list
	 */
	public static ArrayList<Integer> fetchLevels() {

		ArrayList<Integer> levels = new ArrayList<Integer>();

		sqlQuery = "SELECT DISTINCT(level) FROM flipkart_category;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				int levelTemp;
				levelTemp=rs.getInt(1);

				levels.add(levelTemp);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return levels;
	}

	/**
	 * It checks whether a category already exists
	 * @param categoryname - category name to be checked
	 * @return no of rows having given categoryName (0 if not present)
	 */
	public static int checkExistingCategory(String categoryname){

		sqlQuery = "SELECT count(categoryID) FROM flipkart_category WHERE categoryName=?";
		int countRows=-99;
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, categoryname);

			rs=ps.executeQuery();

			while(rs.next()){
				countRows = rs.getInt(1);
			}

		}catch(Exception e){
			//e.printStackTrace();
		}

		//if no rows present means, its a new category so return 0 else count of rows
		return countRows;
	}

	/**
	 * This method is used to insert a new category into database
	 * @param categoryname- name of the new category
	 * @return 0 - success, -1 - error
	 */
	public static int insertNewCategory(String categoryname, int level) {

		sqlQuery = "INSERT INTO flipkart_category(categoryName, status, createdBy, modifiedBy, level) " +
				"VALUES (?,?,?,?,?);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);

			ps.setString(1, categoryname);
			ps.setInt(2, 0);  /* 0=pending, 1=active, 2=inactive*/
			ps.setString(3, "Admin");
			ps.setString(4, "Admin");
			ps.setInt(5, level);

			ps.executeUpdate();

		}
		catch(Exception e){
			//e.printStackTrace();
			return -1;
		}
		return 0;
	}		

	/**
	 * This method is used to insert a new category path into database
	 * @return 0 - success, -1 - error
	 */
	public static int insertNewCategoryPath(int parentID, int level) {

		int categoryID=0;

		/* fetch the most recently entered category ID*/
		sqlQuery = "SELECT categoryID FROM flipkart_category WHERE createdOn=(SELECT max(createdOn) FROM flipkart_category);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);

			rs=ps.executeQuery();

			while(rs.next()){
				categoryID = rs.getInt(1);
			}

			/* inserting into path table */
			sqlQuery = "INSERT INTO flipkart_path(categoryID, parentID, level) " +
					"VALUES (?,?,?);";

			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);

				ps.setInt(1, categoryID);
				
				//if parentID IS -99, meaning level 0 was selected, so categoryID will be parentID
				if(parentID == -99){
					ps.setInt(2, categoryID);
				}else{
					ps.setInt(2, parentID);
				}
				 
				ps.setInt(3, level);

				ps.executeUpdate();

			}
			catch(Exception e){
				e.printStackTrace();
				return -1;
			}

		}catch(Exception e){
			return -1;
			//e.printStackTrace();
		}

		return 0;
	}		


	/**
	 * This method is used to remove a new category from database
	 * @param categoryname - name of category
	 */
	public static void removeNewCategory(String categoryname) {
		int categoryID=0;

		/* fetch the category ID for the given caategoryName*/
		sqlQuery = "SELECT categoryID FROM flipkart_category WHERE categoryName=?;";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, categoryname);
			rs=ps.executeQuery();

			while(rs.next()){
				categoryID = rs.getInt(1);
			}

			/* deleting from category table */
			sqlQuery = "DELETE FROM flipkart_category WHERE categoryID=?";

			try{
				conn=DbConnection.getConnection();
				ps=conn.prepareStatement(sqlQuery);
				ps.setInt(1, categoryID);
				ps.executeUpdate();
				
				/* deleting from path table */
				sqlQuery = "DELETE FROM flipkart_path WHERE categoryID=?";
				
				try{
					conn=DbConnection.getConnection();
					ps=conn.prepareStatement(sqlQuery);
					ps.setInt(1, categoryID);
					ps.executeUpdate();	
				}
				catch(Exception e){
			
				}
			}
			catch(Exception e){
			
			}
		}catch(Exception e){
			
		}
	}

	/**
	 * This method fetches category names, id and their status
	 * for all the pending activations
	 * @return category list
	 */
	public static ArrayList<AdminCategory> fetchVerificationCategory() {

		ArrayList<AdminCategory> categoryList = new ArrayList<AdminCategory>();

		sqlQuery = "SELECT categoryName, status, categoryID FROM flipkart_category WHERE status=0";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				AdminCategory category = new AdminCategory();
				category.setCategoryName(rs.getString(1));
				category.setStatus(rs.getInt(2));
				category.setCategoryID(rs.getInt(3));
				categoryList.add(category);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return categoryList;
	}


	/**
	 * This method updates the status of a
	 * pending activation
	 * @return category list
	 */
	public static void changeStatusCategory(int categoryID) {

		sqlQuery = " UPDATE flipkart_category SET status=1 WHERE categoryID=?; ";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);

			ps.setInt(1, categoryID);

			ps.executeUpdate();

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}	

}
