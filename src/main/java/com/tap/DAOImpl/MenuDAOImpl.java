package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private static final String INSERT_QUERY ="INSERT INTO menu(restaurantId, itemName, description, price, isAvailable, rating, imagePath) VALUES(?,?,?,?,?,?,?)";

    private static final String GET_QUERY ="SELECT * FROM menu WHERE menuId=?";

    private static final String GET_ALL_QUERY ="SELECT * FROM menu";

    private static final String UPDATE_QUERY = "UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, rating=?, imagePath=? WHERE menuId=?";

    private static final String DELETE_QUERY = "DELETE FROM menu WHERE menuId=?";
    
    private static final String GET_MENU_BY_RESTAURANT ="SELECT * FROM menu WHERE restaurantId = ?";
    
    
    @Override
    public void addMenu(Menu menu) {

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setFloat(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setFloat(6, menu.getRating());
            pstmt.setString(7, menu.getImagePath());

            int rows = pstmt.executeUpdate();

            System.out.println("Rows Inserted : " + rows);

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

            pstmt.setInt(1, menuId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getFloat("price"));
                menu.setAvailable(rs.getBoolean("isAvailable"));
                menu.setRating(rs.getFloat("rating"));
                menu.setImagePath(rs.getString("imagePath"));
            }

            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menu;
    }
    
    
    
    @Override
    public List<Menu> getAllMenu() {

        List<Menu> menuList = new ArrayList<>();

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(GET_ALL_QUERY);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getFloat("price"));
                menu.setAvailable(rs.getBoolean("isAvailable"));
                menu.setRating(rs.getFloat("rating"));
                menu.setImagePath(rs.getString("imagePath"));

                menuList.add(menu);
            }

            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
    
    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_MENU_BY_RESTAURANT);

            pstmt.setInt(1, restaurantId);
            System.out.println("Restaurant ID = " + restaurantId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
            	System.out.println("Menu Found: " + rs.getString("itemName"));

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setItemName(rs.getString("itemName"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getFloat("price"));
                menu.setAvailable(rs.getBoolean("isAvailable"));
                menu.setRating(rs.getFloat("rating")); // Use "rating" if that's your actual column name
                menu.setImagePath(rs.getString("imagePath"));

                menuList.add(menu);
            }

            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
    @Override
    public void updateMenu(Menu menu) {

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setFloat(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setFloat(6, menu.getRating());
            pstmt.setString(7, menu.getImagePath());
            pstmt.setInt(8, menu.getMenuId());

            int rows = pstmt.executeUpdate();

            System.out.println("Rows Updated : " + rows);

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    @Override
    public void deleteMenu(int menuId) {

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, menuId);

            int rows = pstmt.executeUpdate();

            System.out.println("Rows Deleted : " + rows);

            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

}