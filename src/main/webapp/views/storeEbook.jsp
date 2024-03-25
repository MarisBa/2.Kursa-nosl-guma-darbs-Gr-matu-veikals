<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar .right {
            float: right;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#home">EBOOKSTORE</a>
        <a href="/Available_books">Available Books</a>
        <a href="#mybooks">My Books</a>
        <a href="/Register_book" class="right">New book register</a>

    </div>

    <div style="padding:20px">
        <!-- Your main content goes here -->
        <h1>Welcome to the Book Store</h1>
        <p>Explore our collection of books and find your next great read!</p>
    </div>
</body>
</html>
