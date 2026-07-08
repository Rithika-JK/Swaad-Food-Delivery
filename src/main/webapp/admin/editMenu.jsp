<%@page import="com.tap.model.Menu"%>
<%@page import="com.tap.model.Restaurant"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.MenuDAOImpl"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImpl"%>
<%@page import="java.util.List"%>

<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

String id=request.getParameter("menuId");

if(id==null){
    response.sendRedirect("menu.jsp");
    return;
}

MenuDAOImpl menuDAO=new MenuDAOImpl();
RestaurantDAOImpl restaurantDAO=new RestaurantDAOImpl();

Menu menu=menuDAO.getMenu(Integer.parseInt(id));

List<Restaurant> restaurants=restaurantDAO.getAllRestaurant();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Menu</title>

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

<h1>Edit Menu Item</h1>

<form action="../updateMenu" method="post">

<input type="hidden"
name="menuId"
value="<%=menu.getMenuId()%>">

<label>Restaurant</label>

<select name="restaurantId">

<%
for(Restaurant r:restaurants){
%>

<option value="<%=r.getRestaurantId()%>"
<%=menu.getRestaurantId()==r.getRestaurantId()?"selected":""%>>

<%=r.getRestaurantName()%>

</option>

<%
}
%>

</select>

<br><br>

<label>Item Name</label>

<input type="text"
name="itemName"
value="<%=menu.getItemName()%>">

<br><br>

<label>Description</label>

<textarea name="description"><%=menu.getDescription()%></textarea>

<br><br>

<label>Price</label>

<input type="number"
step="0.01"
name="price"
value="<%=menu.getPrice()%>">

<br><br>

<label>Rating</label>

<input type="number"
step="0.1"
name="rating"
value="<%=menu.getRating()%>">

<br><br>

<label>Status</label>

<select name="isAvailable">

<option value="true"
<%=menu.isAvailable()?"selected":""%>>

Available

</option>

<option value="false"
<%=!menu.isAvailable()?"selected":""%>>

Out Of Stock

</option>

</select>

<br><br>

<label>Image Path</label>

<input type="text"
name="imagePath"
value="<%=menu.getImagePath()%>">

<br><br>

<button type="submit">

Update Menu

</button>

</form>

</div>

</body>

</html>