<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .sort-buttons {
            text-align: center;
            margin-bottom: 20px;
        }
        .sort-buttons button {
            margin: 0 10px;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        .sort-buttons button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .book-cards-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .book-card {
            width: 250px;
            margin: 10px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .book-card img {
            width: 100%;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .book-info h3 {
            font-size: 16px;
            margin-bottom: 5px;
        }
        .book-info p {
            font-size: 14px;
            margin-bottom: 5px;
            color: #777;
        }
        .book-card a {
            text-decoration: none; /* Remove underline */
            color: inherit; /* Inherit text color */
        }
        .book-card:hover {
    transform: translateY(-5px);
}
    </style>
</head>
<body>
    <div class="container">
        <h1>All Books</h1>
        <div class="sort-buttons">
            <button onclick="sortBooks('title')">Sort by Title</button>
            <button onclick="sortBooks('author')">Sort by Author</button>
        </div>
        <!-- Book Cards Section -->
        <div class="book-cards-container">
            <div class="book-card">
                <a href="/admin/book/2">
                    <img src="https://eglobuss.lv/storage/attachments/2y0/7ce/4bc/2y07ce4bcln23sbf34hfqpc73-350x500-resize-quality(85).webp" alt="Book Cover">
                    <p>TONY ROBBINS</p>
                    <h3>Life Force : How New Breakthroughs in Precision Medicine Can Transform the Quality of Your Life</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/5">
                    <img src="https://eglobuss.lv/storage/attachments/8qf/zag/jtc/8qfzagjtc4fdv65hiefqti9ak.jpg" alt="Book Cover">
                    <p>Gideon Defoe</p>
                    <h3>An Atlas of Extinct Countries</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/3">
                    <img src="https://image.ebooks.com/cover/210877223.jpg?width=166&height=250&quality=85" alt="Book Cover">
                    <p>STEVE BERRY</p>
                    <h3>The ATLAS MANUEVER</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/1">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/heidi-book-1683154826105.jpg?height=220" alt="Book Cover">
                    <p>JOHANNA SPYRI</p>
                    <h3>HEIDI</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/6">
                    <img src="https://eglobuss.lv/storage/attachments/bni/gpg/9o1/bnigpg9o12ap2guamq8g692so.jpg" alt="Book Cover">
                    <p>Morgan Housel</p>
                    <h3>Same as Ever : Timeless Lessons on Risk, Opportunity and Living a Good Life</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/7">
                    <img src="https://eglobuss.lv/storage/attachments/1pt/edi/jrk/1ptedijrk04t0sux3px5fxf5g.jpg" alt="Book Cover">
                    <p>Agatha Christie</p>
                    <h3>Partners in Crime : A Tommy & Tuppence Collection</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/4">
                    <img src="https://eglobuss.lv/storage/attachments/2xw/uhk/joh/2xwuhkjoh1zvzzhv8nlwapr7m.jpg" alt="Book Cover">
                    <p>Albert Moukheiber</p>
                    <h3>Your Brain Is Playing Tricks On You: How the Brain Shapes Opinions and Perceptions</h3>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/8">
                    <img src="https://images.routledge.com/common/jackets/crclarge/978041592/9780415922227.jpg" alt="Book Cover">
                    <p>Jordan B. Peterson</p>
                    <h3>Maps of Meaning: The Architecture of Belief</h3>
                </a>
            </div>
        </div>
    </div>
    <script>
    function sortBooks(order) {
        // Get all book cards
        var bookCards = Array.from(document.getElementsByClassName('book-card'));

        // Sort book cards
        bookCards.sort(function(a, b) {
            if (order === 'title') {
                // Get book titles
                var titleA = a.querySelector('h3').textContent;
                var titleB = b.querySelector('h3').textContent;

                // Compare book titles
                return titleA.localeCompare(titleB);
            } else if (order === 'author') {
                // Get book authors
                var authorA = a.querySelector('p').textContent;
                var authorB = b.querySelector('p').textContent;

                // Compare book authors
                return authorA.localeCompare(authorB);
            }
        });

        // Get book cards container
        var container = document.querySelector('.book-cards-container');

        // Remove all book cards from container
        while (container.firstChild) {
            container.firstChild.remove();
        }

        // Add sorted book cards to container
        for (var i = 0; i < bookCards.length; i++) {
            container.appendChild(bookCards[i]);
        }
    }
</script>
    </script>
    </script>
    
</body>
</html>
