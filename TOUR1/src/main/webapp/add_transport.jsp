<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Transport</title>

<style>

body.home-bg {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    
    background: url('https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1ZoiJx.img?w=768&h=512&m=6') no-repeat center center fixed;
    background-size: cover;
    color: #333;
}


body.home-bg::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255,255,255,0.1); /* optional light overlay for readability */
    z-index: 0;
}

/* ===== NAVBAR ===== */
.navbar {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 40px;
    background: rgba(255,255,255,0.9);
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    font-weight: 600;
}

.navbar a {
    text-decoration: none;
    color: #007bff;
    margin-left: 20px;
    transition: 0.3s;
}

.navbar a:hover {
    color: #0056b3;
}

/* ===== FORM CONTAINER ===== */
.form-container {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    height: calc(100vh - 70px); /* minus navbar */
    padding: 20px;
}

/* ===== FORM CARD ===== */
.form-card {
    background: rgba(255,255,255,0.95); /* semi-transparent white */
    padding: 40px 30px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    width: 450px;
    max-width: 95%;
    display: flex;
    flex-direction: column;
    align-items: center;
}

/* ===== HEADING ===== */
.form-card h2 {
    margin-bottom: 25px;
    color: #007bff;
    font-size: 1.8rem;
    text-align: center;
}

/* ===== INPUT FIELDS ===== */
.form-card input[type="text"],
.form-card input[type="number"] {
    width: 100%;
    padding: 12px 15px;
    margin: 10px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
    background: #fdfdfd;
    color: #333;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.form-card input[type="text"]:focus,
.form-card input[type="number"]:focus {
    border: 1px solid #007bff;
    box-shadow: 0 0 8px rgba(0,123,255,0.3);
    outline: none;
}

/* ===== BUTTON ===== */
.btn {
    width: 100%;
    padding: 14px;
    margin-top: 15px;
    border: none;
    border-radius: 8px;
    background: #007bff;
    color: #fff;
    font-weight: bold;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn:hover {
    background: #0056b3;
    transform: scale(1.02);
}
</style>

</head>

<body class="home-bg">

<!-- Navbar -->
<div class="navbar">
    <div>Transport Panel</div>
    <div>
        <a href="agency_home.jsp">Home</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<!-- Form Section -->
<div class="form-container">

    <div class="form-card">

        <h2>Add Transport</h2>

        <form action="addTransport" method="post">

            <input type="text" name="bus_name" placeholder="Bus Name" required>

            <input type="text" name="type" placeholder="Type (AC / Non-AC)" required>

            <input type="number" name="seats" placeholder="Seats" required>

            <input type="text" name="price" placeholder="Price" required>

            <input type="text" name="package_id" placeholder="Package ID" required>

            <input type="submit" value="Add Transport" class="btn">

        </form>

    </div>

</div>

</body>
</html>