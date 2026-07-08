<%@page import="java.util.List"%>
<%@page import="com.tap.model.Menu"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.MenuDAOImpl"%>

<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

MenuDAOImpl dao=new MenuDAOImpl();
List<Menu> menuList=dao.getAllMenu();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Menu Management</title>

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

<h1>Menu Management</h1>

<p>

<a href="addMenu.jsp">

➕ Add New Menu Item

</a>

</p>

<table class="admin-table">

<tr>

<th>ID</th>

<th>Restaurant ID</th>

<th>Item</th>

<th>Description</th>

<th>Price</th>

<th>Rating</th>

<th>Status</th>

<th>Image</th>

<th>Actions</th>

</tr>

<%
for(Menu m : menuList){
%>

<tr>

<td><%=m.getMenuId()%></td>

<td><%=m.getRestaurantId()%></td>

<td><%=m.getItemName()%></td>

<td><%=m.getDescription()%></td>

<td>₹ <%=m.getPrice()%></td>

<td><%=m.getRating()%></td>

<td>

<%=m.isAvailable() ? "Available" : "Out of Stock"%>

</td>

<td>

<img src="../<%=m.getImagePath()%>"

width="80"

height="60">

</td>

<td>

<a href="editMenu.jsp?menuId=<%=m.getMenuId()%>">

Edit

</a>

|

<a href="../deleteMenu?menuId=<%=m.getMenuId()%>"
onclick="return confirm('Delete this menu item?');">

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