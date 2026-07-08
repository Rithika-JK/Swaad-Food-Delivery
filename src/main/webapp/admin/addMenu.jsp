<%@page import="java.util.List"%>
<%@page import="com.tap.model.Restaurant"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImpl"%>

<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

RestaurantDAOImpl restaurantDAO=new RestaurantDAOImpl();
List<Restaurant> restaurants=restaurantDAO.getAllRestaurant();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Menu Item</title>

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

<h1>Add Menu Item</h1>

<form action="../addMenu" method="post">

<label>Restaurant</label>

<select name="restaurantId" required>

<%
for(Restaurant r:restaurants){
%>

<option value="<%=r.getRestaurantId()%>">

<%=r.getRestaurantName()%>

</option>

<%
}
%>

</select>

<br><br>

<label>Item Name</label>

<input
type="text"
name="itemName"
required>

<br><br>

<label>Description</label>

<textarea
name="description"
rows="4"
cols="40"></textarea>

<br><br>

<label>Price</label>

<input
type="number"
step="0.01"
name="price"
required>

<br><br>

<label>Rating</label>

<input
type="number"
step="0.1"
min="0"
max="5"
name="rating"
required>

<br><br>

<label>Status</label>

<select name="isAvailable">

<option value="true">

Available

</option>

<option value="false">

Out Of Stock

</option>

</select>

<br><br>

<label>Image Path</label>

<input
type="text"
name="imagePath"
placeholder="images/burger.jpg"
required>

<br><br>

<button type="submit">

Add Menu Item

</button>

<a href="menu.jsp">

Cancel

</a>

</form>

</div>

</body>

</html>