<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String customerName = (String)session.getAttribute("customerName");
String address = (String)session.getAttribute("address");
String payment = (String)session.getAttribute("payment");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Successful</title>

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
        <li><a href="restaurant">Restaurants</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="profile.jsp">Profile</a></li>

    </ul>

</nav>

<div class="success-container">

    <div class="success-card">

        <div class="success-icon">

            ✅

        </div>

        <h1>Order Placed Successfully!</h1>

        <p>

            Thank you,
            <strong><%=customerName%></strong>

        </p>

        <p>

            Your delicious food is being prepared.

        </p>

        <hr>

        <p>

            <strong>Delivery Address</strong>

        </p>

        <p>

            <%=address%>

        </p>

        <p>

            <strong>Payment Method</strong>

        </p>

        <p>

            <%=payment%>

        </p>

        <p>

            <strong>Estimated Delivery Time</strong>

        </p>

        <h2>

            25 - 35 Minutes 🚴

        </h2>

        <a href="restaurant" class="home-btn">

            Order Again

        </a>

    </div>

</div>

</body>
</html>