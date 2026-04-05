<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
    // Check user session
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
        return;
    }

    String pid = request.getParameter("id");
    if(pid == null){
        response.sendRedirect("packages.jsp");
        return;
    }

    int id = Integer.parseInt(pid);

    Connection con = DBConnection.getConnection();

    // Fetch package info
    PreparedStatement ps = con.prepareStatement("SELECT * FROM packages WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if(!rs.next()){
        out.println("Package not found");
        return;
    }

    // Fetch buses for this package (subquery avoids GROUP BY issues)
    PreparedStatement psBus = con.prepareStatement(
        "SELECT b.id, b.bus_name, b.type, b.seats, " +
        "(SELECT IFNULL(SUM(bb.booked_seats),0) FROM bus_booking bb WHERE bb.bus_id = b.id) as booked " +
        "FROM transport_bus b " +
        "WHERE b.package_id=?"
    );
    psBus.setInt(1, id);
    ResultSet rsBus = psBus.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Package Details</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">

<style>
/* Optional button style */
.btn-book {
    padding: 6px 12px;
    background: #28a745;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    margin-top: 5px;
    display: inline-block;
}
.btn-book:hover {
    background: #218838;
}
.card hr {
    margin: 10px 0;
}
</style>

</head>
<body>

<div class="navbar">
    <div> Tour & Travel</div>
    <div>
        <a href="packages.jsp">Back</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">

    <div class="card" style="width:400px;">

        <h2><%= rs.getString("title") %></h2>

        <p><b>Location:</b> <%= rs.getString("location") %></p>
        <p><b>Price:</b> &#8377;<%= rs.getString("price") %></p>
        <p><b>Description:</b></p>
        <p><%= rs.getString("description") %></p>

        <br>

        <!-- Book Package button -->
       <!-- Package Details Page -->
<a href="select_bus.jsp?package_id=<%= rs.getInt("id") %>" class="btn">Book Package</a>

        <hr>

        <h3>Available Buses</h3>

        <%
            boolean anyBus = false;
            while(rsBus.next()) {
                anyBus = true;

                int busId = rsBus.getInt("id");
                String busName = rsBus.getString("bus_name");
                String type = rsBus.getString("type");
                int totalSeats = rsBus.getInt("seats");
                int bookedSeats = rsBus.getInt("booked");
                int availableSeats = totalSeats - bookedSeats;
        %>
            <p><b><%= busName %> (<%= type %>)</b> - Seats Available: <%= availableSeats %></p>

            <% if(availableSeats > 0){ %>
                <a href="bookBus?bus_id=<%= busId %>" class="btn-book">Book Bus</a>
            <% } else { %>
                <span style="color:red;">Full</span>
            <% } %>
            <hr>
        <% } %>

        <% if(!anyBus){ %>
            <p>No buses available for this package yet.</p>
        <% } %>

    </div>

</div>

</body>
</html>