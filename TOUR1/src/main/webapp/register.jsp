<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

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
        <form action="register" method="post">

            <h2>Register</h2>

            <p>Name:</p>
            <input type="text" name="name" placeholder="Enter Name"><br><br>

            <p>Email:</p>
            <input type="email" name="email" placeholder="Enter Email"><br><br>

            <p>Password:</p>
            <input type="password" name="password" placeholder="Enter Password"><br><br>

            <input type="submit" value="Register" class="btn">

        </form>
    </div>

</div>

</body>
</html>