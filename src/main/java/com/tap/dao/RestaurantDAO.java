package com.tap.dao;

import java.util.List;
import com.tap.model.Restaurant;

public interface RestaurantDAO {

    void addRestaurant(Restaurant r);

    void updateRestaurant(Restaurant r);

    void deleteRestaurant(int restaurantId);

    Restaurant getRestaurant(int restaurantId);

    List<Restaurant> getAllRestaurant();

}
