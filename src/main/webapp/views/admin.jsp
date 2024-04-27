<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save Book</title>
</head>
<body>
    <h1>Save Book</h1>
    <form action="/admin/save-book" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title"><br>
        
        <label for="bookImageUrl">Book Image URL:</label>
        <input type="text" id="bookImageUrl" name="bookImageUrl"><br>
        
        <label for="price">Price:</label>
        <input type="text" id="price" name="price"><br>
        
        <label for="author">Author:</label>
        <input type="text" id="author" name="author"><br>
        
        <label for="about">About:</label>
        <input type="text" id="about" name="about"><br>
        
        <label for="pageLength">Page Length:</label>
        <input type="text" id="pageLength" name="pageLength"><br>
        
        <label for="language">Language:</label>
        <input type="text" id="language" name="language"><br>
        
        <label for="manufacturer">Manufacturer:</label>
        <input type="text" id="manufacturer" name="manufacturer"><br>
        
        <button type="submit">Save Book</button>
    </form>
</body>
</html>
