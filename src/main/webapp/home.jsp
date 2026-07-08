<%@page import="java.util.List"%>
<%@page import="com.tap.model.Restaurant"%>
<%@page import="com.tap.model.User"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImpl"%>

<%
User user=(User)session.getAttribute("loggedInUser");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}

RestaurantDAOImpl dao=new RestaurantDAOImpl();

List<Restaurant> restaurants=dao.getAllRestaurant();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Swaad Home</title>

<link rel="stylesheet" href="css/home.css">

</head>

<body>

<h1>Welcome <%=user.getUserName()%></h1>

<h2>Restaurants</h2>

<div class="container">

<%
for(Restaurant r:restaurants){
%>

<div class="card">

<h2><%=r.getRestaurantName()%></h2>

<p><b>Cuisine :</b> <%=r.getCuisineType()%></p>

<p><b>Rating :</b> ⭐ <%=r.getRating()%></p>

<p><b>Delivery :</b> <%=r.getDeliveryTime()%> mins</p>

<p><%=r.getAddress()%></p>

<a href="menu?restaurantId=<%=r.getRestaurantId()%>">

View Menu

</a>

</div>

<%
}
%>

</div>

</body>

</html>