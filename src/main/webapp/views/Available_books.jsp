<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            color: white;
            padding: 10px 20px;
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
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
        }
        .categories {
            width: 20%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
        }
        .category-checkbox {
            margin-bottom: 10px;
            display: block;
        }
        .book-container {
            width: 75%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .book {
            width: calc(25% ); /* 4 columns with margin between */
            padding: 1px;
            margin-bottom: 20px;

            background-color: #f2f2f2;
            margin-right: 80px;
        }
        .book img {
            width: 100%;
            height: auto;
        }
        .book-details {
            overflow: hidden;
        }
        h2 {
            color: #333;
            margin-bottom: 5px;
        }
        .book-price {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .add-to-cart {
    display: block;
    background-color: white; /* Set background color to white */
    border: 2px solid #1e4ba6; /* Set border to dark blue */
    color: #1e4ba6; /* Set text color to dark blue */
    text-align: center;
    padding: 8px 16px;
    text-decoration: none;
    font-size: 16px;
    margin-top: 10px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s; /* Add transition for background color and text color */
}

.add-to-cart:hover {
    background-color: #1e4ba6; /* Change background color to dark blue on hover */
    color: white; /* Change text color to white on hover */
}

    </style>
</head>
<body>
    <div class="navbar">
        <a href="javascript:history.back()">Back</a>
        <a href="/storeEbook">Home</a>
    </div>
    <div class="container">
        <!-- Categories box -->
        <div class="categories">
            <h3>Categories</h3>
            <!-- Category checkboxes -->
            <label class="category-checkbox">
                <input type="checkbox" name="category" value="fiction"> Fiction
            </label>
            <label class="category-checkbox">
                <input type="checkbox" name="category" value="mystery"> Mystery
            </label>
            <label class="category-checkbox">
                <input type="checkbox" name="category" value="sci-fi"> Science Fiction
            </label>
            <label class="category-checkbox">
                <input type="checkbox" name="category" value="fantasy"> Fantasy
            </label>
            <label class="category-checkbox">
                <input type="checkbox" name="category" value="romance"> Romance
            </label>
            <label class="category-checkbox">
                <input type="checkbox" name="category" value="horror"> Horror
            </label>
            <!-- Add more categories as needed -->
        </div>
        <!-- Book container -->
        <div class="book-container">
            <!-- Book 1 -->
            <div class="book">
                <img src="https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348322381i/3450744.jpg" alt="Book Title">
                <div class="book-details">
                    <h2>Book Title</h2>
                    <p class="book-price">$19.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- Book 2 -->
            <div class="book">
                <img src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320428955l/2776527._SX98_.jpg" alt="Book Title">
                <div class="book-details">
                    <h2>Book Title</h2>
                    <p class="book-price">$14.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- Book 3 -->
            <div class="book">
                <img src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1255573980l/1713426._SX98_.jpg" alt="Book Title">
                <div class="book-details">
                    <h2>Book Title</h2>
                    <p class="book-price">$24.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- Book 4 -->
            <div class="book">
                <img src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1317793965l/11468377._SX98_.jpg" alt="Book Title">
                <div class="book-details">
                    <h2>Book Title</h2>
                    <p class="book-price">$29.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- Book 5 -->
            <div class="book">
                <img src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1369453733l/6953508._SX98_.jpg" alt="Book Title">
                <div class="book-details">
                    <h2>Book Title</h2>
                    <p class="book-price">$22.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- Book 6 -->
            <div class="book">
                <img src="https://eglobuss.lv/storage/attachments/e6e/6nf/6bx/e6e6nf6bxemjfx3fqq9ltwkpl-350x500-resize-quality(85).webp" alt="Book Title">
                <div class="book-details">
                    <h2>Book Title</h2>
                    <p class="book-price">$17.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- Add more books as needed -->
        </div>
    </div>
</body>
</html>
