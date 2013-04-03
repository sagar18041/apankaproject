package com.flipkart.util;

/**
 * @author bril
 * Runtime Settings for entire application
 *
 */
public class RuntimeSettings {
	public static final String APPLICATION_NAME = "flipkart";
	public static final String VERSION_ID = " version 0.1"
			+ " dated March , 2013";
	public static final String SERVER_IP = "localhost";
	public static String databaseName = "flipkart";
	public static String dbUserID = "root";
	public static String dbPassword = "password"; 
	public static String RUN_MODE = "Test"; // "Production"; //
	public static boolean IS_IN_DEBUG_MODE = true; // false; //
	public static int portNo = 3306;// 5432; //
	public static String dbUrl = "jdbc:mysql://localhost/";
	public static String driverClass = "com.mysql.jdbc.Driver";
	public static String smtpFrom = "flipkart.iiitb@gmail.com";
	public static String smtpPassword = "iiitb.password";
	
	//Attributes Priorities
	public static Integer highPriority = 2;
	public static Integer mediumPriority = 1;
	public static Integer lowPriority = 0;
	
}