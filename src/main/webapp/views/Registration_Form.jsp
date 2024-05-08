<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            display: grid;
            height: 100vh;
            width: 100%;
            place-items: center;
            background: #f0f0f0;
        }

        .container {
            background: #fff;
            max-width: 350px;
            width: 100%;
            padding: 25px 30px;
            border-radius: 5px;
            box-shadow: 0 10px 10px rgba(0, 0, 0, 0.15);
        }

        .container form .title {
            font-size: 30px;
            font-weight: 600;
            margin: 20px 0 10px 0;
            position: relative;
        }

        .container form .title:before {
            content: '';
            position: absolute;
            height: 4px;
            width: 33px;
            left: 0px;
            bottom: 3px;
            border-radius: 5px;
            background: linear-gradient(to right, blue 0%, blue 100%);
        }

        .container form .input-box {
            width: 100%;
            height: 45px;
            margin-top: 25px;
            position: relative;
        }

        .container form .input-box input {
            width: 100%;
            height: 100%;
            outline: none;
            font-size: 16px;
            border: none;
            background-color: #f7f7f7;
            padding: 10px;
            border-radius: 5px;
        }

        .container form .input-box button[type="submit"] {
            background: linear-gradient(to right, blue 0%, blue 100%);
            font-size: 17px;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            height: 100%;
            border: none;
            outline: none;
        }

        .container form .input-box button[type="submit"]:hover {
            letter-spacing: 1px;
            background: linear-gradient(to left,  blue 0%, blue 100%);
        }

    </style>
</head>
<body>
<div class="container">
    <form action="Registration" method="post">
        <div class="title">Registration</div>
        <div class="input-box">
            <input type="text" name="uname" placeholder="Enter Your Name" pattern="^[a-zA-ZÀ-ÿ'-]{2,30}$" title="Name must contain only letters and be at least 2 characters long" required>
        </div>
        <div class="input-box">
            <input type="text" name="email" placeholder="Enter Your Email" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Enter a valid email address" required>
        </div>
        <div class="input-box">
            <input type="password" name="password" placeholder="Create Password" pattern=".{8,}" title="Password must be at least 8 characters long" required>
        </div>
        <div class="input-box">
            <input type="password" name="copassword" placeholder="Confirm Password" pattern=".{8,}" title="Password must match the one above" required>
        </div>
    
        <div class="input-box">
            <button type="submit" name="">Register Now</button>
        </div>
    
        <div class="login-link">Already have an account? <a href="AlreadyLogin">Log in</a></div>
    </form>
    
</div>
</body>
</html>
