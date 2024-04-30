package com.example.demo.controller;

import com.example.demo.model.Book;
import com.example.demo.repository.BookRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    private BookRepository bookRepository; // Inject BookRepository

    @GetMapping("/admin")
    String adminPage() {
        return "admin";
    }

    @PostMapping("/admin/save-book")
    String saveBookAction(@RequestParam Map<String,String> allParams) {
        // Extract parameters from the request
        String title = allParams.get("title");
        String bookImageUrl = allParams.get("bookImageUrl");
        Double price = Double.valueOf(allParams.get("price"));
        String author = allParams.get("author");
        String about = allParams.get("about");
        Integer pageLength = Integer.valueOf(allParams.get("pageLength"));
        String language = allParams.get("language");
        String manufacturer = allParams.get("manufacturer");

        // Create a new Book object
        Book book = new Book();
        book.setTitle(title);
        book.setBookImageUrl(bookImageUrl);
        book.setPrice(price);
        book.setAuthor(author);
        book.setAbout(about);
        book.setPageLength(pageLength);
        book.setLanguage(language);
        book.setManufacturer(manufacturer);

        // Save the book using BookRepository
        bookRepository.save(book);

        // Save the book information in cart.csv
        saveToCartCSV(book);

        return "admin";
    }

    private void saveToCartCSV(Book book) {
        String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/cart.csv";
        try (FileWriter writer = new FileWriter(csvFile, true)) {
            // Append the book information to the CSV file
            writer.append(String.format("%s,%s,%.2f,%s,%s,%d,%s,%s%n",
                    book.getTitle(), book.getBookImageUrl(), book.getPrice(), book.getAuthor(),
                    book.getAbout(), book.getPageLength(), book.getLanguage(), book.getManufacturer()));
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
