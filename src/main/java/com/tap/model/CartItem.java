package com.tap.model;

public class CartItem {

    private int menuId;
    private int restaurantId;
    private String itemName;
    private int quantity;
    private float price;
    private String imagePath;
    private float totalPrice;

    public CartItem() {
    }

    public CartItem(int menuId, int restaurantId,
                    String itemName, int quantity,
                    float price, String imagePath) {

        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
        this.imagePath = imagePath;
        this.totalPrice = quantity * price;
    }

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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.totalPrice = this.quantity * this.price;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
        this.totalPrice = this.quantity * this.price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    @Override
    public String toString() {
        return "CartItem [menuId=" + menuId
                + ", restaurantId=" + restaurantId
                + ", itemName=" + itemName
                + ", quantity=" + quantity
                + ", price=" + price
                + ", imagePath=" + imagePath
                + ", totalPrice=" + totalPrice + "]";
    }
}