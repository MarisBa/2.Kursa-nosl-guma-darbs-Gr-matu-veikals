package com.example.demo.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Book;
import com.example.demo.model.UserRegistration;
import com.example.demo.repository.UserRepo;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.Date;
import java.text.SimpleDateFormat;





@Controller
public class RegistrationController {

    @Autowired
    UserRepo repo;

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("storeEbook2");
        return mv;
    }

    @RequestMapping("/AlreadyLogin")
    public ModelAndView AlreadyLogin() {
        return new ModelAndView("Login_Form");
    }

    @GetMapping("/Registration")
    public ModelAndView showRegistrationForm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Registration_Form");
        return mv;
    }

    @PostMapping("/Registration")
    public ModelAndView registration(@RequestParam("password") String password, UserRegistration reg) {
        // Check if the user already exists in the CSV file
        if (userExistsInCSV(reg.getEmail())) {
            ModelAndView mv = new ModelAndView("Registration_Form");
            mv.addObject("message", "User already exists with this email");
            return mv;
        } else {
            // Set the password for the UserRegistration object
            reg.setPassword(password);
            repo.save(reg);
            saveToCSV(reg); // Save user data to CSV
            
            // Check if user is saved successfully
            if (repo.findByEmail(reg.getEmail()) != null) {
                ModelAndView mv = new ModelAndView("redirect:/AlreadyLogin"); // Redirect to login page
                mv.addObject("message", "Registration Successful");
                
                // Print user password to console
                // System.out.println("User password: " + password);
                
                return mv;
            } else {
                ModelAndView mv = new ModelAndView("Registration_Form");
                mv.addObject("message", "Error occurred during registration");
                return mv;
            }
        }
    }
    
    
    
    
    
    // Check if user exists in the CSV file
private boolean userExistsInCSV(String email) {
    String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/users.csv";
    try (BufferedReader reader = new BufferedReader(new FileReader(csvFile))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 3 && parts[2].equals(email)) {
                // Email found in CSV
                return true;
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
        System.err.println("Error while reading CSV: " + e.getMessage());
    }
    // Email not found in CSV
    return false;
}
@RequestMapping("/Login")
public ModelAndView login(String email, String password) {
    ModelAndView mv = new ModelAndView("Login_Form");

    // Trim email to remove extra spaces
    email = email.trim();

    System.out.println("Email: " + email);
    System.out.println("Password: " + password);

    // Check credentials against the users.csv file
    String[] userDetails = validateCredentials(email, password);
    if (userDetails != null) {
        System.out.println("Login successful for user: " + email);
        String name = userDetails[1]; // Index 1 is assumed to be the name
        System.out.println("Welcome, " + name);

        // Set username as a parameter to pass to the storeEbook2 page
        mv.addObject("username", name);

        String msg = "Login Successful";
        mv.addObject("message", msg);
        // Set view to redirect to the storeEbook2 page on successful login
        mv.setViewName("redirect:/storeEbook2?username=" + name);
    } else {
        System.out.println("Login failed for email: " + email);
        String msg = "Sorry, you entered an incorrect email or password";
        mv.addObject("message", msg);
    }

    return mv;
}


// Validate user credentials against the users.csv file
private String[] validateCredentials(String email, String password) {
    String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/users.csv";
    try (BufferedReader reader = new BufferedReader(new FileReader(csvFile))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 4 && parts[2].trim().equals(email) && parts[3].trim().equals(password)) {
                // Email and password found in CSV
                return parts;
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
        System.err.println("Error while reading CSV: " + e.getMessage());
    }
    // Email or password not found in CSV
    return null;
}




