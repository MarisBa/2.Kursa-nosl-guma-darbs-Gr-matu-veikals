<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            padding: 10px 20px;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            border-radius: 20px;
            transition: background-color 0.3s, border-radius 0.3s;
        }
        .navbar a:hover {
            background-color: #ddd;
            border-radius: 30px; /* Adjust roundness on hover */
        }
        .navbar .right {
            float: right;
        }
        @media screen and (max-width: 600px) {
            .navbar a, .navbar .right {
                float: none;
                display: block;
                text-align: center;
            }
        }
        .main-content {
            padding: 20px;
            text-align: center;
        }
        .search-bar {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 60%;
            max-width: 400px;
            box-sizing: border-box;
        }
        .popular-books {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .book-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            width: 200px;
            text-align: center;
        }
        .book-card img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .book-card h3 {
            margin-top: 10px;
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

    <div class="main-content">
        <h1>Welcome to the Book Store</h1>
        <p>Explore our collection of books and find your next great read!</p>
        <input type="text" placeholder="Search for books..." class="search-bar">

        <h2>Most Popular Books</h2>
        <div class="popular-books">
            <div class="book-card">
                <img src="https://image.ebooks.com/cover/210912488.jpg?width=166&height=250&quality=85" alt="Book Cover">
                <h3>Book Title 1</h3>
                <p>Author: Author Name</p>
            </div>
            <div class="book-card">
                <img src="https://image.ebooks.com/cover/210660466.jpg?width=166&height=250&quality=85" alt="Book Cover">
                <h3>Book Title 2</h3>
                <p>Author: Author Name</p>
            </div>
            <div class="book-card">
                <img src="https://image.ebooks.com/cover/210877223.jpg?width=166&height=250&quality=85" alt="Book Cover">
                <h3>Book Title 3</h3>
                <p>Author: Author Name</p>
            </div>
        </div>
    </div>
</body>
</html>
