package com.flipkart.model.browseitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.model.browseitem.Attributes;
import com.flipkart.model.searchitem.SearchAttribute;
import com.flipkart.util.DbConnection;

public class BrowseItemsModel {
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static ResultSet rs1=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	
	/**
	 * Searches for category
	 * How query works-
	 * get the category name for the categoryID
	 * fetches all the values for categoryname from fielditemview
	 * Now separates the attribute values
	 * 
	 * Data is like this --- arrayList of attributes which contains another arraylist of attributes
	 * First arraylist contains itemid , price and second arraylist contains attributes with priority 1 and 2
	 * @param categoryID
	 * @return
	 */
	public ArrayList<SearchAttribute> fetchAttribute(int categoryID){
		ArrayList<SearchAttribute> seAtt = new ArrayList<SearchAttribute>();
		
		sqlQuery = "SELECT bi.itemID itemid, MAX( " +
					"CASE WHEN bi.attrName =  'Name' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Name, MAX( " +
					"CASE WHEN bi.attrName =  'price' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Price, bi.category category, bi.thumbnail image " +
					"FROM ( " +
					"SELECT fiv.itemID, fiv.attrName, fiv.itemName, fiv.category, fi.thumbnail " +
					"FROM fielditemview fiv " +
					"LEFT JOIN flipkart_item fi ON fiv.itemID = fi.itemID " +
					"WHERE fiv.itemID " +
					"IN ( " +
					"SELECT itemID " +
					"FROM fielditemview " +
					"WHERE category " +
					"IN ( " +
					"SELECT categoryName " +
					"FROM flipkart_category " +
					"WHERE categoryID = " + categoryID +
					")" + 
					")AND fiv.attrName in ('Name' , 'Price')" +
					") AS bi " +
					"GROUP BY bi.itemID";
		System.out.println("Sql query is " + sqlQuery);
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchAttribute sa = new SearchAttribute();
				sa.setItemID(rs.getInt("itemid"));
				sa.setItemName(rs.getString("Name"));
				sa.setPrice(rs.getInt("Price"));
				sa.setCategory(rs.getString("category"));
				sa.setItemImg(rs.getString("image"));
				
				sqlQuery = "SELECT attribute, value " + 
							"FROM flipkart_itemattributes " + 
							"WHERE itemID = " + rs.getInt("itemid") +
							" AND priorityLevel in (1,2) AND attribute <> 'price'";
				System.out.println("query inside " + sqlQuery);
				
				
				ArrayList<Attributes> atbs = new ArrayList<Attributes>();
				try{
					/*
					 * Arraylist for attributes
					 * 
					 */
				
					ps=conn.prepareStatement(sqlQuery);
					rs1=ps.executeQuery();
					System.out.println("Before While");
					while(rs1.next()){
							System.out.println("Inside While");
							Attributes attr = new Attributes();
							attr.setAttribute(rs1.getString("attribute"));
							attr.setValue(rs1.getString("value"));
							
							System.out.println("Add in arraylist");
							atbs.add(attr);
						}
					}
				catch(Exception ex){
					ex.printStackTrace();
				}
				
				sa.setAttr(atbs);
				System.out.println("The array inside array is " + sa.getAttr().size());
				System.out.println("Assigning Done");
				seAtt.add(sa);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return seAtt;
	}
	
	
	/**
	 * Searches for subcategory
	 * How query works-
	 * get the category name for the categoryID
	 * fetches all the values for categoryname from fielditemview
	 * Now separates the attribute values
	 * 
	 * Data is like this --- arrayList of attributes which contains another arraylist of attributes
	 * First arraylist contains itemid , price and second arraylist contains attributes with priority 1 and 2
	 * @param categoryID
	 * @return
	 */
	public ArrayList<SearchAttribute> fetchAttributeForSubCat(int categoryID){
		ArrayList<SearchAttribute> seAtt = new ArrayList<SearchAttribute>();
		
		sqlQuery = "SELECT bi.itemID itemid, MAX( " +
					"CASE WHEN bi.attrName =  'Name' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Name, MAX( " +
					"CASE WHEN bi.attrName =  'price' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Price, bi.category category, bi.thumbnail image " +
					"FROM ( " +
					"SELECT fiv.itemID, fiv.attrName, fiv.itemName, fiv.category, fi.thumbnail " +
					"FROM fielditemview fiv " +
					"LEFT JOIN flipkart_item fi ON fiv.itemID = fi.itemID " +
					"WHERE fiv.itemID " +
					"IN ( " +
					"SELECT itemID " +
					"FROM fielditemview " +
					"WHERE subCategory " +
					"IN ( " +
					"SELECT categoryName " +
					"FROM flipkart_category " +
					"WHERE categoryID = " + categoryID +
					")" + 
					")AND fiv.attrName in ('Name' , 'Price')" +
					") AS bi " +
					"GROUP BY bi.itemID";
		System.out.println("Sql query is " + sqlQuery);
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchAttribute sa = new SearchAttribute();
				sa.setItemID(rs.getInt("itemid"));
				sa.setItemName(rs.getString("Name"));
				sa.setPrice(rs.getInt("Price"));
				sa.setCategory(rs.getString("category"));
				sa.setItemImg(rs.getString("image"));
				
				sqlQuery = "SELECT attribute, value " + 
							"FROM flipkart_itemattributes " + 
							"WHERE itemID = " + rs.getInt("itemid") +
							" AND priorityLevel in (1,2) AND attribute <> 'price'";
				System.out.println("query inside " + sqlQuery);
				
				
				ArrayList<Attributes> atbs = new ArrayList<Attributes>();
				try{
					/*
					 * Arraylist for attributes
					 * 
					 */
				
					ps=conn.prepareStatement(sqlQuery);
					rs1=ps.executeQuery();
					System.out.println("Before While");
					while(rs1.next()){
							System.out.println("Inside While");
							Attributes attr = new Attributes();
							attr.setAttribute(rs1.getString("attribute"));
							attr.setValue(rs1.getString("value"));
							
							System.out.println("Add in arraylist");
							atbs.add(attr);
						}
					}
				catch(Exception ex){
					ex.printStackTrace();
				}
				
				sa.setAttr(atbs);
				System.out.println("The array inside array is " + sa.getAttr().size());
				System.out.println("Assigning Done");
				seAtt.add(sa);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return seAtt;
	}
	
	
	/**
	 * Searches for subsubcategory
	 * How query works-
	 * get the category name for the categoryID
	 * fetches all the values for categoryname from fielditemview
	 * Now separates the attribute values
	 * 
	 * Data is like this --- arrayList of attributes which contains another arraylist of attributes
	 * First arraylist contains itemid , price and second arraylist contains attributes with priority 1 and 2
	 * @param categoryID
	 * @return
	 */
	public ArrayList<SearchAttribute> fetchAttributeForSubSubCat(int categoryID){
		ArrayList<SearchAttribute> seAtt = new ArrayList<SearchAttribute>();
		
		sqlQuery = "SELECT bi.itemID itemid, MAX( " +
					"CASE WHEN bi.attrName =  'Name' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Name, MAX( " +
					"CASE WHEN bi.attrName =  'price' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Price, bi.category category, bi.thumbnail image " +
					"FROM ( " +
					"SELECT fiv.itemID, fiv.attrName, fiv.itemName, fiv.category, fi.thumbnail " +
					"FROM fielditemview fiv " +
					"LEFT JOIN flipkart_item fi ON fiv.itemID = fi.itemID " +
					"WHERE fiv.itemID " +
					"IN ( " +
					"SELECT itemID " +
					"FROM fielditemview " +
					"WHERE subsubCategory " +
					"IN ( " +
					"SELECT categoryName " +
					"FROM flipkart_category " +
					"WHERE categoryID = " + categoryID +
					")" + 
					")AND fiv.attrName in ('Name' , 'Price')" +
					") AS bi " +
					"GROUP BY bi.itemID";
		System.out.println("Sql query is " + sqlQuery);
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchAttribute sa = new SearchAttribute();
				sa.setItemID(rs.getInt("itemid"));
				sa.setItemName(rs.getString("Name"));
				sa.setPrice(rs.getInt("Price"));
				sa.setCategory(rs.getString("category"));
				sa.setItemImg(rs.getString("image"));
				
				sqlQuery = "SELECT attribute, value " + 
							"FROM flipkart_itemattributes " + 
							"WHERE itemID = " + rs.getInt("itemid") +
							" AND priorityLevel in (1,2) AND attribute <> 'price'";
				System.out.println("query inside " + sqlQuery);
				
				
				ArrayList<Attributes> atbs = new ArrayList<Attributes>();
				try{
					
					/*
					 * Arraylist for attributes
					 * 
					 */
				
					ps=conn.prepareStatement(sqlQuery);
					rs1=ps.executeQuery();
					System.out.println("Before While");
					while(rs1.next()){
							System.out.println("Inside While");
							Attributes attr = new Attributes();
							attr.setAttribute(rs1.getString("attribute"));
							attr.setValue(rs1.getString("value"));
							
							System.out.println("Add in arraylist");
							atbs.add(attr);
						}
					}
				catch(Exception ex){
					ex.printStackTrace();
				}
				
				sa.setAttr(atbs);
				System.out.println("The array inside array is " + sa.getAttr().size());
				System.out.println("Assigning Done");
				seAtt.add(sa);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return seAtt;
	}
	
