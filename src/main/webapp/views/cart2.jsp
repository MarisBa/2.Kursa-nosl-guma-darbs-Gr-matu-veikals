<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        h1 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
            color: #343a40;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0px 0px 20px #0000000f;
        }
        th, td {
            border: 1px solid #dee2e6;
            text-align: left;
            padding: 15px;
        }
        th {
            background-color: #343a40;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .quantity-input {
            width: 50px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .remove-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 0.9em;
            transition: background-color 0.3s;
        }
        .remove-button:hover {
            background-color: #c82333;
        }
        .create-order-button, .create-csv-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 0.9em;
            transition: background-color 0.3s;
            display: block;
            margin: 20px auto;
        }
        .create-order-button:hover, .create-csv-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Your Cart</h1>
    <table>
        <thead>
            <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            try {
                java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.FileReader("/workspaces/ProjectRepoNew/src/main/resources/cartForbooks.csv"));
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    String item = parts[0];
                    %>
                    <tr>
                        <td><%= item %></td>
                        <td><input type="number" class="quantity-input" value="1" min="1"></td>
                        <td><button class="remove-button" onclick="removeItem(this)">Remove</button></td>

                    </tr>
                    <%
                }
                reader.close();
            } catch (java.io.IOException e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>

    <button class="create-order-button" onclick="createOrder()">Create Order</button>

    <script>
        function removeItem(button) {
            var row = button.parentNode.parentNode;
            var line = Array.from(row.parentNode.children).indexOf(row);

            var xhr = new XMLHttpRequest();
            xhr.open('DELETE', '/remove-item?line=' + line, true);
            xhr.send();

            xhr.onload = function() {
                if (xhr.status === 200) {
                    row.parentNode.removeChild(row);
                    alert('Item removed successfully');
                } else {
                    alert('Failed to remove item');
                }
            };
        }


    </script>
</body>
</html>
