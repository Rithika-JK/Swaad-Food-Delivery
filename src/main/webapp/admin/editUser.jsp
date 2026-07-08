<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.DAOImpl.UserDAOImpl"%>

<%
User admin = (User) session.getAttribute("loggedInUser");

if(admin == null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

String userIdStr = request.getParameter("userId");

if(userIdStr == null){
    response.sendRedirect("users.jsp");
    return;
}

int userId = Integer.parseInt(userIdStr);

UserDAOImpl dao = new UserDAOImpl();

User user = dao.getUser(userId);

if(user == null){
    response.sendRedirect("users.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit User</title>

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

<h1>Edit User</h1>

<form action="../updateUser" method="post">

<input type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<label>User Name</label>

<input type="text"
name="userName"
value="<%=user.getUserName()%>"
required>

<br><br>

<label>Email</label>

<input type="email"
name="email"
value="<%=user.getEmail()%>"
required>

<br><br>

<label>Address</label>

<input type="text"
name="address"
value="<%=user.getAddress()%>"
required>

<br><br>

<label>Role</label>

<select name="role">

<option value="customer"
<%=user.getRole().equals("customer") ? "selected" : ""%>>
Customer
</option>

<option value="restaurant"
<%=user.getRole().equals("restaurant") ? "selected" : ""%>>
Restaurant
</option>

<option value="deliveryAgent"
<%=user.getRole().equals("deliveryAgent") ? "selected" : ""%>>
Delivery Agent
</option>

<option value="superAdmin"
<%=user.getRole().equals("superAdmin") ? "selected" : ""%>>
Super Admin
</option>

</select>

<br><br>

<button type="submit">

Update User

</button>

<a href="users.jsp">

Cancel

</a>

</form>

</div>

</body>

</html>