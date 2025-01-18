package com.wevdev.foodDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.webdev.model.CartFoods;
import com.webdev.model.Foods;

public class FoodDB {

	private Connection con;
	private ResultSet result;
	private ResultSet rs;
	private PreparedStatement ps;
	private PreparedStatement ps2;
	
	
	public FoodDB(Connection con) {
		this.con = con;
	}
	
	public List<Foods> getAllFoods() throws SQLException{
		
		List<Foods> food_list = new ArrayList<>();
		String query = "SELECT * FROM foods";
		ps = this.con.prepareStatement(query);
		result = ps.executeQuery();
		while(result.next()) {
			
			Foods food = new Foods();	
			food.setId(result.getInt("id"));
			food.setImage(result.getString("image"));
			food.setCategory(result.getString("category"));
			food.setFood_name(result.getString("food_name"));
			food.setPrice(result.getDouble("price"));
			food.setDescription(result.getString("f_description"));
			
			food_list.add(food);
			
		}
		
		return food_list;
		
	}
	
	
	public List<CartFoods> getCartFoods() throws SQLException{
		
		List<CartFoods> cartfoods = new ArrayList<>();
				
		String sql = "SELECT * FROM cart";
		ps = con.prepareStatement(sql);
	    rs = ps.executeQuery();
	   
	    while(rs.next()) {
	   
				CartFoods cartList = new CartFoods();
				cartList.setId(rs.getInt("id"));
				cartList.setImage(rs.getString("image"));
				cartList.setCategory(rs.getString("category"));
				cartList.setFood_name(rs.getString("food_name"));
				cartList.setPrice(rs.getDouble("price"));
				cartList.setQuantity(rs.getInt("quantity"));
				cartList.setDescription(rs.getString("f_description"));
				
				cartfoods.add(cartList);
				
			
		}
		
		return cartfoods;
		
	}
	
	
	
}
