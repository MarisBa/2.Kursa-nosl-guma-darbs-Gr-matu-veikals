<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="text"]::placeholder,
        input[type="number"]::placeholder,
        textarea::placeholder {
            color: #aaa;
        }
        button[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: auto;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        #message {
            text-align: center;
            margin-top: 20px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Book</h1>
        <form action="/admin/save-book" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" placeholder="Enter title" required>
            <label for="bookImageUrl">Book Image URL:</label>
            <input type="text" id="bookImageUrl" name="bookImageUrl" placeholder="Enter image URL" required>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" placeholder="Enter price" required>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" placeholder="Enter author" required>
            <label for="about">About:</label>
            <textarea id="about" name="about" placeholder="Enter about" required></textarea>
            <label for="pageLength">Page Length:</label>
            <input type="number" id="pageLength" name="pageLength" placeholder="Enter page length" required min="1">
            <label for="language">Language:</label>
            <input type="text" id="language" name="language" placeholder="Enter language" required>
            <label for="manufacturer">Manufacturer:</label>
            <input type="text" id="manufacturer" name="manufacturer" placeholder="Enter manufacturer" required>

            <button type="submit">Save Book</button>
        </form>
        <div id="message">New book added successfully!</div>
    </div>

    <script>
        // Show message when new book is added
        const message = document.getElementById('message');
        const form = document.querySelector('form');
        form.addEventListener('submit', function() {
            message.style.display = 'block';
        });
    </script>
</body>
</html>
