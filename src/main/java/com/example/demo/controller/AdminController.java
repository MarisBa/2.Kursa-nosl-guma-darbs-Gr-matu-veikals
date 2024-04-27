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

    private static final String CSV_FILE_PATH = "/workspaces/ProjectRepoNew/src/main/resources/cart.csv";

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

        // Write to the CSV file
        writeBookToCSV(book);

        return "admin";
    }
    private void writeBookToCSV(Book book) {
        try (FileWriter writer = new FileWriter(CSV_FILE_PATH, false)) {
            writer.append("Title,BookImageUrl,Price,Author,About,PageLength,Language,Manufacturer\n"); // Header
            writer.append(String.join(",", 
                            book.getTitle(),
                            book.getBookImageUrl(),
                            String.valueOf(book.getPrice()),
                            book.getAuthor(),
                            book.getAbout(),
                            String.valueOf(book.getPageLength()),
                            book.getLanguage(),
                            book.getManufacturer()));
            writer.append("\n");
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
            // Handle exception
        }
    }
    
}
