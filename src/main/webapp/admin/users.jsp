<%@page import="java.util.List"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.UserDAOImpl"%>

<%
User admin=(User)session.getAttribute("loggedInUser");

if(admin==null || !"superAdmin".equals(admin.getRole())){
    response.sendRedirect("../login.jsp");
    return;
}

UserDAOImpl dao = new UserDAOImpl();

List<User> users = dao.getAllUsers();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Users</title>

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

<h1>Registered Users</h1>

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Email</th>

<th>Role</th>

<th>Address</th>

<th>Last Login</th>

<th>Action</th>

</tr>

<%
for(User u : users){
%>

<tr>

<td><%=u.getUserId()%></td>

<td><%=u.getUserName()%></td>

<td><%=u.getEmail()%></td>

<td><%=u.getRole()%></td>

<td><%=u.getAddress()%></td>

<td><%=u.getLastLoginDate()%></td>

<td>

<a class="edit-btn"
href="editUser.jsp?userId=<%=u.getUserId()%>">

Edit

</a>

<%
if(!"superAdmin".equals(u.getRole())){
%>

<a class="delete-btn"
href="../deleteUser?userId=<%=u.getUserId()%>"
onclick="return confirm('Delete this user?')">

Delete

</a>

<%
}else{
%>

<b>Protected</b>

<%
}
%>

</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>