	/**
	 * Searches for subsubsubcategory
	 * How query works-
	 * get the category name for the categoryID
	 * fetches all the values for subsubsubcategoryname from fielditemview
	 * Now separates the attribute values
	 * 
	 * Data is like this --- arrayList of attributes which contains another arraylist of attributes
	 * First arraylist contains itemid , price and second arraylist contains attributes with priority 1 and 2
	 * @param categoryID
	 * @return
	 */
	public ArrayList<SearchAttribute> fetchAttributeForSubSubSubCat(int categoryID){
		ArrayList<SearchAttribute> seAtt = new ArrayList<SearchAttribute>();
		
		sqlQuery = "SELECT bi.itemID itemid, MAX( " +
					"CASE WHEN bi.attrName =  'Name' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Name, MAX( " +
					"CASE WHEN bi.attrName =  'price' " +
					"THEN bi.itemName " +
					"ELSE NULL " +
					"END ) AS Price, bi.category category, bi.thumbnail image " +
					"FROM ( " +
					"SELECT fiv.itemID, fiv.attrName, fiv.itemName, fiv.category, fi.thumbnail " +
					"FROM fielditemview fiv " +
					"LEFT JOIN flipkart_item fi ON fiv.itemID = fi.itemID " +
					"WHERE fiv.itemID " +
					"IN ( " +
					"SELECT itemID " +
					"FROM fielditemview " +
					"WHERE subsubsubCategory " +
					"IN ( " +
					"SELECT categoryName " +
					"FROM flipkart_category " +
					"WHERE categoryID = " + categoryID +
					")" + 
					")AND fiv.attrName in ('Name' , 'Price')" +
					") AS bi " +
					"GROUP BY bi.itemID";
		System.out.println("Sql query is " + sqlQuery);
		
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchAttribute sa = new SearchAttribute();
				sa.setItemID(rs.getInt("itemid"));
				sa.setItemName(rs.getString("Name"));
				sa.setPrice(rs.getInt("Price"));
				sa.setCategory(rs.getString("category"));
				sa.setItemImg(rs.getString("image"));
				
				sqlQuery = "SELECT attribute, value " + 
							"FROM flipkart_itemattributes " + 
							"WHERE itemID = " + rs.getInt("itemid") +
							" AND priorityLevel in (1,2) AND attribute <> 'price'";
				System.out.println("query inside " + sqlQuery);
				
				
				ArrayList<Attributes> atbs = new ArrayList<Attributes>();
				try{
					
					/*
					 * Arraylist for attributes
					 * 
					 */
				
					ps=conn.prepareStatement(sqlQuery);
					rs1=ps.executeQuery();
					System.out.println("Before While");
					while(rs1.next()){
							System.out.println("Inside While");
							Attributes attr = new Attributes();
							attr.setAttribute(rs1.getString("attribute"));
							attr.setValue(rs1.getString("value"));
							
							System.out.println("Add in arraylist");
							atbs.add(attr);
						}
					}
				catch(Exception ex){
					ex.printStackTrace();
				}
				
				sa.setAttr(atbs);
				System.out.println("The array inside array is " + sa.getAttr().size());
				System.out.println("Assigning Done");
				seAtt.add(sa);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return seAtt;
	}
}
