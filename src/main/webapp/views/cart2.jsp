<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
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
            background-color: #dddddd;
        }
        .quantity-input {
            width: 50px;
        }
        .remove-button {
            background-color: #ff3333;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
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
                        <td><input type="number" class="quantity-input" value="1"></td>
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

    <script>
        function removeItem(button) {
            var row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>
</body>
</html>
