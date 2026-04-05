<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
    // Optional: check if admin/user is logged in
   // Object userObj = session.getAttribute("userId");
   // if(userObj == null){
    //    response.sendRedirect("login.jsp");
    //    return;
  //  }

    // Connect to DB
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM transport ORDER BY id ASC");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Buses</title>
<link rel="stylesheet" href="style.css">
<style>
    .table-container {
        width: 90%;
        margin: 50px auto;
        background: rgba(255,255,255,0.95);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.3);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    th, td {
        border: 1px solid #333;
        padding: 10px;
        text-align: center;
    }
    th {
        background: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background: #f2f2f2;
    }
    .btn {
        display: inline-block;
        padding: 6px 12px;
        background: #28a745;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9rem;
    }
    .btn:hover {
        background: #218838;
    }
</style>
</head>
<body>

<div class="table-container">
    <h2 style="text-align:center;">All Buses</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Agency ID</th>
            <th>Bus Name</th>
            <th>Type</th>
            <th>Seats</th>
            <th>Price</th>
            <th>Package ID</th>
            <th>Action</th>
        </tr>

        <%
        while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("agency_id") %></td>
            <td><%= rs.getString("bus_name") %></td>
            <td><%= rs.getString("type") %></td>
            <td><%= rs.getInt("seats") %></td>
            <td>&#8377;<%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("package_id") %></td>
            <td>
                <a href="booking.jsp?id=<%= rs.getInt("id") %>" class="btn">Book</a>
            </td>
        </tr>
        <%
        }
        %>
    </table>
</div>

</body>
</html>