package com.wevdev.foodDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DATABASE {
	
  public void start() throws SQLException, ClassNotFoundException {
	  
	  String url = "jdbc:mysql://localhost:3306/foodorderdb?useSSL=false";
	  String username = "root";
	  String password = "1a2b3c4d";	
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodorderdb?useSSL=false&allowPublicKeyRetrieval=true","root","1a2b3c4d");
	   // Connection con = GetConn.getConnection();

	    Statement st = con.createStatement();
	    
	    //CREATING TABLE FOR FOOD 
	    String creatFoodTable = "CREATE TABLE IF NOT EXISTS foods("
	  				          + "id int PRIMARY KEY AUTO_INCREMENT, "
	  				          + "image varchar(50),"
	  				          + "category varchar(30),"
	  				          + "food_name varchar(30),"
	  				          + "price double, "
	  				          + "f_description varchar(140))";
	     st.executeUpdate(creatFoodTable);
	      
	     //CREATE CART
	     
	   
	     
	     String query = "SELECT COUNT(*) AS row_count FROM foods";
	     ResultSet rs = st.executeQuery(query);
	     
	     
	     // Check if the table is empty
	     int rowCount = 0;
	     if (rs.next()){
	         rowCount = rs.getInt("row_count");
	     }
	     

	     if(rowCount == 0){
	  	   //INSERT PRODUCT INTO TABLE
	  	   String insertInfo = "INSERT INTO foods(image,category,food_name,price,f_description) VALUES ('fruit1.jpeg','fruit','Fruit1',79,'lorem ipsum dolorLorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsam itaque rerum at qui recusandae reprehenderit totam temporibus, aspernatur, eos officia ullam nesciunt impedit nulla. Et quibusdam ullam ipsum quasi illo. sit amet cu apredbo tan'),"
	  	                                                                                            + "('cake1.jpeg','cake','Cake1',50,'lorem ipsum dolor sit amet cu apredbo tan')," 
	  	                                                                                            + "('vegetable1.jpeg','vegetable','Fruit2',40,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            + "('chicken1.jpeg','chicken','Chickens1',99,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            + "('drink1.jpeg','drink','Drink 1',49,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('fruit2.jpeg','fruit','Fruit 2',33,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            + "('cake2.jpeg','cake','Cake 2',28,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('vegetable2.jpeg','vegetable','Vegetable 2',100,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('chicken2.jpeg','chicken','Chickens 2',148,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('drink2.jpeg','drink','Drink 2',76,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('fruit3.jpeg','fruit','Fruit 3',68,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('cake3.jpeg','cake','Cake 3',58,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('vegetable3.jpeg','vegetable','Vegetable 3',118,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('chicken3.jpeg','chicken','Chicken 3',111,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('drink3.jpeg','drink','Drink 3',150,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                            +"('fruit4.jpeg','fruit','Fruit 4',79,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                             +"('cake4.jpeg','cake','Cake 4',53,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                             +"('vegetable4.jpeg','vegetable','Vegetable 4',74,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                             +"('drink4.jpeg','drink','Drink 4',90,'lorem ipsum dolor sit amet cu apredbo tan'),"
	  	                                                                                         
	  	                                                                                             +"('chicken4.jpeg','chicken','Chicken 4',168,'lorem ipsum dolor sit amet cu apredbo tan')";
	  	                                                                              
	  	                                                                      
	  	   Statement st2 = con.createStatement();
	  	  st2.executeUpdate(insertInfo);
	     }

  }
}
