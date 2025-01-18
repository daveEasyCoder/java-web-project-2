package com.webdev.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
 
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		if(connection == null) {

			String url = "jdbc:mysql://localhost:3306/foodorderdb?useSSL=false";
			String username = "root";
			String password = "1a2b3c4d";	
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = DriverManager.getConnection(url,username,password);
		}
		
		return connection;
		
	}
}
