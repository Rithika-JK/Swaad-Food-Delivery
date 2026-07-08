package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {
	
	private static final String INSERT_QUERY ="INSERT INTO restaurant(restaurantName, cuisineType, deliveryTime, address, rating, isActive, imagePath) VALUES (?, ?, ?, ?, ?, ?, ?)";

	private static final String GET_RESTAURANT_QUERY ="SELECT * FROM restaurant WHERE restaurantId = ?";
	private static final String GET_ALL_RESTAURANT_QUERY ="SELECT * FROM restaurant";
	private static final String UPDATE_QUERY ="UPDATE restaurant SET restaurantName=?, cuisineType=?, deliveryTime=?, address=?, rating=?, isActive=?, imagePath=? WHERE restaurantId=?";
    private static final String DELETE_QUERY ="DELETE FROM restaurant WHERE restaurantId=?";
	@Override
	public void addRestaurant(Restaurant r) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, r.getRestaurantName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setFloat(5, r.getRating());
			pstmt.setBoolean(6, r.isActive());
			pstmt.setString(7, r.getImagePath());
			
			// Step 4: Execute the query
	        int rows = pstmt.executeUpdate();
	        
	        System.out.println("Rows inserted: " + rows);
	        pstmt.close();
			
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateRestaurant(Restaurant r) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

	        pstmt.setString(1, r.getRestaurantName());
	        pstmt.setString(2, r.getCuisineType());
	        pstmt.setInt(3, r.getDeliveryTime());
	        pstmt.setString(4, r.getAddress());
	        pstmt.setFloat(5, r.getRating());
	        pstmt.setBoolean(6, r.isActive());
	        pstmt.setString(7, r.getImagePath());
	        pstmt.setInt(8, r.getRestaurantId());

	        int rows = pstmt.executeUpdate();

	        System.out.println("Rows Updated : " + rows);

	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	@Override
	public void deleteRestaurant(int restaurantId) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

	        pstmt.setInt(1, restaurantId);

	        int rows = pstmt.executeUpdate();

	        System.out.println("Rows Deleted : " + rows);

	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		 Restaurant restaurant = null;
		    Connection connection = DBConnection.getConnection();

		    try {
		        PreparedStatement pstmt = connection.prepareStatement(GET_RESTAURANT_QUERY);
		        pstmt.setInt(1, restaurantId);
		        ResultSet rs = pstmt.executeQuery();
		        if (rs.next()) {
		            restaurant = new Restaurant();
		            restaurant.setRestaurantId(rs.getInt("restaurantId"));
		            restaurant.setRestaurantName(rs.getString("restaurantName"));
		            restaurant.setCuisineType(rs.getString("cuisineType"));
		            restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
		            restaurant.setAddress(rs.getString("address"));
		            restaurant.setRating(rs.getFloat("rating"));
		            restaurant.setActive(rs.getBoolean("isActive"));
		            restaurant.setImagePath(rs.getString("imagePath"));
		        }
		        rs.close();
		        pstmt.close();

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return restaurant;

	}

	@Override
	public List<Restaurant> getAllRestaurant() {

	    List<Restaurant> restaurantList = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(GET_ALL_RESTAURANT_QUERY);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Restaurant restaurant = new Restaurant();

	            restaurant.setRestaurantId(rs.getInt("restaurantId"));
	            restaurant.setRestaurantName(rs.getString("restaurantName"));
	            restaurant.setCuisineType(rs.getString("cuisineType"));
	            restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
	            restaurant.setAddress(rs.getString("address"));
	            restaurant.setRating(rs.getFloat("rating"));
	            restaurant.setActive(rs.getBoolean("isActive"));
	            restaurant.setImagePath(rs.getString("imagePath"));
	            restaurantList.add(restaurant);
	        }

	        rs.close();
	        pstmt.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return restaurantList;
	}
}
