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
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Book</h1>
        <form action="/admin/save-book" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            <label for="bookImageUrl">Book Image URL:</label>
            <input type="text" id="bookImageUrl" name="bookImageUrl" required>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required>
            <label for="about">About:</label>
            <textarea id="about" name="about" required></textarea>
            <label for="pageLength">Page Length:</label>
            <input type="number" id="pageLength" name="pageLength" required min="1">
            <label for="language">Language:</label>
            <input type="text" id="language" name="language" required>
            <label for="manufacturer">Manufacturer:</label>
            <input type="text" id="manufacturer" name="manufacturer" required>

            <button type="submit">Save Book</button>
        </form>
    </div>
</body>
</html>
