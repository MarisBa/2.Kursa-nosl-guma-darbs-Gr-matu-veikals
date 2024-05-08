package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.UserRegistration;
import com.example.demo.repository.UserRepo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

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
                System.out.println("User password: " + password);
                
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
        ModelAndView mv = new ModelAndView();
        mv.setViewName("cart2"); // This assumes "storeEbook.jsp" exists in your configured view resolver
        return mv;
    }

}