<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="/admin/save-book" method="post">
        <input type="text" name="title"> 
        <input type="text" name="bookImageUrl">
        <input type="text" name="price">
        <input type="text" name="author">
        <input type="text" name="about">
        <input type="text" name="pageLength">
        <input type="text" name="language">
        <input type="text" name="manufacturer">


        
        <button type="submit">save book</button>
    </form>
</body>
</html>