package com.webdev.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webdev.connection.GetConn;
import com.webdev.model.CartFoods;
import com.wevdev.foodDAO.FoodDB;


/**
 * Servlet implementation class UpdateCart
 */
@WebServlet("/update")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		int id = Integer.parseInt(request.getParameter("id"));
		
		String action = request.getParameter("action");
		try {
			
			Connection con = GetConn.getConnection();
			if(action.equals("increase")) {
				String sql = "UPDATE cart set quantity = quantity + 1 WHERE id=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				int rowAffected = ps.executeUpdate();
				if(rowAffected>0) {
					response.sendRedirect("cart.jsp");
				}else {
					response.sendRedirect("cart.jsp");
				}
				
			}
			
		    if(action.equals("decrease")) {
		    	FoodDB food = new FoodDB(GetConn.getConnection());
		    	List<CartFoods> list = food.getCartFoods();
		    	
		    	for(CartFoods f : list) {
		    		if(f.getId() == id) {
		    			if(f.getQuantity() > 1) {
		    				String sql = "UPDATE cart set quantity = quantity - 1 WHERE id=?";
		    				PreparedStatement ps = con.prepareStatement(sql);
		    				ps.setInt(1, id);
		    				int rowAffected = ps.executeUpdate();
		    				if(rowAffected>0) {
		    					response.sendRedirect("cart.jsp");
		    				}else {
		    					response.sendRedirect("cart.jsp");
		    				}
		    			}else {
		    				response.sendRedirect("cart.jsp");
		    			}
		    		}
		    	}
		    	
		    	
		    	
		    	
		    	
		    	
		    	
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}


}
