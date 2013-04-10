package com.flipkart.model.systemadminproduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.flipkart.model.systemadmincategory.AdminCategory;
import com.flipkart.util.DbConnection;

public class AdminProductModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;
		
	/**
	 * This method fetches category names and category ID
	 * for ACTIVE categories for which a path exists
	 * @return category list
	 */
	public static HashMap<Integer,String> fetchCategoryList() {

		HashMap<Integer,String> categoryList = new HashMap<Integer,String>();
		ArrayList<AdminProduct> productList = new ArrayList<AdminProduct>();

		sqlQuery = "SELECT categoryID, categoryName FROM flipkart_category WHERE status=1 AND " +
				"categoryID IN (SELECT categoryID from flipkart_path);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				AdminProduct product = new AdminProduct();
				product.setCategoryID(rs.getInt(1));
				product.setCategoryName(rs.getString(2));
				productList.add(product);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		/* 
		 * adding arraylist entries to hashmap as (key,value) => (categoryID, categoryName)
		 */
		for(int i=0; i< productList.size();i++)
			categoryList.put(productList.get(i).getCategoryID(), productList.get(i).getCategoryName());
		
		return categoryList;
	}

	/**
	 * It checks whether a product already exists
	 * @param productname- name of the new product
	 * @return no of rows having given categoryName (0 if not present)
	 */
	public static int checkExistingProduct(String productname){

		sqlQuery = "SELECT count(productID) FROM flipkart_category WHERE productName=?";
		int countRows=-99;
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, productname);

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
	 * This method is used to insert a new product into database
	 * @param productname- name of the new product
	 * @param categoryid- categoryID it belongs to
	 * @return 0 - success, -1 - error
	 */
	public static int insertNewProduct(String productName, int categoryID) {

		sqlQuery = "INSERT INTO flipkart_product(productName, categoryID, createdBy, modifiedBy) " +
				"VALUES (?,?,?,?);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);

			ps.setString(1, productName);
			ps.setInt(2, categoryID);
			ps.setString(3, "Admin");
			ps.setString(4, "Admin");
	
			ps.executeUpdate();

		}
		catch(Exception e){
			//e.printStackTrace();
			return -1;
		}
		return 0;
	}		

	
}
