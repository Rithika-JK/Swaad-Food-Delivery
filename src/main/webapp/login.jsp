<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Swaad | Login</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<nav class="navbar">

<div class="logo">
    <img src="images/logo.jpeg" alt="Swaad Logo">
    <span>Swaad</span>
</div>

<ul class="nav-links">

<li><a href="index.jsp">Home</a></li>

<li><a href="register.jsp">Register</a></li>

</ul>

</nav>

<div class="login-container">

<div class="login-box">

<h1>Welcome Back</h1>

<%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<p style="color:red;text-align:center">

<%=error%>

</p>

<%
}
%>

<form action="login" method="post">

<input
type="email"
name="email"
placeholder="Email Address"
required>

<input
type="password"
name="password"
placeholder="Password"
required>

<button type="submit">

Login

</button>

</form>

<p>

Don't have an account?

<a href="register.jsp">

Register

</a>

</p>

</div>

</div>

</body>

</html>