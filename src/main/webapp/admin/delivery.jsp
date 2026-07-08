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
<title>Restaurants</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>

<div class="sidebar">

<h2>Delivery Admin</h2>

<a href="dashboard.jsp">Dashboard</a>
<a href="users.jsp">Users</a>
<a href="restaurants.jsp">Restaurants</a>
<a href="menu.jsp">Menu</a>
<a href="orders.jsp">Orders</a>
<a href="delivery.jsp">Delivery</a>
<a href="../logout">Logout</a>

</div>

<div class="main">

<h1>Delivery Management</h1>

<p>Delivery management will be implemented here.</p>

</div>

</body>
</html>