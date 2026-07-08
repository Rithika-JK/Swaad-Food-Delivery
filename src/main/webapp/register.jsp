<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Swaad | Register</title>

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
        <li><a href="login.jsp">Login</a></li>
    </ul>

</nav>

<div class="login-container">

<div class="login-box">

<h1>Create Account</h1>

<form action="register" method="post">

<input
type="text"
name="userName"
placeholder="Full Name"
required>

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

<input
type="password"
name="confirmPassword"
placeholder="Confirm Password"
required>

<textarea
name="address"
placeholder="Address"
required></textarea>

<button type="submit">

Register

</button>

</form>

<p>

Already have an account?

<a href="login.jsp">

Login

</a>

</p>

</div>

</div>

</body>

</html>