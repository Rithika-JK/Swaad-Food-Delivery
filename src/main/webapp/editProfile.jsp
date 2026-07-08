<%@page import="com.tap.model.User"%>

<%
User user=(User)session.getAttribute("loggedInUser");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

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

<h1>Edit Profile</h1>

<form action="updateProfile" method="post">

    <label>Username</label>

    <input
        type="text"
        name="userName"
        value="<%=user.getUserName()%>"
        required>

    <label>Email</label>

    <input
        type="email"
        name="email"
        value="<%=user.getEmail()%>"
        required>

    <label>Address</label>

    <textarea
        name="address"
        rows="4"><%=user.getAddress()%></textarea>
    <button type="submit" class="checkout-btn"> Save Changes </button>
    <a href="profile.jsp" class="back-btn"> Cancel</a>
</form>
</div>

</div>

</body>

</html>