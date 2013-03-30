package com.flipkart.model.systemadmin;

import com.flipkart.model.placeorder.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.flipkart.util.DbConnection;
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
				category.setStatus(rs.getString(2));
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
	 */
	public static void insertNewCategory(String categoryname) {

		sqlQuery = "INSERT INTO flipkart_category(categoryName, status, createdBy, modifiedBy, level) " +
				"VALUES (?,?,?,?,?);";
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			
			ps.setString(1, categoryname);
			ps.setString(2, "PENDING");
			ps.setString(3, "Admin");
			ps.setString(4, "Admin");
			ps.setInt(5, 0);
			
			ps.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}		
}
