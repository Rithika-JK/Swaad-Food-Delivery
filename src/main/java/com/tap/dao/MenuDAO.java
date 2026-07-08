package com.tap.dao;

import java.util.List;
import com.tap.model.Menu;

public interface MenuDAO {

    // Create
    void addMenu(Menu menu);

    // Read (Single Record)
    Menu getMenu(int menuId);

    // Read (All Records)
    List<Menu> getAllMenu();
    
 // Read Menu by Restaurant
    List<Menu> getMenuByRestaurantId(int restaurantId);

    // Update
    void updateMenu(Menu menu);

    // Delete
    void deleteMenu(int menuId);

}