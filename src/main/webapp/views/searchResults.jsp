<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
</head>
<body>
    <div class="navbar">
        <a href="#home">EBOOKSTORE</a>
        <a href="/Available_books">Available Books</a>
        <a href="#mybooks">My Books</a>
        <a href="/Register_book" class="right">New book registers</a>
    </div>

    <div class="main-content">
        <h1>Search Results</h1>
        <p>Displaying search results for: <%= request.getParameter("query") %></p>
        
        <!-- Display search results here -->
        <%-- You can use Java code here to fetch and display search results from a database or other data source --%>
    </div>
</body>
</html>
