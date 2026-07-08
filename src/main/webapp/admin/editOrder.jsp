<%@page import="com.tap.model.Order"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.OrderDAOImpl"%>

<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

String id=request.getParameter("orderId");

if(id==null){
    response.sendRedirect("orders.jsp");
    return;
}

OrderDAOImpl dao=new OrderDAOImpl();

Order order=dao.getOrder(Integer.parseInt(id));
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Update Order</title>

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

<h1>Update Order Status</h1>

<form action="../updateOrder" method="post">

<input type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<input type="hidden"
name="userId"
value="<%=order.getUserId()%>">

<input type="hidden"
name="restaurantId"
value="<%=order.getRestaurantId()%>">

<input type="hidden"
name="orderDate"
value="<%=order.getOrderDate()%>">

<input type="hidden"
name="totalAmount"
value="<%=order.getTotalAmount()%>">

<input type="hidden"
name="paymentMode"
value="<%=order.getPaymentMode()%>">

<p><b>Order ID :</b> <%=order.getOrderId()%></p>

<p><b>User ID :</b> <%=order.getUserId()%></p>

<p><b>Restaurant ID :</b> <%=order.getRestaurantId()%></p>

<p><b>Total :</b> ₹ <%=order.getTotalAmount()%></p>

<p><b>Payment :</b> <%=order.getPaymentMode()%></p>

<label>Status</label>

<select name="status">

<option value="Placed"
<%=order.getStatus().equals("Placed")?"selected":""%>>

Placed

</option>

<option value="Accepted"
<%=order.getStatus().equals("Accepted")?"selected":""%>>

Accepted

</option>

<option value="Preparing"
<%=order.getStatus().equals("Preparing")?"selected":""%>>

Preparing

</option>

<option value="Out For Delivery"
<%=order.getStatus().equals("Out For Delivery")?"selected":""%>>

Out For Delivery

</option>

<option value="Delivered"
<%=order.getStatus().equals("Delivered")?"selected":""%>>

Delivered

</option>

<option value="Cancelled"
<%=order.getStatus().equals("Cancelled")?"selected":""%>>

Cancelled

</option>

</select>

<br><br>

<button type="submit">

Update Order

</button>

<a href="orders.jsp">

Cancel

</a>

</form>

</div>

</body>

</html>