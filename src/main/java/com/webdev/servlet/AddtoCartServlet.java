package com.webdev.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.webdev.connection.GetConn;
import com.webdev.model.CartFoods;
import com.webdev.model.Foods;
import com.wevdev.foodDAO.CartDAO;
import com.wevdev.foodDAO.FoodDB;


/**
 * Servlet implementation class AddtoCartServlet
 */
@WebServlet("/AddtoCart")
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
	
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");;
		
		
		
		
		
	    Connection con;
		
	
		try {
		    con = GetConn.getConnection();
			

			CartDAO cartdb = new CartDAO(GetConn.getConnection());
			cartdb.createCartTable();
			
			String image = "";
			String category = "";
			Double price = 0.0;
			String description = "";
			String food_name = "";
			
			FoodDB food = new FoodDB(GetConn.getConnection());
			List<Foods> foodList = food.getAllFoods();
			
		    for(Foods f : foodList) {
		    	if(f.getId() == id) {
		    		image = f.getImage();
		    		category = f.getCategory();
		    		price = f.getPrice();
		    		description = f.getCategory();
		    		food_name = f.getCategory();
		    	}
		    }
			
		   // check if the product already in the cart
		    boolean flag = true;
			List<CartFoods> cart = food.getCartFoods();
		    for(CartFoods f : cart) {
		    	if(f.getId() == id) {
		    		flag = false;
		    	}
		    }
		  
		   
			//INSERT INTO THE CART IF NOT EXIST IN THE CART
		    if(flag) {
		    	String insertQuery = "INSERT INTO cart(id,image,category,food_name,price,f_description,quantity) VALUES (?,?,?,?,?,?,?)";
				PreparedStatement ps2 = con.prepareStatement(insertQuery);
				ps2.setInt(1, id);
				ps2.setString(2, image);
				ps2.setString(3,category);
				ps2.setString(4, food_name);
				ps2.setDouble(5, price);
				ps2.setString(6, description);
				ps2.setInt(7, 1);
				
				int rowAffected = ps2.executeUpdate();
				
				
				 if(rowAffected>0) {
					session.setAttribute("status","success");
					
				 }else {
					 session.setAttribute("status","failed");	
				 }
				 
				 dispatcher.forward(request, response);
				 
		    }else {
		    	 dispatcher.forward(request, response);
		    }
		
			
		   
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
