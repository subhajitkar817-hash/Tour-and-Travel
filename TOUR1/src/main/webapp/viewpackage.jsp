<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Packages</title>


<link rel="stylesheet" href="style.css">

</head>

<body>


<div class="navbar">
    <div> Admin Panel</div>
    <div>
        <a href="adminhome.jsp">Dashboard</a>
        <a href="viewbookings.jsp">Bookings</a>
        <a href="logout.jsp">Logout</a>
        <a href="adminhome.jsp" class="btn"> Back</a>
    </div>
</div>


<div class="container">
    <h2>All Packages</h2>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Location</th>
            <th>Price</th>
            <th>Action</th>
        </tr>

<%
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM packages");

    while(rs.next()){
%>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getString("price") %></td>
           <td>
   			 <a href="editpackage.jsp?id=<%= rs.getInt("id") %>" class="btn">Edit</a>

    		<a href="deletePackage?id=<%= rs.getInt("id") %>" 
     		 class="btn btn-delete"
       		onclick="return confirm('Are you sure to delete?')">
     	  Delete
   			 </a>
		</td>
        </tr>

<% } %>

    </table>

</div>

</body>
</html>