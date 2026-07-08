<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Swaad | Menu</title>

<link rel="stylesheet" href="css/style.css">

</head>
<body>

<!-- Navbar -->

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

<h1 class="heading">Our Delicious Menu</h1>

<div class="restaurant-container">

<%
@SuppressWarnings("unchecked")
List<Menu> menuList = (List<Menu>)request.getAttribute("menuList");

if(menuList != null && !menuList.isEmpty()){

    for(Menu menu : menuList){
%>

<div class="restaurant-card">

    <img src="<%=menu.getImagePath()%>"
         alt="<%=menu.getItemName()%>">

    <div class="card-content">

        <h2><%=menu.getItemName()%></h2>

        <p><%=menu.getDescription()%></p>

        <p>⭐ <%=menu.getRating()%></p>

        <h3>₹ <%=menu.getPrice()%></h3>

        <form action="cart" method="post">

            <input type="hidden" name="action" value="add">

            <input type="hidden" name="menuId"  value="<%=menu.getMenuId()%>">

            <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId()%>">

            <input type="hidden" name="itemName" value="<%=menu.getItemName()%>">

            <input type="hidden" name="price" value="<%=menu.getPrice()%>">
            <input type="hidden" name="imagePath" value="<%=menu.getImagePath()%>">

            <button class="btn">
                Add to Cart
            </button>

        </form>

    </div>

</div>

<%
    }

}else{
%>

<h2>No Menu Items Found</h2>

<%
}
%>

</div>

</body>
</html>