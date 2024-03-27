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
        .navbar {
            overflow: hidden;
            background-color: #333;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .book {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px; /* Increased margin for better separation */
            overflow: hidden;
            background-color: #f9f9f9; /* Added background color to resemble book cards */
            transition: box-shadow 0.3s; /* Added smooth transition for hover effect */
            border-radius: 10px; /* Rounded corners */
        }
        .book:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Added shadow on hover for better visual feedback */
        }
        .book img {
            float: left;
            margin-right: 10px;
            width: 150px;
            height: auto;
            border-radius: 5px; /* Added border radius for image */
        }
        .book-details {
            overflow: hidden;
        }
        h2 {
            color: #333;
        }
        .more-info {
            display: inline-block;
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        .more-info:hover {
            background-color: #45a049; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="javascript:history.back()">Back</a>
        <a href="/storeEbook">Home</a>
    </div>
    <div class="container">
        <h1>Available Books</h1>
        <div class="book">
            <img src="https://m.economictimes.com/photo/53575599.cms" alt="Red Book">
            <div class="book-details">
                <h2>Book Title</h2>
                <p>Author: Book Author</p>
                <p>Genre: Fiction</p>
                <button class="more-info">More Info</button>
            </div>
        </div>

        <div class="book">
            <img src="https://eglobuss.lv/storage/attachments/e8d/v2k/vlz/e8dv2kvlzaif1q40rfduil3wn.jpg" alt="To Kill a Mockingbird">
            <div class="book-details">
                <h2>To Kill a Mockingbird</h2>
                <p>Author: Harper Lee</p>
                <p>Genre: Fiction</p>
                <button class="more-info">More Info</button>
            </div>
        </div>

        <div class="book">
            <img src="https://bestlifeonline.com/wp-content/uploads/sites/3/2020/10/The-Da-Vinci-Code-book-cover.jpg" alt="Book Title">
            <div class="book-details">
                <h2>1984</h2>
                <p>Author: George Orwell</p>
                <p>Genre: Dystopian</p>
                <button class="more-info">More Info</button>
            </div>
        </div>
    </div>
</body>
</html>
