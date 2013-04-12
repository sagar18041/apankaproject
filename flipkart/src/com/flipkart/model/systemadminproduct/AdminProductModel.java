package com.flipkart.model.systemadminproduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;

import com.flipkart.model.systemadmincategory.AdminCategory;
import com.flipkart.util.DbConnection;

public class AdminProductModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;

	
	// PAGE INITIALIZATION FUNCTIONS
	
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

	
	// PRODUCT RELATED FUNCTIONS
	
	/**
	 * It checks whether a product already exists
	 * @param productname- name of the new product
	 * @return no of rows having given productName (0 if not present)
	 */
	public static int checkExistingProduct(String productname){

		System.out.println("Product name: "+productname);
		sqlQuery = "SELECT count(productID) FROM flipkart_product WHERE productName=?";
		int countRows=0;
		
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
			return -1;
		}
		//if no rows present means, its a new product so return 0 else count of rows
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

	/**
	 * This method is used to fetch the latest ProductID
	 * @param categoryID- Category to which the product belongs
	 * @return productID for success, -1 for error
	 */
	public static int fetchNewProductID(int categoryID){

		int productID=0;

		/* fetch the most recently entered productID*/
		sqlQuery = "SELECT productID FROM flipkart_product WHERE categoryID=? AND createdOn=(SELECT max(createdOn) FROM flipkart_product);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, categoryID);
			
			rs=ps.executeQuery();

			while(rs.next()){
				productID = rs.getInt(1);
			}
			
		}catch(Exception e){
			return -1;
		}
		
		return productID;
	}

	
	//ITEM RELATED FUNCTIONS
	
	/**
	 * It checks whether a item already exists
	 * @param itemname- name of the new item
	 * @return no of rows having given itemName (0 if not present)
	 */
	public static int checkExistingItem(String itemname){

		System.out.println("Product name: "+itemname);
		sqlQuery = "SELECT count(itemID) FROM flipkart_item WHERE itemName=?";
		int countRows=0;
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setString(1, itemname);

			rs=ps.executeQuery();
			
			while(rs.next()){
				countRows = rs.getInt(1);
			}
				
		}catch(Exception e){
			//e.printStackTrace();
			return -1;
		}
		//if no rows present means, its a new item so return 0 else count of rows
		return countRows;
	}

	/**
	 * This method is used to insert a new item into database
	 * @param itemName - name of item
	 * @param productID - product it belongs to
	 * @param thumbnail - path of its thumbnail image
	 * @return 0 - success, -1 - error
	 */
	public static int insertNewItem(String itemName, int productID, String thumbnail) {
		
		sqlQuery = "INSERT INTO flipkart_item(itemName, availableQuantity, productID, createdBy, modifiedBy, thumbnail) " +
				"VALUES (?,?,?,?,?,?);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);

			ps.setString(1, itemName);
			ps.setInt(2, 0); // every new item will have 0 availableQty, order some from seller later
			ps.setInt(3, productID);
			ps.setString(4, "Admin");
			ps.setString(5, "Admin");
			ps.setString(6, thumbnail);

			ps.executeUpdate();

		}
		catch(Exception e){
			return -1;
		}
		return 0;
	}		

	/**
	 * This method is used to fetch the latest ItemID
	 * @param productID- Product to which the item belongs
	 * @return itemID for success, -1 for error
	 */
	public static int fetchNewItemID(int productID){

		int itemID=0;

		/* fetch the most recently entered productID*/
		sqlQuery = "SELECT itemID FROM flipkart_item WHERE productID=? AND createdOn=(SELECT max(createdOn) FROM flipkart_item);";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			ps.setInt(1, productID);
			
			rs=ps.executeQuery();

			while(rs.next()){
				itemID = rs.getInt(1);
			}
			
		}catch(Exception e){
			return -1;
		}
		
		return itemID;
	}

	
	//ITEM-ATTRIBUTES FUNCTIONS
	
	
	
}
