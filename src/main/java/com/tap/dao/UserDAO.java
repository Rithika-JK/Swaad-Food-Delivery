package com.tap.dao;

import java.util.List;
import com.tap.model.User;

public interface UserDAO {

    // Register
    void addUser(User u);

    // Update
    void updateUser(User u);

    // Delete
    void deleteUser(int id);

    // Get User by ID
    User getUser(int id);

    // Get All Users
    List<User> getAllUser();

    // Login
    User getUserByEmail(String email);

    // Email Validation
    boolean emailExists(String email);
    

    // Update Last Login
    void updateLastLogin(int userId);
}