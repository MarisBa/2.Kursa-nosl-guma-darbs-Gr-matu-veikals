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
            border-radius: 30px;
        }
        .navbar .right {
            float: right;
        }
        .navbar a:hover {
            background-color: #555; /* Change to darker color */
        }
        .navbar a:hover::after {
            content: "";
            display: block;
            width: 100%;
            height: 2px;
            background-color: #fff; /* White color */
            position: absolute;
            bottom: 0;
            left: 0;
            transition: width 0.3s;
        }
        .navbar a:hover::before {
            content: "";
            display: block;
            width: 0%;
            height: 2px;
            background-color: #fff; /* White color */
            position: absolute;
            bottom: 0;
            right: 0;
            transition: width 0.3s;
        }
        .navbar a:hover::before,
        .navbar a:hover::after {
            transition: width 0.3s;
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
            transition: transform 1s ease; /* Adjust transition duration */
        }
        .book-card {
            flex: 0 0 auto;
            margin: 10px;
            width: 250px; /* Increase card width */
            height: 420px; /* Set a fixed height */
            text-align: center;
        }
        .book-card img {
            max-width: 100%;
            height: 300px; /* Set a fixed height */
        }
        .book-card h3 {
            margin-top: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #333; /* Dark grey */
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .book-card p {
            font-size: 12px;
            color: #777; /* Light grey */
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .slider-nav {
            margin-top: 20px;
        }
        .slider-nav button {
            background: none;
            border: none;
            color: #333;
            font-size: 24px;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s; /* Add transition */
        }
        .slider-nav button:hover {
            color: #fff; /* Change to white color */
            background-color: #555; /* Change to darker color */
        }
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

        .book-card a {
            text-decoration: none;
            color: inherit; /* Optionally, inherit the color from parent */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#home">EBOOKSTORE</a>
        <a href="/Available_books">Available Books</a>
        <a href="#mybooks">My Books</a>
        <a href="/Register_book" class="right">New book registers</a>
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
        <p>Most purchased books</p>
        <div class="popular-books-slider">
            <div class="popular-books">
                <div class="book-card">
                    <a href="/the-holy-grail-of-investing">
                        <img src="https://image.ebooks.com/cover/210912488.jpg?width=166&height=250&quality=85" alt="Book Cover">
                        <p>TONY ROBBINS</p>
                        <h3>The Holy Grail of Investing</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/the-last-devil-to-die">
                        <img src="https://image.ebooks.com/cover/210660466.jpg?width=166&height=250&quality=85" alt="Book Cover">
                        <p>RICHARD OSMAN</p>
                        <h3>The Last DEVIL to Die</h3>
                    </a>
                </div>
                <!-- Add more book cards as needed -->
                <div class="book-card">
                    <a href="/the-atlas-manuever">
                        <img src="https://image.ebooks.com/cover/210877223.jpg?width=166&height=250&quality=85" alt="Book Cover">
                        <p>STEVE BERRY</p>
                        <h3>The ATLAS MANUEVER</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/heidi">
                        <img src="https://assets-prd.ignimgs.com/2023/05/03/heidi-book-1683154826105.jpg?height=220" alt="Book Cover">
                        <p>JOHANNA SPYRI</p>
                        <h3>HEIDI</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/lolita">
                        <img src="https://assets-prd.ignimgs.com/2023/05/03/lolita-book-1683156429356.jpeg?height=220" alt="Book Cover">
                        <p>VLADIMIR NABOKOV</p>
                        <h3>Lolita</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/one-hundred years of solitude">
                        <img src="https://assets-prd.ignimgs.com/2023/05/03/hundred-solitude-harper-perennial-classics-1683156590489.jpeg?height=220" alt="Book Cover">
                        <p>GABRIEL GARCIA </p>
                        <h3>One hundred years of solitude</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/the-catcher-in-the-rye">
                        <img src="https://assets-prd.ignimgs.com/2023/05/03/the-catcher-in-the-rye-1683157092601.jpeg?height=220" alt="Book Cover">
                        <p>J.D. SALINGER</p>
                        <h3>The CATCHER in the RYE</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/harry-petter-and-the-deathly-hallows">
                        <img src="https://assets-prd.ignimgs.com/2023/05/03/hp-deathly-hallows-1683157182524.jpeg?height=220" alt="Book Cover">
                        <p>J. K. Rowling</p>
                        <h3>Harry Potter and the Deathly Hallows</h3>
                    </a>
                </div>
                <div class="book-card">
                    <a href="/harry-potter-and-the-charmber-of-sercrets">
                        <img src="https://assets-prd.ignimgs.com/2023/05/03/hp-the-half-blood-prince-1683157309141.jpeg?height=220" alt="Book Cover">
                        <p>J. K. Rowling</p>
                        <h3>Harry potter and the Charmber of Secrets</h3>
                    </a>
                </div>
                <!-- Add more book cards as needed -->
            </div>
            <div class="slider-nav">
                <button id="prevBtn" onclick="moveSlider(-1)">&#10094;</button>
                <button id="nextBtn" onclick="moveSlider(1)">&#10095;</button>
            </div>
        </div>
    </div>

    <script>
        function moveSlider(direction) {
            const slider = document.querySelector('.popular-books');
            const cardWidth = document.querySelector('.book-card').offsetWidth;
            slider.style.transition = 'transform 0.5s ease';
            if (direction === -1) {
                slider.style.transform = `translateX(${cardWidth}px)`;
                setTimeout(() => {
                    slider.appendChild(slider.firstElementChild);
                    slider.style.transition = 'none';
                    slider.style.transform = 'translateX(0)';
                }, 500);
            } else if (direction === 1) {
                slider.style.transform = `translateX(-${cardWidth}px)`;
                setTimeout(() => {
                    slider.prepend(slider.lastElementChild);
                    slider.style.transition = 'none';
                    slider.style.transform = 'translateX(0)';
                }, 500);
            }
        }
    </script>
    
    
    
    
    
</body>
</html>
