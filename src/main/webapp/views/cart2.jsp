<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .cart-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .cart-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .cart-item img {
            max-width: 100px;
            margin-right: 10px;
        }
        .cart-item-details {
            flex: 1;
        }
        .cart-item-details h3 {
            margin: 0;
            font-size: 18px;
        }
        .cart-item-details p {
            margin: 0;
            font-size: 14px;
            color: #777;
        }
        .cart-total {
            margin-top: 20px;
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h2>Your Cart</h2>
        <%-- Example cart items (replace with actual cart items) --%>
        <div class="cart-item">
            <img src="https://via.placeholder.com/150" alt="Book Cover">
            <div class="cart-item-details">
                <h3>Book Title</h3>
                <p>Author: Author Name</p>
                <p>Price: $10.99</p>
                <p>Quantity: 1</p>
            </div>
        </div>
        <div class="cart-item">
            <img src="https://via.placeholder.com/150" alt="Book Cover">
            <div class="cart-item-details">
                <h3>Another Book Title</h3>
                <p>Author: Another Author Name</p>
                <p>Price: $8.99</p>
                <p>Quantity: 2</p>
            </div>
        </div>
        <div class="cart-total">
            <p>Total: $29.97</p>
        </div>
    </div>
</body>
</html>
