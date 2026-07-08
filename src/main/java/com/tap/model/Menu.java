package com.tap.model;

public class Menu {

    private int menuId;
    private int restaurantId;
    private String itemName;
    private String description;
    private float price;
    private boolean isAvailable;
    private float rating;
    private String imagePath;

    // Default Constructor
    public Menu() {
    }

    // Constructor without menuId
    public Menu(int restaurantId, String itemName, String description,
                float price, boolean isAvailable, float rating, String imagePath) {
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
        this.rating = rating;
        this.imagePath = imagePath;
    }

    // Constructor with menuId
    public Menu(int menuId, int restaurantId, String itemName, String description,
                float price, boolean isAvailable, float rating, String imagePath) {
        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
        this.rating = rating;
        this.imagePath = imagePath;
    }

    // Getters and Setters

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    // toString()

    @Override
    public String toString() {
        return "Menu [menuId=" + menuId +
                ", restaurantId=" + restaurantId +
                ", itemName=" + itemName +
                ", description=" + description +
                ", price=" + price +
                ", isAvailable=" + isAvailable +
                ", rating=" + rating +
                ", imagePath=" + imagePath + "]";
    }
}