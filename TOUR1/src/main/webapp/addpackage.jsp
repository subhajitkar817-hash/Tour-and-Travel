<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Package</title>

<!-- Link CSS -->
<link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <div> Admin Panel</div>
    <div>
        <a href="adminhome.jsp">Dashboard</a>
        <a href="viewpackage.jsp">Packages</a>
        <a href="logout.jsp">Logout</a>
                <a href="adminhome.jsp" class="btn"> Back</a>
    </div>
</div>

<!-- Container -->
<div class="container">

    <div class="card">
        <form action="addPackage" method="post">

            <h2>Add New Package</h2>

            <p>Title:</p>
            <input type="text" name="title" placeholder="Enter Title"><br><br>

            <p>Location:</p>
            <input type="text" name="location" placeholder="Enter Location"><br><br>

            <p>Price:</p>
            <input type="text" name="price" placeholder="Enter Price"><br><br>

            <p>Description:</p>
            <input type="text" name="description" placeholder="Enter Description"><br><br>

            <input type="submit" value="Add Package" class="btn">

        </form>
    </div>

</div>

</body>
</html>