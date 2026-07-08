<%@page import="java.util.List"%>
<%@page import="com.tap.model.Restaurant"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImpl"%>
<%@page import="com.tap.model.User"%>

<%
User admin = (User)session.getAttribute("loggedInUser");

if(admin == null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

RestaurantDAOImpl dao = new RestaurantDAOImpl();

List<Restaurant> restaurants = dao.getAllRestaurant();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Restaurant Management</title>

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

<h1>Restaurant Management</h1>

<p>

<a href="addRestaurant.jsp">

Add New Restaurant

</a>

</p>

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Cuisine</th>

<th>Delivery</th>

<th>Rating</th>

<th>Status</th>

<th>Action</th>

</tr>

<%
for(Restaurant r : restaurants){
%>

<tr>

<td><%=r.getRestaurantId()%></td>

<td><%=r.getRestaurantName()%></td>

<td><%=r.getCuisineType()%></td>

<td><%=r.getDeliveryTime()%> mins</td>

<td><%=r.getRating()%></td>

<td>

<%=r.isActive() ? "Active" : "Inactive"%>

</td>

<td>

<a href="editRestaurant.jsp?restaurantId=<%=r.getRestaurantId()%>">

Edit

</a>

|

<a href="../deleteRestaurant?restaurantId=<%=r.getRestaurantId()%>"
onclick="return confirm('Delete this restaurant?')">

Delete

</a>

</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>