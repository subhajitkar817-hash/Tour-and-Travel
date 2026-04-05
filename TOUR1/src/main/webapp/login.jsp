<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
        <a href="register.jsp">Register</a>
    </div>
</div>

<!-- Form Container -->
<div class="container">

    <div class="card">
        <form action="login" method="post">

            <h2>Login</h2>

            <p>Email:</p>
            <input type="email" name="email" placeholder="Enter Email"><br><br>

            <p>Password:</p>
            <input type="password" name="password" placeholder="Enter Password"><br><br>

            <input type="submit" value="Login" class="btn">
			<a href="loginchoice.jsp" class="btn"> Back</a>
        </form>
    </div>

</div>

</body>
</html>