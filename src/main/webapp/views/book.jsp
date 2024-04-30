<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Details</title>
    <!-- Add your CSS and JS files if needed -->
</head>
<body>
    <div class="container">
        <div class="image">
            <img src="${book.bookImageUrl}" alt="Book Cover">
        </div>
        <div class="details">
            <h2>${book.title}</h2>
            <h3>$${book.price}</h3>
            <p>${book.about}</p>
            <!-- Other book details -->
        </div>
    </div>
</body>
</html>
