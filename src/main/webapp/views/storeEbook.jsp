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
            border-radius: 30px; /* Adjust roundness on hove dfgdfgdfgdf r */
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
        .popular-books-slider {
            overflow: hidden;
            width: 100%;
            position: relative;
        }
        .popular-books {
            display: flex;
            transition: transform 0.5s ease; /* Added transition for smooth sliding */
        }
        .book-card {
            flex: 0 0 auto;
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
        /* Navigation buttons */
        .slider-nav {
            margin-top: 20px;
        }
        .slider-nav button {
            background: none;
            border: none;
            color: #333;
            font-size: 24px;
            cursor: pointer;
        }
        /* Search bar styles */
        .search-bar {
            margin: 20px auto;
            text-align: center;
        }
        .search-bar input[type="text"] {
            padding: 10px;
            width: 60%;
            max-width: 400px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .search-bar button {
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .search-bar button:hover {
            background-color: #555;
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

        <!-- Search bar -->
        <div class="search-bar">
            <form action="/search" method="get">
                <input type="text" name="query" placeholder="Search for books...">
                <button type="submit">Search</button>
            </form>
        </div>

        <h2>Most Popular Books</h2>
        <div class="popular-books-slider">
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
                <!-- Add more book cards as needed -->
                <div class="book-card">
                    <img src="https://image.ebooks.com/cover/210877223.jpg?width=166&height=250&quality=85" alt="Book Cover">
                    <h3>Book Title 3</h3>
                    <p>Author: Author Name</p>
                </div>
                <div class="book-card">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/heidi-book-1683154826105.jpg?height=220" alt="Book Cover">
                    <h3>Heidi</h3>
                    <p>Author: Johanna Spyri</p>
                </div>
                <div class="book-card">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/lolita-book-1683156429356.jpeg?height=220" alt="Book Cover">
                    <h3>Lolita</h3>
                    <p>Author: Vladimir Nabokov</p>
                </div>
                <div class="book-card">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/hundred-solitude-harper-perennial-classics-1683156590489.jpeg?height=220" alt="Book Cover">
                    <h3>One Hundred Years of Solitude</h3>
                    <p>Author: Gabriel García Márquez</p>
                </div>
                <div class="book-card">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/the-catcher-in-the-rye-1683157092601.jpeg?height=220" alt="Book Cover">
                    <h3>The Catcher in the Rye</h3>
                    <p>Author: J.D. Salinger</p>
                </div>
                <div class="book-card">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/hp-deathly-hallows-1683157182524.jpeg?height=220" alt="Book Cover">
                    <h3>Harry Potter and the Deathly Hallows</h3>
                    <p>Author: J.K. Rowling</p>
                </div>
                <div class="book-card">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/hp-the-half-blood-prince-1683157309141.jpeg?height=220" alt="Book Cover">
                    <h3>Harry Potter and the Half-Blood Prince</h3>
                    <p>Author: J.K. Rowling</p>
                </div>
                <!-- Add more book cards as needed -->
            </div>
            <div class="slider-nav">
                <button id="prevBtn" onclick="moveSlider(-1)">&#10094;</button>
                <button id="nextBtn" onclick="moveSlider(1)">&#10095;</button><!-- Write your comments here -->
            </div>
        </div>
    </div>

    <script>
        let slideIndex = 0;
        const slideWidth = 220; // Width of each book card
        const slidesToShow = 3; // Number of slides to show at a time

        function moveSlider(n) {
            slideIndex += n;
            showBooks();
        }

        function showBooks() {
            const books = document.querySelector('.popular-books');
            const maxTranslate = -(books.offsetWidth - (slidesToShow * slideWidth));
            slideIndex = Math.min(slidesToShow - 1, Math.max(0, slideIndex)); // Clamp slideIndex
            const translateValue = -slideIndex * slideWidth;
            books.style.transform = `translateX(${translateValue}px)`;
        }
    </script>
</body>
</html>
