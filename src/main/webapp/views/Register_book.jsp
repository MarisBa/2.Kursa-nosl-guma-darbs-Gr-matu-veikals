<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Book</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://example.com/background-image.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 50%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), 0 2px 5px rgba(0, 0, 0, 0.2); /* Two layers of box shadow with different colors */
        }
        h2 {
            color: #333;
            text-align: center;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], select {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            margin-top: 5px;
        }
        .success-message {
            color: green;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register Book</h2>
        <% if(request.getAttribute("registrationSuccess") != null && (Boolean)request.getAttribute("registrationSuccess")) { %>
            <p class="success-message">Registration successful!</p>
        <% } %>
        <form action="/registerBook" method="post" onsubmit="return validateForm()">
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" required><br>
            
            <label for="author">Author:</label><br>
            <input type="text" id="author" name="author" required><br>
            
            <label for="genre">Genre:</label><br>
            <select id="genre" name="genre">
                <option value="Fiction">Fiction</option>
                <option value="Non-Fiction">Non-Fiction</option>
                <option value="Science Fiction">Science Fiction</option>
                <option value="Mystery">Mystery</option>
                <option value="Thriller">Thriller</option>
                <option value="Romance">Romance</option>
                <option value="Horror">Horror</option>
                <!-- Add more genre options as needed -->
            </select><br>
            
            <label for="publishedYear">Published Year:</label><br>
            <input type="text" id="publishedYear" name="publishedYear" required><br>
            
            <input type="submit" value="Register Book">
        </form>
        <div id="errorDiv"></div>
    </div>

    <script>
        function validateForm() {
            var title = document.getElementById("title").value;
            var author = document.getElementById("author").value;
            var publishedYear = document.getElementById("publishedYear").value;
            var errorDiv = document.getElementById("errorDiv");
            errorDiv.innerHTML = "";

            if (title.trim() == "" || author.trim() == "" || publishedYear.trim() == "") {
                errorDiv.innerHTML = "<p class='error-message'>Please fill out all fields.</p>";
                return false;
            }

            if (isNaN(publishedYear) || parseInt(publishedYear) < 0) {
                errorDiv.innerHTML = "<p class='error-message'>Published year must be a valid positive number.</p>";
                return false;
            }

            // Additional validation can be added here

            return true;
        }
    </script>
</body>
</html>
