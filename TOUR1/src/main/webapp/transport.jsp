<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
    }

    int package_id = Integer.parseInt(request.getParameter("package_id"));

    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
    "SELECT t.*, a.name FROM transport t JOIN transport_agency a ON t.agency_id = a.id WHERE t.package_id=?"
    );

    ps.setInt(1, package_id);

    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Transport</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <div>🌍 Tour & Travel</div>
    <div>
        <a href="packages.jsp">Packages</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<!-- Content -->
<div class="container">

    <h2>🚍 Available Buses</h2>

    <%
    boolean found = false;
    while(rs.next()){
        found = true;
    %>

    <div class="card">

        <h3><%= rs.getString("bus_name") %></h3>

        <p><b>Type:</b> <%= rs.getString("type") %></p>

        <p><b>Seats:</b> <%= rs.getString("seats") %></p>

        <p><b>Price:</b> &#8377;<%= rs.getString("price") %></p>

        <p><b>Agency:</b> <%= rs.getString("name") %></p>

    </div>

    <%
    }

    if(!found){
    %>

        <p style="color:white; font-size:18px;">No transport available for this package.</p>

    <%
    }
    %>

</div>

</body>
</html>