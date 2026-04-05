<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<!-- Link CSS -->
<link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <div>Admin Panel</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">User Login</a>
    </div>
</div>

<!-- Container -->
<div class="container">

    <div class="card">
        <form action="adminLogin" method="post">

            <h2>Admin Login</h2>

            <p>Username:</p>
            <input type="text" name="username" placeholder="Enter Username"><br><br>

            <p>Password:</p>
            <input type="password" name="password" placeholder="Enter Password"><br><br>

            <input type="submit" value="Admin Login" class="btn">
            <a href="loginchoice.jsp" class="btn"> Back</a>

        </form>
    </div>

</div>

</body>
</html>