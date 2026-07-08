<%@page import="com.tap.model.User"%>
<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

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

<h1>Welcome, <%=admin.getUserName()%></h1>

<div class="cards">

<div class="card">
<h2>Users</h2>
<p>0</p>
</div>

<div class="card">
<h2>Restaurants</h2>
<p>0</p>
</div>

<div class="card">
<h2>Orders</h2>
<p>0</p>
</div>

<div class="card">
<h2>Revenue</h2>
<p>₹0</p>
</div>

</div>

</div>

</body>
</html>