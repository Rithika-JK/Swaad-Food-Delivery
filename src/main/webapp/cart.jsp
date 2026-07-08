<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="java.util.Collection"%>

<%
Cart cart = (Cart) session.getAttribute("cart");

float subtotal = 0;

if(cart != null){
    subtotal = cart.getTotalAmount();
}

float delivery = subtotal > 0 ? 40 : 0;
float gst = subtotal * 0.05f;
float grandTotal = subtotal + delivery + gst;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Swaad | Cart</title>

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
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="profile.jsp">Profile</a></li>
    </ul>

</nav>

<h1 class="heading">🛒 Your Cart</h1>

<div class="cart-container">

<%

if(cart != null && !cart.getItems().isEmpty()){

Collection<CartItem> items = cart.getItems();

for(CartItem item : items){

%>

<div class="cart-card">

    <!-- Food Image -->
    <div class="cart-image">

        <img src="<%=item.getImagePath()%>"
             alt="<%=item.getItemName()%>">

    </div>

    <!-- Food Details -->
    <div class="cart-details">

        <h2><%=item.getItemName()%></h2>
        <p><%=item.getImagePath()%></p>

        <p><strong>Price:</strong> ₹ <%=item.getPrice()%></p>

        <p><strong>Quantity:</strong> <%=item.getQuantity()%></p>

        <h3>Subtotal : ₹ <%=item.getTotalPrice()%></h3>

    </div>

    <!-- Buttons -->
    <div class="cart-buttons">

        <!-- Increase -->
        <form action="cart" method="post">

            <input type="hidden" name="action" value="update">

            <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">

            <input type="hidden" name="quantity" value="<%=item.getQuantity()+1%>">

            <button class="qty-btn">+</button>

        </form>

        <!-- Decrease -->
        <form action="cart" method="post">

            <input type="hidden" name="action" value="update">

            <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">

            <input type="hidden" name="quantity" value="<%=item.getQuantity()-1%>">

            <button class="qty-btn">−</button>

        </form>

        <!-- Remove -->
        <form action="cart" method="post">

            <input type="hidden" name="action" value="remove">

            <input type="hidden" name="menuId" value="<%=item.getMenuId()%>">

            <button class="remove-btn">

                Remove

            </button>

        </form>

    </div>

</div>
<%
}
%>

<div class="bill-box">

<h2>Bill Details</h2>

<p>Subtotal : ₹ <%=subtotal%></p>

<p>Delivery Charges : ₹ <%=delivery%></p>

<p>GST (5%) : ₹ <%=String.format("%.2f",gst)%></p>

<hr>

<h2>Total : ₹ <%=String.format("%.2f",grandTotal)%></h2>

<a href="checkout.jsp" class="checkout-btn">

Proceed to Checkout →

</a>

</div>

<%
}
else{
%>

<h2 style="text-align:center">

Your Cart is Empty 😔

</h2>

<%
}
%>

</div>

</body>
</html>