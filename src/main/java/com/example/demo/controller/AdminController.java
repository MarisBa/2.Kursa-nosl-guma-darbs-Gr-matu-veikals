package com.example.demo.controller;

import com.example.demo.model.Book;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.BufferedReader;
import java.io.FileReader;
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

        // Get the highest existing book ID from the CSV file
        Long highestId = getMaxIdFromCSV();

        // Create a new Book object
        Long newId = highestId + 1;
        Book book = new Book();
        book.setId(newId); // Set new ID
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

        saveToCartCSV(savedBook, newId); // Pass the new ID

        // Redirect to the book details page with the book ID
        return "redirect:/admin/book/" + savedBook.getId();
    }

    private Long getMaxIdFromCSV() {
        String csvFile = "src/main/resources/cart.csv";
        Long maxId = 0L;

        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                Long id = Long.valueOf(data[0]);
                if (id > maxId) {
                    maxId = id;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return maxId;
    }

    @GetMapping("/admin/book/{id}")
    public String viewBookPage(@PathVariable("id") Long bookId, Model model) {
        Optional<Book> optionalBook = bookRepository.findById(bookId);
        if (optionalBook.isPresent()) {
            model.addAttribute("book", optionalBook.get());
            return "book"; // Return book.html template
        } else {
            // Try to load from CSV
            Optional<Book> optionalBookFromCSV = loadBookFromCSV(bookId);
            if (optionalBookFromCSV.isPresent()) {
                model.addAttribute("book", optionalBookFromCSV.get());
                return "book"; // Return book.html template
            } else {
                // Set error message
                model.addAttribute("errorMessage", "Book not found");
                return "error"; // or redirect to an error page
            }
        }
    }

    private Optional<Book> loadBookFromCSV(Long bookId) {
        // Assuming CSV format is consistent with the saveToCartCSV method
        String csvFile = "src/main/resources/cart.csv";
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                Long id = Long.valueOf(data[0]);
                if (id.equals(bookId)) {
                    Book book = new Book();
                    book.setId(Long.valueOf(data[0]));
                    book.setTitle(data[1]);
                    book.setBookImageUrl(data[2]);
                    book.setPrice(Double.valueOf(data[3]));
                    book.setAuthor(data[4]);
                    book.setAbout(data[5]);
                    book.setPageLength(Integer.valueOf(data[6]));
                    book.setLanguage(data[7]);
                    book.setManufacturer(data[8]);
                    book.setIsbn(data[9]);
                    book.setPublicationDate(data[10]);
                    book.setCoverType(data[11]);
                    return Optional.of(book);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    private void saveToCartCSV(Book book, Long newId) {
        try {
            // Append the book information to the CSV file
            String csvFile = "src/main/resources/cart.csv";
            try (FileWriter writer = new FileWriter(csvFile, true)) {
                writer.append(String.format("%d,%s,%s,%.2f,%s,%s,%d,%s,%s,%s,%s,%s%n",
                        newId, book.getTitle(), book.getBookImageUrl(), book.getPrice(), book.getAuthor(),
                        book.getAbout(), book.getPageLength(), book.getLanguage(), book.getManufacturer(),
                        book.getIsbn(), book.getPublicationDate(), book.getCoverType()));
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
