package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/instant_food";
    private static final String USER = "root";
    private static final String PASSWORD = "rithika";

    private static Connection connection;

    // Private constructor (prevents object creation)
    private DBConnection() {
    }

    // Get single connection (Singleton pattern)
    public static Connection getConnection() {

        if (connection == null) {
            try {
                // Load MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create connection
                connection = DriverManager.getConnection(URL, USER, PASSWORD);

                System.out.println("✅ Database Connected Successfully!");

            } catch (ClassNotFoundException e) {
                System.out.println("❌ MySQL Driver not found!");
                e.printStackTrace();

            } catch (SQLException e) {
                System.out.println("❌ Database connection failed!");
                e.printStackTrace();
            }
        }

        return connection;
    }
}