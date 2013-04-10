package com.flipkart.model.wishlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.model.browseitem.Product;
import com.flipkart.util.DbConnection;

public class WishlistModel {
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static String sqlQuery = "";
	static Connection conn = null;
	static int checkFlag=0;

	static ArrayList<Wishlist> wishlistItems=new ArrayList<Wishlist>();
	static ArrayList<Integer> checkPresentInList=new ArrayList<Integer>();

	public static void addToWishlist(Integer itemID){
		checkPresentInList.clear();
		PreparedStatement pes = null;
		ResultSet res = null;
		String sqlQuery1 = "";
		Connection conn1 = null;
		checkFlag=0;

		sqlQuery1="SELECT itemID FROM flipkart_wishlist;";
		try{
			conn1=DbConnection.getConnection();
			pes=conn1.prepareStatement(sqlQuery1);
			//ps.setInt(1, itemID);
			res=pes.executeQuery();

			while(res.next()){
				checkPresentInList.add(res.getInt(1));
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		if(!(checkPresentInList.size()==0)){
			for(int i=0;i<checkPresentInList.size();i++){
				if(checkPresentInList.get(i)==itemID){
					checkFlag=1;
				}
			}
		}
		if(checkFlag==0 || checkPresentInList.size()==0){
			sqlQuery="insert into flipkart_wishlist (userID,itemID) values (?,?);";
			System.out.println("query:::"+sqlQuery);

			try {
				conn=DbConnection.getConnection();
				ps = conn.prepareStatement(sqlQuery);
				ps.setInt(2, itemID);
				ps.setInt(1, 1);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else{
			System.out.println("item already in wishlist table...");
		}
	}

	public static ArrayList<Wishlist> fetchItems(){
		wishlistItems.clear();
		sqlQuery = "select itemName,flipkart_wishlist.itemID,thumbnail from flipkart_wishlist,flipkart_item where flipkart_wishlist.itemID=flipkart_item.itemID;";
		try{
			conn=DbConnection.getConnection();
			ps=conn.prepareStatement(sqlQuery);
			//ps.setInt(1, 1);
			rs=ps.executeQuery();

			while(rs.next()){
				wishlistItems.add(fetchAttributes(rs.getInt(2),rs.getString(1),rs.getString(3)));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		//System.out.println("size of arraylist:"+wishlistItems.size());
		return wishlistItems;
	}






	public static Wishlist fetchAttributes(Integer itemID,String itemName,String thumbnail){
		PreparedStatement pes = null;
		ResultSet res = null;
		String sqlQuery1 = "";
		Connection conn1 = null;

		Wishlist w = new Wishlist();
		w.setItemID(itemID);
		w.setItemName(itemName);
		w.setThumbnail(thumbnail);
		System.out.println("###"+itemID);
		try{
			sqlQuery1 = "select attribute,value from flipkart_itemattributes where itemID=? and attribute='Price';";
			conn1=DbConnection.getConnection();
			pes=conn1.prepareStatement(sqlQuery1);
			pes.setInt(1, itemID);
			res=pes.executeQuery();

			if(res.next()){
				w.setPrice(res.getInt(2));
				//System.out.println("item attributes   "+res.getString(1)+"::::"+res.getString(2));
			}

			sqlQuery1 = "select attribute,value from flipkart_itemattributes where itemID=? and attribute='Delivery Time';";
			conn1=DbConnection.getConnection();
			pes=conn1.prepareStatement(sqlQuery1);
			pes.setInt(1, itemID);
			res=pes.executeQuery();

			if(res.next()){
				w.setDeliveryTime(res.getString(2));
				//System.out.println("item attributes   "+res.getString(1)+"::::"+res.getString(2));
			}

			sqlQuery1 = "select attribute,value from flipkart_itemattributes where itemID=? and attribute='Discount';";
			conn1=DbConnection.getConnection();
			pes=conn1.prepareStatement(sqlQuery1);
			pes.setInt(1, itemID);
			res=pes.executeQuery();

			if(res.next()){
				w.setDiscount(res.getInt(2));
				//System.out.println("item attributes   "+res.getString(1)+"::::"+res.getString(2));
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		return w;
	}
	public static void deletefromWishlist(Integer itemID){
		sqlQuery="delete from flipkart_wishlist where itemID=?;";
		System.out.println("in delete query:::"+sqlQuery);

		try {
			conn=DbConnection.getConnection();
			ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, itemID);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
