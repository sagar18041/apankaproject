package com.flipkart.model.searchitem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.flipkart.model.browseitem.Attributes;
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
	static ResultSet rs1=null;
	static String sqlQuery="";
	static Connection conn = null;
	
	/**
	 * @param searchText
	 * This method is used when "all the category" is selected
	 * @return Arraylist of category and number of items
	 */
	public ArrayList<SearchCategory> fetchForAllCat(String searchText){
		ArrayList<SearchCategory> searchCat = new ArrayList<SearchCategory>();
		
		sqlQuery = "select category , count(distinct itemID) as noOfItems from fielditemview where upper(itemName) like upper('%" +
		searchText + "%') group by category";
		
		System.out.println("SQL query is " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchCategory sc = new SearchCategory();
				sc.setCategoryName(rs.getString("category"));
				sc.setNoOfItems(rs.getInt("noOfItems"));
				
				searchCat.add(sc);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return searchCat;
	}
	
	public ArrayList<SearchCategory> fetchForCat(String searchText , String category){
		ArrayList<SearchCategory> searchCat = new ArrayList<SearchCategory>();
		
		sqlQuery = "select category , count(distinct itemID) as noOfItems from fielditemview where upper(itemName) like upper('%" +
		searchText + "%') and category = '" + category + "'";
		
		System.out.println("SQL query is " + sqlQuery);
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			while(rs.next()){
				SearchCategory sc = new SearchCategory();
				sc.setCategoryName(rs.getString("category"));
				sc.setNoOfItems(rs.getInt("noOfItems"));
				
				searchCat.add(sc);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return searchCat;
	}
	
	/**
	 * @param category
	 * @param searchText
	 * @return
	 */
	public ArrayList<SearchAttribute> fetchAttribute(String category , String searchText){
		ArrayList<SearchAttribute> srAttr = new ArrayList<SearchAttribute>();
		
		
		sqlQuery = "SELECT bi.itemID itemid, " + 
					"max(CASE WHEN bi.attrName='Name' THEN bi.itemName ELSE NULL END) as Name, " +
					"max(CASE WHEN bi.attrName='price' THEN bi.itemName ELSE NULL END) as Price, " +
					"bi.category category , bi.thumbnail image" +
					" FROM " + 
					"(SELECT fiv.itemID , fiv.attrName , fiv.itemName , fiv.category , fi.thumbnail " +
					"from fielditemview fiv left join flipkart_item fi on fiv.itemID = fi.itemID " +
					"where fiv.itemID in (select distinct itemID from fielditemview where upper(itemName) " +
					"like upper('%" + searchText + "%') and category ='" + category + "'))as bi " +
					"group by bi.itemID";
		System.out.println("Sql query is " + sqlQuery);
		/*
		 * I doubt if it is a good practice to use the sql query inside the while loop
		 * But didn't get any other idea to implement the idea I have
		 * the task is to add the data in the arraylist which contains one arraylist inside itself
		 * so my idea is fetch the values for other fields and then fetch the value for that particalur itemID
		 */
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
					srAttr.add(sa);
				}
			}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return srAttr;
	}
}
