package com.example.demo.controller;

import com.example.demo.model.Book;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired
    private BookRepository bookRepository; // Inject BookRepository

    @GetMapping("/admin")
    String adminPage() {
        return "admin";
    }

    @PostMapping("/admin/save-book")
    String saveBookAction(@RequestParam Map<String, String> allParams, RedirectAttributes redirectAttributes) {
        // Extract parameters from the request
        String title = allParams.get("title");
        String bookImageUrl = allParams.get("bookImageUrl");
        Double price = Double.valueOf(allParams.get("price"));
        String author = allParams.get("author");
        String about = allParams.get("about");
        Integer pageLength = Integer.valueOf(allParams.get("pageLength"));
        String language = allParams.get("language");
        String manufacturer = allParams.get("manufacturer");
        String isbn = allParams.get("isbn"); // New property
        String publicationDate = allParams.get("publicationDate"); // New property
        String coverType = allParams.get("coverType"); // New property
    
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
        book.setIsbn(isbn); // Set ISBN code
        book.setPublicationDate(publicationDate); // Set publication date
        book.setCoverType(coverType); // Set cover type
    
        // Save the book using BookRepository
        Book savedBook = bookRepository.save(book);

        saveToCartCSV(savedBook);
    
        // Redirect to the book details page with the book ID
        return "redirect:/admin/book/" + savedBook.getId();
    }

    @GetMapping("/admin/book/{id}")
    public String viewBookPage(@PathVariable("id") Long bookId, Model model) {
        Optional<Book> optionalBook = bookRepository.findById(bookId);
        if (optionalBook.isPresent()) {
            model.addAttribute("book", optionalBook.get());
            return "book"; // Return book.html template
        } else {
            // Set error message
            model.addAttribute("errorMessage", "Book not found");
            return "error"; // or redirect to an error page
        }
    }
    

    private void saveToCartCSV(Book book) {
        String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/cart.csv";
        try (FileWriter writer = new FileWriter(csvFile, true)) {
            // Append the book information to the CSV file
            writer.append(String.format("%d,%s,%s,%.2f,%s,%s,%d,%s,%s,%s,%s,%s%n",
                    book.getId(), book.getTitle(), book.getBookImageUrl(), book.getPrice(), book.getAuthor(),
                    book.getAbout(), book.getPageLength(), book.getLanguage(), book.getManufacturer(),
                    book.getIsbn(), book.getPublicationDate(), book.getCoverType()));
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}