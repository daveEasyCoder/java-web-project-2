package com.wevdev.foodDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


import com.webdev.model.CartFoods;

public class CartDAO {

	
	private Connection con;

	public CartDAO(Connection con) {
		this.con = con;
	}
	
	public void createCartTable() throws SQLException{
	   
		Statement st = con.createStatement();
		 //CREATE CART DATABASE
		 String createCartTable = "CREATE TABLE IF NOT EXISTS cart (id INT,"
		 		                                                   + "image VARCHAR(50),"
		 		                                                   + "category VARCHAR(50),"
		 		                                                   + "food_name VARCHAR(50),"
		 		                                                   + "price DOUBLE,"
		 		                                                   + "f_description VARCHAR(300),"
		 		                                                   + "quantity INT)";
		        
       			  
		st.executeUpdate(createCartTable);
		

		}
			
	}
