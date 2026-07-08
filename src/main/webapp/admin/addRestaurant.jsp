<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
User admin = (User)session.getAttribute("loggedInUser");

if(admin == null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Restaurant</title>

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

<h1>Add New Restaurant</h1>

<form action="../addRestaurant" method="post">

<label>Restaurant Name</label>

<input type="text"
name="restaurantName"
required>

<br><br>

<label>Cuisine Type</label>

<input type="text"
name="cuisineType"
required>

<br><br>

<label>Delivery Time (Minutes)</label>

<input type="number"
name="deliveryTime"
required>

<br><br>

<label>Address</label>

<input type="text"
name="address"
required>

<br><br>

<label>Rating</label>

<input type="number"
name="rating"
step="0.1"
min="0"
max="5"
required>

<br><br>

<label>Status</label>

<select name="isActive">

<option value="true">

Active

</option>

<option value="false">

Inactive

</option>

</select>

<br><br>

<label>Image Path</label>

<input type="text"
name="imagePath"
placeholder="images/kfc.jpg"
required>

<br><br>

<button type="submit">

Add Restaurant

</button>

<a href="restaurants.jsp">

Cancel

</a>

</form>

</div>

</body>

</html>