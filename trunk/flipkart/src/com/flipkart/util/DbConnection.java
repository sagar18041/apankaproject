package com.flipkart.util;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

/**
 * @author neha
 * @return
 * Class for creating connection to database
 */
public class DbConnection {

	static Connection conn;	
	
	/**
	 * @author neha
	 * @return
	 *  It uses the runtimeSetting and Loads the driver and	
	 *  makes the connection for the first time 
	 *  if connection is unavailable
	 */
	public static Connection getConnection(){
		if(conn == null){
			try{
				Class.forName(RuntimeSettings.driverClass).newInstance();
				conn = (Connection) DriverManager.getConnection(RuntimeSettings.dbUrl + RuntimeSettings.databaseName,
						RuntimeSettings.dbUserID, RuntimeSettings.dbPassword);
				//conn.setAutoCommit(false);
				MyLog.log("Connection Established");
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return conn;
	}
	
	 /**
	 * @author neha
	 * @return
	 * closing SQL connection 
	 * @throws SQLException
	 */
	public void removeConnection() throws SQLException
	    {
	        conn.close();
	        conn = null;
	    }
}
