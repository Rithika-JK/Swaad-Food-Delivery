<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>

<%
Cart cart = (Cart) session.getAttribute("cart");

float subtotal = 0;

if(cart != null){
    subtotal = cart.getTotalAmount();
}

float delivery = subtotal > 0 ? 40 : 0;
float gst = subtotal * 0.05f;
float total = subtotal + delivery + gst;
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Swaad | Checkout</title>

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

<h1 class="heading">Checkout</h1>

<div class="checkout-container">

    <div class="checkout-form">

        <h2>Delivery Details</h2>

        <form action="order" method="post">

            <label>Full Name</label>

            <input type="text"
                   name="customerName"
                   required>

            <label>Phone Number</label>

            <input type="text"
                   name="phone"
                   required>

            <label>Delivery Address</label>

            <textarea
                name="address"
                rows="4"
                required></textarea>

            <label>Payment Method</label>

            <div class="payment-options">

                <label>

                    <input type="radio"
                           name="payment"
                           value="Cash on Delivery"
                           checked>

                    Cash on Delivery

                </label>

                <label>

                    <input type="radio"
                           name="payment"
                           value="UPI">

                    UPI

                </label>

                <label>

                    <input type="radio"
                           name="payment"
                           value="Card">

                    Credit / Debit Card

                </label>

            </div>

            <button class="checkout-btn">

                Place Order

            </button>

        </form>

    </div>

    <div class="bill-box">

        <h2>Order Summary</h2>

        <p>Subtotal : ₹ <%=subtotal%></p>

        <p>Delivery : ₹ <%=delivery%></p>

        <p>GST (5%) : ₹ <%=String.format("%.2f",gst)%></p>

        <hr>

        <h2>Total : ₹ <%=String.format("%.2f",total)%></h2>

    </div>

</div>

</body>

</html>