// Save user data to CSV
private void saveToCSV(UserRegistration user) {
    String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/users.csv";
    try (Writer writer = new FileWriter(csvFile, true)) {
        // If the file doesn't exist, create it and add header
        if (!new File(csvFile).exists()) {
            writer.write("UID,uname,email,password\n");
        }
        // Set the password from the user object
        user.setPassword(user.getPassword());
        writer.append(user.toCSV() + "\n");
        System.out.println("User data saved to CSV");
    } catch (IOException e) {
        e.printStackTrace();
        System.err.println("Error while writing to CSV: " + e.getMessage());
    }
}


    
    @GetMapping("/storeEbook")
    public ModelAndView getbookStore() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("storeEbook"); // This assumes "storeEbook.jsp" exists in your configured view resolver
        return mv;
    }


    @GetMapping("/Register_book")
    public ModelAndView registerBook(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Register_book");
        mv.addObject("registrationResult", registrationResult);
        return mv;
    }


    @GetMapping("/storeEbook2")
    public ModelAndView getbookStore2() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("storeEbook2"); // This assumes "storeEbook.jsp" exists in your configured view resolver
        return mv;
    }

    @GetMapping("/cart2")
    public ModelAndView getbookcart() {
        List<String> cartItems = readCartItemsFromCSV();
        ModelAndView mv = new ModelAndView("cart2");
        mv.addObject("cartItems", cartItems);
        return mv;
    }
    

    @PostMapping("/save-cart")
    public ModelAndView saveCart(@RequestParam("cartItems") List<String> cartItems) {
        try {
            String csvFilePath = "/workspaces/ProjectRepoNew/src/main/resources/cartForbooks.csv";
            FileWriter csvWriter = new FileWriter(csvFilePath, true); // Append mode
            for (String item : cartItems) {
                // Remove "Delete" text and trim spaces
                String cleanedItem = item.replace("Delete", "").trim();
                csvWriter.append(cleanedItem + "\n"); // Write only the book title
            }
            csvWriter.flush();
            csvWriter.close();
            ModelAndView mv = new ModelAndView("redirect:/storeEbook2");
            mv.addObject("message", "Cart saved successfully");
            return mv;
        } catch (IOException e) {
            ModelAndView mv = new ModelAndView("redirect:/storeEbook2");
            mv.addObject("error", "Error saving cart: " + e.getMessage());
            return mv;
        }
    }
    
    @GetMapping("/checkout")
    public ModelAndView checkout() {
        List<String> cartItems = readCartItemsFromCSV();
    
        // Log cart items to console
        System.out.println("Cart Items:");
        for (String item : cartItems) {
            System.out.println(item);
        }
    
        ModelAndView modelAndView = new ModelAndView("checkout"); // Make sure the view name matches your JSP file name
        modelAndView.addObject("cartItems", cartItems);
        return modelAndView;
    }
    
    

    private List<String> readCartItemsFromCSV() {
        List<String> cartItems = new ArrayList<>();
        String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/cartForbooks.csv";
        try (BufferedReader reader = new BufferedReader(new FileReader(csvFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String trimmedItem = line.trim();
                if (!cartItems.contains(trimmedItem)) { // Check for duplicates
                    cartItems.add(trimmedItem);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            // Log or handle the exception
        }
        return cartItems;
    }
    
    @GetMapping("/all-books")
    public ModelAndView getAllBooks() {
        List<Book> books = readAllBooksFromCSV();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("all-books");
        mv.addObject("books", books);
        return mv;
    }

    private List<Book> readAllBooksFromCSV() {
        List<Book> books = new ArrayList<>();
        String csvFile = "/workspaces/ProjectRepoNew/src/main/resources/cart.csv";
        try (BufferedReader reader = new BufferedReader(new FileReader(csvFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println("Reading line: " + line);
                String[] parts = line.split(",");
                if (parts.length >= 5) { // Check if enough fields are present
                    String title = parts[0].trim(); // Index of title
                    String author = parts[1].trim(); // Index of author
                    double price = Double.parseDouble(parts[3].trim()); // Index of price
    
                    Book book = new Book();
                    book.setTitle(title);
                    book.setAuthor(author);
                    book.setPrice(price);
    
                    books.add(book);
                } else {
                    // Log or handle incomplete data
                    System.out.println("Incomplete data: " + line);
                }
            }
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
            System.err.println("Error reading CSV file: " + e.getMessage());
        }
        
        // Print out the books read
        // System.out.println("Books read from CSV:");
        // for (Book book : books) {
        //     System.out.println(book.getTitle() + " by " + book.getAuthor() + ", Price: " + book.getPrice());
        // }
        
        return books;
    }

    @DeleteMapping("/remove-item")
    public ResponseEntity<String> removeItem(@RequestParam("line") int line) {
        try {
            List<String> lines = Files.readAllLines(Paths.get("/workspaces/ProjectRepoNew/src/main/resources/cartForbooks.csv"));
            if (line < 0 || line >= lines.size()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid line number");
            }
            lines.remove(line);
            Files.write(Paths.get("/workspaces/ProjectRepoNew/src/main/resources/cartForbooks.csv"), lines);
            return ResponseEntity.ok("Item removed successfully");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error removing item: " + e.getMessage());
        }
    }



    }







    
