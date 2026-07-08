<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.DAOImpl.RestaurantDAOImpl"%>

<%
User admin = (User)session.getAttribute("loggedInUser");

if(admin == null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

String id = request.getParameter("restaurantId");

if(id == null){
    response.sendRedirect("restaurants.jsp");
    return;
}

RestaurantDAOImpl dao = new RestaurantDAOImpl();

Restaurant restaurant = dao.getRestaurant(Integer.parseInt(id));

if(restaurant == null){
    response.sendRedirect("restaurants.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Restaurant</title>

<link rel="stylesheet" href="css/admin.css">

</head>

<body>

<div class="sidebar">

<h2>Swaad Admin</h2>

<a href="dashboard.jsp">Dashboard</a>

<a href="users.jsp">Users</a>

<a href="restaurants.jsp">Restaurants</a>

<a href="menu.jsp">Menu</a>

<a href="orders.jsp">Orders</a>

<a href="delivery.jsp">Delivery</a>

<a href="../logout">Logout</a>

</div>

<div class="main">

<h1>Edit Restaurant</h1>

<form action="../updateRestaurant" method="post">

<input
type="hidden"
name="restaurantId"
value="<%=restaurant.getRestaurantId()%>">

<label>Restaurant Name</label>

<input
type="text"
name="restaurantName"
value="<%=restaurant.getRestaurantName()%>"
required>

<br><br>

<label>Cuisine Type</label>

<input
type="text"
name="cuisineType"
value="<%=restaurant.getCuisineType()%>"
required>

<br><br>

<label>Delivery Time</label>

<input
type="number"
name="deliveryTime"
value="<%=restaurant.getDeliveryTime()%>"
required>

<br><br>

<label>Address</label>

<input
type="text"
name="address"
value="<%=restaurant.getAddress()%>"
required>

<br><br>

<label>Rating</label>

<input
type="number"
step="0.1"
min="0"
max="5"
name="rating"
value="<%=restaurant.getRating()%>"
required>

<br><br>

<label>Status</label>

<select name="isActive">

<option value="true"
<%=restaurant.isActive() ? "selected" : ""%>>

Active

</option>

<option value="false"
<%=!restaurant.isActive() ? "selected" : ""%>>

Inactive

</option>

</select>

<br><br>

<label>Image Path</label>

<input
type="text"
name="imagePath"
value="<%=restaurant.getImagePath()%>"
required>

<br><br>

<button type="submit">

Update Restaurant

</button>

<a href="restaurants.jsp">

Cancel

</a>

</form>

</div>

</body>

</html>