<%@page import="com.tap.model.User"%>

<%
User user = (User)session.getAttribute("loggedInUser");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<nav class="navbar">

<div class="logo">

<img src="images/logo.jpeg">

<span>Swaad</span>

</div>

<ul class="nav-links">

<li><a href="index.jsp">Home</a></li>

<li><a href="restaurant">Restaurants</a></li>

<li><a href="cart.jsp">Cart</a></li>

<li><a href="profile.jsp">Profile</a></li>

</ul>

</nav>

<div class="profile-container">

<div class="profile-card">

<h1>👤 My Profile</h1>

<p><strong>Name :</strong> <%=user.getUserName()%></p>
<p><strong>Email :</strong> <%=user.getEmail()%></p>
<p><strong>Address :</strong> <%=user.getAddress()%></p>
<p><strong>Role :</strong> <%=user.getRole()%></p>

<br>

<a href="editProfile.jsp" class="checkout-btn">Edit Profile</a>
</div>

</div>

</body>

</html>