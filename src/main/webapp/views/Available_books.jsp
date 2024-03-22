<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .book {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }
        h2 {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Available Books</h1>
        <div class="book">
            <h2>The Great Gatsby</h2>
            <p>Author: F. Scott Fitzgerald</p>
            <p>Genre: Fiction</p>
        </div>
        <div class="book">
            <h2>To Kill a Mockingbird</h2>
            <p>Author: Harper Lee</p>
            <p>Genre: Fiction</p>
        </div>
        <div class="book">
            <h2>1984</h2>
            <p>Author: George Orwell</p>
            <p>Genre: Dystopian</p>
        </div>
        <!-- Add more books as needed -->
    </div>
</body>
</html>
