<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Swaad | Food Delivery</title>

<link rel="stylesheet" href="css/home.css">

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

<!-- Hero Section -->

<section class="hero">

    <div class="hero-overlay">

        <h1>Hungry?</h1>

        <h2>Order food from your favourite restaurants</h2>

        <p>
            Fresh food • Fast delivery • Best restaurants near you
        </p>

        <input
            type="text"
            class="search-box"
            placeholder="Search restaurants, pizza, biryani...">

        <br><br>

        <a href="restaurant" class="btn">

            Explore Restaurants →

        </a>

    </div>

</section>



<!-- Categories -->

<section class="categories">

<h2>What's on your mind?</h2>

<div class="category-container">

<div class="category-card">

<img src="images/categories/pizza.jpeg">

<h3>Pizza</h3>

</div>

<div class="category-card">

<img src="images/categories/burger.jpeg">

<h3>Burger</h3>

</div>

<div class="category-card">

<img src="images/categories/biryani.jpeg">

<h3>Biryani</h3>

</div>

<div class="category-card">

<img src="images/categories/dosa.jpeg">

<h3>Dosa</h3>

</div>

<div class="category-card">

<img src="images/categories/desserts.jpeg">

<h3>Desserts</h3>

</div>

</div>

</section>



<section class="popular">

<h2>Explore Restaurants</h2>

<p>

Order from hundreds of restaurants around you.

</p>

<a href="restaurant" class="btn">

View Restaurants

</a>

</section>



<footer>

<h2>Swaad</h2>

<p>

Delicious food delivered to your doorstep.

</p>

<p>

© 2026 Swaad. All Rights Reserved.

</p>

</footer>

   </body>

</html>