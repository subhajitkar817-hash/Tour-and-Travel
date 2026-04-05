<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agency Register</title>
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

/* Optional: overlay for readability */
body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255,255,255,0.2); /* light white overlay */
    z-index: 0;
}

/* ===== CENTERED CARD ===== */
.center-box {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}

.card {
    background: rgba(255, 255, 255, 0.95); /* semi-transparent card */
    backdrop-filter: blur(5px); /* subtle blur behind card */
    padding: 50px 40px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    width: 350px;
    max-width: 90%;
    text-align: center;
}

/* ===== HEADING ===== */
.card h2 {
    font-size: 2rem;
    color: #007bff;
    margin-bottom: 30px;
}

/* ===== INPUT FIELDS ===== */
.card input[type="text"],
.card input[type="email"],
.card input[type="password"] {
    width: 100%;
    padding: 15px 15px;
    margin: 12px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
    background: #fdfdfd;
    color: #333;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.card input[type="text"]:focus,
.card input[type="email"]:focus,
.card input[type="password"]:focus {
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

/* ===== RESPONSIVE ===== */
@media screen and (max-width: 480px) {
    .card {
        padding: 35px 25px;
    }

    .card h2 {
        font-size: 1.6rem;
    }

    .card input[type="text"],
    .card input[type="email"],
    .card input[type="password"] {
        padding: 12px 10px;
    }

    .btn {
        padding: 12px;
        font-size: 0.95rem;
    }
}
</style>
</head>
<body>

<div class="center-box">
    <div class="card">
        <h2>Agency Register</h2>
        <form action="agencyRegister" method="post">
            <input type="text" name="name" placeholder="Agency Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Register" class="btn">
        </form>
    </div>
</div>

</body>
</html>