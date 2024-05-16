<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .profile-info {
            margin-top: 20px;
            text-align: center;
        }
        .profile-info p {
            margin-bottom: 10px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
    <div class="container">
        <h1>User Profile</h1>
        <div class="profile-info">
            <p>Welcome, <span id="username"><%= session.getAttribute("username") %></span>!</p>
            <p>Account created on: <span id="creationDate"><%= new java.util.Date() %></span></p>
        </div>
        <button class="btn" onclick="goBack()">Back</button>
    </div>
</body>
<script>
    function goBack() {
        window.history.back();
    }
</script>
</html>
