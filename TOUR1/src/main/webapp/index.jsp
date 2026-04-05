<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour & Travel</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="home-bg">

<!-- Navbar -->
<div class="navbar">
    <div>🌍 Tour & Travel</div>
    <div>
        <a href="index.jsp">Home</a>
        <% if(user == null){ %>
            <a href="loginchoice.jsp">Login</a>
            <a href="register.jsp">Register</a>
        <% } else { %>
            <a href="packages.jsp">Packages</a>
            <a href="logout.jsp">Logout</a>
        <% } %>
    </div>
</div>

<!-- Hero Section -->
<div class="container">
    <div class="card">
        <h1>Welcome to Tour & Travel</h1>
        <p>Explore the world with the best travel packages.</p>
        <br>
        <% if(user == null){ %>
            <a href="loginchoice.jsp" class="btn">Login</a>
            <a href="register.jsp" class="btn">Register</a>
        <% } else { %>
            <a href="packages.jsp" class="btn">View Packages</a>
            <a href="logout.jsp" class="btn">Logout</a>
        <% } %>
    </div>
</div>

</body>
</html>