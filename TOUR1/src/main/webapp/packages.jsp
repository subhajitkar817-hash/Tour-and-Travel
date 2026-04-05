<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Packages</title>


<link rel="stylesheet" href="style.css">

</head>

<body>


<div class="navbar">
    <div> Tour & Travel</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
    </div>
</div>


<div class="container">
    <h2>Available Packages</h2>

<%
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM packages");

    while(rs.next()){
%>

    <div class="card">
        <h3><%= rs.getString("title") %></h3>

        <p><b>Location:</b> <%= rs.getString("location") %></p>
        <p><b>Price:</b> ₹<%= rs.getString("price") %></p>

      <a href="packagedetail.jsp?id=<%= rs.getInt("id") %>" class="btn">View Details
      </a>
        <a href="index.jsp" class="btn"> Back</a>
    </div>

<% } %>

</div>

</body>
</html>