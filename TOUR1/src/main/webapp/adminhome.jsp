<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("admin") == null){
        response.sendRedirect("adminlogin.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Link CSS -->
<link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <div> Admin Dashboard</div>
    <div>
        <a href="admin_home.jsp">Home</a>
        <a href="logout.jsp">Logout</a>

    </div>
</div>

<!-- Container -->
<div class="container">

    <h2>Welcome Admin</h2>

    <div class="card">
        <a href="addpackage.jsp" class="btn"> Add Package</a><br><br>

        <a href="viewpackage.jsp" class="btn"> Manage Packages</a><br><br>

        <a href="viewbooking.jsp" class="btn"> View Bookings</a><br><br>

        <a href="logout.jsp" class="btn"> Logout</a>
    </div>

</div>

</body>
</html>