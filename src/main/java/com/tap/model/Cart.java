package com.tap.model;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items;

    public Cart() {
        items = new LinkedHashMap<>();
    }
    public void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if (items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQuantity(
                    existingItem.getQuantity() + item.getQuantity());

        } else {

            items.put(menuId, item);
        }
    }

    public void updateItem(int menuId, int quantity) {

        if (items.containsKey(menuId)) {

            if (quantity <= 0) {
                items.remove(menuId);
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }
    public void removeItem(int menuId) {

        items.remove(menuId);
    }
    public CartItem getItem(int menuId) {

        return items.get(menuId);
    }

    public Collection<CartItem> getItems() {

        return items.values();
    }
    public float getTotalAmount() {

        float total = 0;

        for (CartItem item : items.values()) {

            total += item.getTotalPrice();
        }

        return total;
    }

    public void clearCart() {

        items.clear();
    }
}