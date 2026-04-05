<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Package</title>

<!-- Link CSS -->
<link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <div> Tour & Travel</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="packages.jsp">Packages</a>
        <a href="login.jsp">Login</a>
    </div>
</div>

<!-- Form Container -->
<div class="container">

    <div class="card">
        <form action="book" method="post">

            <!-- Hidden Package ID -->
            <input type="hidden" name="package_id" value="<%= request.getParameter("id") %>">

            <h2>Book Package</h2>

            <p>Select Date:</p>
            <input type="date" name="date"><br><br>

            <input type="submit" value="Confirm Booking" class="btn">

        </form>
    </div>

</div>

</body>
</html>