package com.wevdev.foodDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.webdev.connection.GetConn;
import com.webdev.model.CartFoods;
import com.webdev.model.Foods;

public class CartDB {

	private Connection con;
	private ResultSet result;
	private PreparedStatement ps;
	private PreparedStatement ps2;
	
	
	public CartDB(Connection con) {
		this.con = con;
	}
	
	
	public List<CartFoods> getCartFoods() throws SQLException{
		
		List<CartFoods> cartfoods = new ArrayList<>();
				
		String sql = "SELECT * FROM cartDB";
		ps = this.con.prepareStatement(sql);
		result = ps.executeQuery();
		while(result.next()) {
			String cartQuery = "SELECT * FROM foods WHERE id = ?";
			ps2 = this.con.prepareStatement(cartQuery);
			ps2.setInt(1, result.getInt("id"));
			result = ps2.executeQuery();
			while(result.next()) {
				CartFoods cartList = new CartFoods();
				cartList.setId(result.getInt("id"));
				cartList.setImage(result.getString("image"));
				cartList.setCategory(result.getString("category"));
				cartList.setFood_name(result.getString("food_name"));
				cartList.setPrice(result.getDouble("price"));
				cartList.setDescription(result.getString("f_description"));
				
				cartfoods.add(cartList);
				
			}
		}
		
		return cartfoods;
		
	}
	
}
