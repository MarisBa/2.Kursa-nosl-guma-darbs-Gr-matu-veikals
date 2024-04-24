package com.example.demo.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        // Get form data
        String title = request.getParameter("title");
        String author = request.getParameter("author");

        // Write to CSV file
        try (PrintWriter writer = new PrintWriter(new FileWriter("cart.csv", true))) {
            writer.println(title + "," + author);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Respond with success
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
