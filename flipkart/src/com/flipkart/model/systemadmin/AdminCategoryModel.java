package com.flipkart.model.systemadmin;

import com.flipkart.model.authentication.ForgotPasswordModel;
import com.flipkart.model.authentication.SignUpModel;
import com.flipkart.model.placeorder.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.flipkart.util.DbConnection;
import com.flipkart.util.EmailManager;
import com.flipkart.util.MyLog;
import com.flipkart.util.RuntimeSettings;
import com.opensymphony.xwork2.ActionContext;

public class AdminCategoryModel {

	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static Connection conn = null;


	/**
	 * This method fetches category names and their status
	 * @return category list
	 */
	public static ArrayList<AdminCategory> fetchCategoryList() {

		ArrayList<AdminCategory> categoryList = new ArrayList<AdminCategory>();

		sqlQuery = "SELECT categoryName, status FROM flipkart_category";

		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();

			while(rs.next()){
				AdminCategory category = new AdminCategory();
				category.setCategoryName(rs.getString(1));
				category.setStatus(rs.getInt(2));
				categoryList.add(category);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return categoryList;
	}
	

	
	/**
	 * This method is used to insert a new category into database
	 * @param categoryname- name of the new category
	 * @return 0 - success, -1 - error
	 */
	public static int insertNewCategory(String categoryname) {

		sqlQuery = "INSERT INTO flipkart_category(categoryName, status, createdBy, modifiedBy, level) " +
				"VALUES (?,?,?,?,?);";
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			
			ps.setString(1, categoryname);
			ps.setInt(2, 0);  /* 0=pending, 1=active, 2=inactive*/
			ps.setString(3, "Admin");
			ps.setString(4, "Admin");
			ps.setInt(5, 0);
			
			ps.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		return 0;
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
