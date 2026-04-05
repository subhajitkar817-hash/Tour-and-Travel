<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transport Agency Home</title>
<style>
/* ===== BODY ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    /* Background wallpaper */
    background: url('https://wallpaperaccess.com/full/1180284.jpg') no-repeat center center;
    background-size: cover;
}

/* Optional: add overlay for readability */
body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255,255,255,0.2); /* lighter white overlay */
    z-index: 0;
}

/* ===== CONTENT CARD ===== */
.content-card {
    position: relative;
    z-index: 1;
    background: rgba(255, 255, 255, 0.95); /* semi-transparent */
    padding: 50px 40px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    text-align: center;
    min-width: 300px;
}

/* ===== HEADING ===== */
.content-card h2 {
    font-size: 2rem;
    color: #007bff;
    margin-bottom: 30px;
}

/* ===== BUTTONS ===== */
.content-card a {
    display: inline-block;
    margin: 10px;
    padding: 12px 25px;
    background: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.content-card a:hover {
    background: #0056b3;
    transform: scale(1.05);
}

/* ===== RESPONSIVE ===== */
@media screen and (max-width: 480px) {
    .content-card {
        padding: 30px 20px;
    }

    .content-card h2 {
        font-size: 1.6rem;
    }

    .content-card a {
        padding: 10px 20px;
        font-size: 0.9rem;
    }
}
</style>
</head>
<body>

<div class="content-card">
    <h2>Welcome Transport Agency</h2>
    <a href="add_transport.jsp">Add Transport</a>
    <a href="agency_login.jsp">Logout</a>
</div>

</body>
</html>