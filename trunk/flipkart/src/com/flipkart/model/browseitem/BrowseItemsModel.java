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
					"END ) AS Price, bi.category category, bi.path image " +
					"FROM ( " +
					"SELECT fiv.itemID, fiv.attrName, fiv.itemName, fiv.category, fi.path " +
					"FROM fielditemview fiv " +
					"LEFT JOIN flipkart_images fi ON fiv.itemID = fi.itemID " +
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
					")" +
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
				//	conn=DbConnection.getConnection();
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
					"END ) AS Price, bi.category category, bi.path image " +
					"FROM ( " +
					"SELECT fiv.itemID, fiv.attrName, fiv.itemName, fiv.category, fi.path " +
					"FROM fielditemview fiv " +
					"LEFT JOIN flipkart_images fi ON fiv.itemID = fi.itemID " +
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
					")" +
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
				//	conn=DbConnection.getConnection();
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
