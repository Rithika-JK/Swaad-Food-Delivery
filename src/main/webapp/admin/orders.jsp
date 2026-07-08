<%@page import="java.util.List"%>
<%@page import="com.tap.model.Order"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.OrderDAOImpl"%>

<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

OrderDAOImpl dao=new OrderDAOImpl();

List<Order> orders=dao.getAllOrders();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Management</title>

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

<h1>Order Management</h1>

<table>

<tr>

<th>Order ID</th>

<th>User ID</th>

<th>Restaurant ID</th>

<th>Date</th>

<th>Total</th>

<th>Status</th>

<th>Payment</th>

<th>Actions</th>

</tr>

<%
for(Order o:orders){
%>

<tr>

<td><%=o.getOrderId()%></td>

<td><%=o.getUserId()%></td>

<td><%=o.getRestaurantId()%></td>

<td><%=o.getOrderDate()%></td>

<td>₹ <%=o.getTotalAmount()%></td>

<td><%=o.getStatus()%></td>

<td><%=o.getPaymentMode()%></td>

<td>

<a href="editOrder.jsp?orderId=<%=o.getOrderId()%>">

Update Status

</a>

|

<a href="../deleteOrder?orderId=<%=o.getOrderId()%>"
onclick="return confirm('Delete this order?');">

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