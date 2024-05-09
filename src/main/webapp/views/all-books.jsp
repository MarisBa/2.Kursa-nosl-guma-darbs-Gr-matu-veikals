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
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
            margin-right: 10px;
        }
        button:hover {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>All Books</h1>
        <div>
            <button onclick="sortBooks('title')">Sort by Title</button>
            <button onclick="sortBooks('author')">Sort by Author</button>
        </div>
        <table id="booksTable">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.FileReader("/workspaces/ProjectRepoNew/src/main/resources/cart.csv"));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] parts = line.split(",");
                        if (parts.length >= 4) { // Ensure enough fields are present
                            String title = parts[0].trim();
                            String author = parts[1].trim();
                            String price = parts[3].trim();
                            %>
                            <tr>
                                <td><%= title %></td>
                                <td><%= author %></td>
                                <td><%= price %></td>
                            </tr>
                            <%
                        } else {
                            // Log or handle incomplete data
                            System.out.println("Incomplete data: " + line);
                        }
                    }
                    reader.close();
                } catch (java.io.IOException e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>

    <script>
        function sortBooks(criteria) {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("booksTable");
            switching = true;
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[criteria === 'title' ? 0 : 1];
                    y = rows[i + 1].getElementsByTagName("TD")[criteria === 'title' ? 0 : 1];
                    if (criteria === 'title' && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                    if (criteria === 'author' && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                }
            }
        }
    </script>
</body>
</html>
