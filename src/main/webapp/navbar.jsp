<%@ page import="com.tap.model.User" %>

<nav class="navbar">

     <div class="logo">
    <img src="images/logo.jpeg" alt="Swaad Logo">
    <span>Swaad</span>
</div>

    <%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    %>

    <ul class="nav-links">

        <li><a href="index.jsp">Home</a></li>

        <li><a href="restaurant">Restaurants</a></li>

        <li><a href="cart.jsp">Cart</a></li>

        <% if(loggedInUser != null){ %>

            <li style="color:#FC8019;font-weight:600;">
                Hi, <%=loggedInUser.getUserName()%>
            </li>

            <li><a href="logout">Logout</a></li>

        <% } else { %>

            <li><a href="login.jsp">Login</a></li>

            <li><a href="register.jsp">Register</a></li>

        <% } %>

    </ul>

</nav>