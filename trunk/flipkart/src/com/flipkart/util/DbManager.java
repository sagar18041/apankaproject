package com.flipkart.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * @author neha
 * @return
 * Database Interaction Class
 */
public class DbManager {

	public static ResultSet rs = null;
	public static Connection conn = null;
	public static PreparedStatement pst = null;
	
	
	/**
	 * @author neha
	 * @param sql
	 * @return 
	 * SQL select query
	 */
	public static ResultSet selectFromDB(String sql){
		try{
			conn = DbConnection.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			return rs;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		
	}
	
	
	/**
	 * @author neha
	 * @param sql
	 * @return
	 * SQL insert query
	 * @throws SQLException
	 */
	public static int insertIntoDb(String sql) throws SQLException{
		 conn = null;
		
		int flag = 1;
		try{
			conn = DbConnection.getConnection();
			pst = conn.prepareStatement(sql);
			pst.executeUpdate();
			flag = 1;
			return flag;
		}
		catch(Exception ex){
			ex.printStackTrace();
			flag = 0;
			return flag;
			
		}
	}
	
	/**
	 * @author neha
	 * @param sql
	 * @return
	 * SQL insert query
	 * @throws SQLException
	 */
	public static int updateTable(String sql) throws SQLException{
		 conn = null;
		int flag = 1;
		try{
			conn = DbConnection.getConnection();
			pst = conn.prepareStatement(sql);
			pst.executeUpdate();
			return flag;
		}
		catch(Exception ex){
			ex.printStackTrace();
			flag = 0;
			return flag;
		}
	}
	
	/**
	 * @author neha
	 * @return
	 * closes the connection
	 * remove function is already there in DbConnection
	 * but to maintain the consistency(this class will be called from other classes
	 * for query processing) 
	 * calling remove function from here
	 * @throws SQLException
	 */
	public void removeConn() throws SQLException{
		rs.close();
		pst.close();
		DbConnection db = new DbConnection();
		db.removeConnection();
	}
}
