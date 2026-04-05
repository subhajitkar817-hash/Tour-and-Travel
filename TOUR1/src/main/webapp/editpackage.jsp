<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
    // 1. Get the id parameter safely
    String idParam = request.getParameter("id");
    int id = 0;

    if (idParam != null) {
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            out.println("<h3>Invalid package ID!</h3>");
            return; // stop processing
        }
    } else {
        out.println("<h3>Package ID is missing!</h3>");
        return; // stop processing
    }

    // 2. Fetch package details
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();
        ps = con.prepareStatement("SELECT * FROM packages WHERE id=?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (!rs.next()) {
            out.println("<h3>Package not found!</h3>");
            return;
        }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Package</title>

<!-- Link CSS -->
<link rel="stylesheet" href="style.css">

</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div> Tour & Travel</div>
    <div>
        <a href="admin_home.jsp">Dashboard</a>
        <a href="view_packages.jsp">Packages</a>
        <a href="logout.jsp">Logout</a>
        <a href="admin_home.jsp" class="btn">Back</a>
    </div>
</div>

<!-- Form Container -->
<div class="container">
    <div class="card">
        <form action="updatePackage" method="post">

            <input type="hidden" name="id" value="<%= id %>">

            <h2>Edit Package</h2>

            <p>Title:</p>
            <input type="text" name="title" value="<%= rs.getString("title") %>" required><br><br>

            <p>Location:</p>
            <input type="text" name="location" value="<%= rs.getString("location") %>" required><br><br>

            <p>Price:</p>
            <input type="text" name="price" value="<%= rs.getString("price") %>" required><br><br>

            <input type="submit" value="Update Package" class="btn">

        </form>
    </div>
</div>

</body>
</html>

<%
    } catch (SQLException e) {
        out.println("<h3>Database error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
        if (con != null) try { con.close(); } catch (SQLException ignored) {}
    }
%>