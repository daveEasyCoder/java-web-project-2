package com.webdev.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webdev.connection.GetConn;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Connection con;
		PrintWriter out = response.getWriter();
		
		try {
			con = GetConn.getConnection();
			String query = "DELETE FROM cart WHERE id=?";
			PreparedStatement  ps = con.prepareStatement(query);
			ps.setInt(1, id);
	       int rowAffected = ps.executeUpdate();
	      
	      if(rowAffected > 0) {
	    	  response.sendRedirect("cart.jsp");
	      }else {
	    	 out.print("<div>Something went wrong please try later!</div>");
	    	 out.print("<a href='cart.jsp'>goto cart</a>");
	      }
		    
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}



}
