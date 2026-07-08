<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Swaad | Restaurants</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

     <div class="logo">
    <img src="images/logo.jpeg" alt="Swaad Logo">
    <span>Swaad</span>
</div>

    <ul class="nav-links">

        <li><a href="index.jsp">Home</a></li>

        <li><a href="restaurant">Restaurants</a></li>

        <li><a href="cart.jsp">Cart</a></li>

    </ul>

</nav>

<!-- ================= PAGE TITLE ================= -->

<h1 class="heading">Popular Restaurants</h1>

<!-- ================= RESTAURANT CARDS ================= -->

<div class="restaurant-container">

<%
@SuppressWarnings("unchecked")
List<Restaurant> restaurantList =
        (List<Restaurant>) request.getAttribute("restaurantList");

if (restaurantList != null && !restaurantList.isEmpty()) {

    for (Restaurant restaurant : restaurantList) {
%>

<div class="restaurant-card">

    <!-- Restaurant Image -->

    <img
        src="images/<%= restaurant.getImagePath() %>"
        alt="<%= restaurant.getRestaurantName() %>">

    <!-- Restaurant Details -->

    <div class="card-content">

        <h2><%= restaurant.getRestaurantName() %></h2>

        <p>
            <strong>Cuisine:</strong>
            <%= restaurant.getCuisineType() %>
        </p>

        <p>
            ⭐ <%= restaurant.getRating() %>
        </p>

        <p>
            🚴 <%= restaurant.getDeliveryTime() %> mins
        </p>

        <a class="btn"
           href="menu?restaurantId=<%= restaurant.getRestaurantId() %>">

            View Menu

        </a>

    </div>

</div>

<%
    }

} else {
%>

<h2 style="text-align:center;color:gray;">
    No Restaurants Available
</h2>

<%
}
%>

</div>

</body>
</html>