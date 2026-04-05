<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
    // ===== 1. Check user session =====
    Object userObj = session.getAttribute("userId");
    if(userObj == null){
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = (int) userObj;

    // ===== 2. Get bus ID safely =====
    String busIdParam = request.getParameter("id");
    if(busIdParam == null){
        out.println("<h3>Bus ID is missing!</h3>");
        return;
    }
    int busId = 0;
    try {
        busId = Integer.parseInt(busIdParam);
    } catch(NumberFormatException e){
        out.println("<h3>Invalid Bus ID!</h3>");
        return;
    }

    // ===== 3. Connect to database =====
    Connection con = null;
    PreparedStatement psBus = null;
    PreparedStatement psPack = null;
    ResultSet rsBus = null;
    ResultSet rsPack = null;

    try {
        con = DBConnection.getConnection();

        // 3a. Get bus info + available seats
        psBus = con.prepareStatement(
            "SELECT b.*, (b.seats - IFNULL((SELECT SUM(bb.booked_seats) FROM bus_booking bb WHERE bb.bus_id=b.id),0)) AS available_seats " +
            "FROM transport_bus b WHERE id=?"
        );
        psBus.setInt(1, busId);
        rsBus = psBus.executeQuery();
        if(!rsBus.next()){
            out.println("<h3>Bus not found!</h3>");
            return;
        }
        int availableSeats = rsBus.getInt("available_seats");
        int packageId = rsBus.getInt("package_id");

        // 3b. Get package info
        psPack = con.prepareStatement("SELECT * FROM packages WHERE id=?");
        psPack.setInt(1, packageId);
        rsPack = psPack.executeQuery();
        if(!rsPack.next()){
            out.println("<h3>Package not found!</h3>");
            return;
        }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Bus</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="navbar">
    <div>🌍 Tour & Travel</div>
    <div>
        <a href="packages.jsp">Back to Packages</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>Booking: <%= rsPack.getString("title") %></h2>
        <p><b>Location:</b> <%= rsPack.getString("location") %></p>
        <p><b>Bus:</b> <%= rsBus.getString("bus_name") %> (<%= rsBus.getString("type") %>)</p>
        <p><b>Available Seats:</b> <%= availableSeats %></p>
        <p><b>Price per Seat:</b> &#8377;<%= rsBus.getString("price") %></p>

        <% if(availableSeats > 0){ %>
            <form action="BookBusServlet" method="post">
                <input type="hidden" name="bus_id" value="<%= busId %>">
                <input type="hidden" name="user_id" value="<%= userId %>">
                
                <label for="seats">Seats to book:</label>
                <input type="number" id="seats" name="seats" min="1" max="<%= availableSeats %>" value="1" required>
                
                <input type="submit" value="Confirm Booking" class="btn">
            </form>
        <% } else { %>
            <p style="color:red; font-weight:bold;">No seats available.</p>
        <% } %>
    </div>
</div>

</body>
</html>

<%
    } catch(SQLException e){
        out.println("<h3>Database error: "+ e.getMessage() +"</h3>");
    } finally {
        if(rsBus != null) try { rsBus.close(); } catch(SQLException ignored){}
        if(rsPack != null) try { rsPack.close(); } catch(SQLException ignored){}
        if(psBus != null) try { psBus.close(); } catch(SQLException ignored){}
        if(psPack != null) try { psPack.close(); } catch(SQLException ignored){}
        if(con != null) try { con.close(); } catch(SQLException ignored){}
    }
%>