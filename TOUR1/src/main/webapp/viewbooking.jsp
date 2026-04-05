<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Bookings</title>

<link rel="stylesheet" href="style.css">

</head>

<body>


<div class="navbar">
    <div> Admin Panel</div>
    <div>
        <a href="adminhome.jsp">Dashboard</a>
        <a href="view_packages.jsp">Packages</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>


<div class="container">
    <h2>All Bookings</h2>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Package ID</th>
            <th>Date</th>
        </tr>

<%
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM bookings");

    while(rs.next()){
%>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getInt("package_id") %></td>
            <td><%= rs.getString("date") %></td>
        </tr>

<% } %>

    </table>

</div>

</body>
</html>