package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.UserRegistration;
import com.example.demo.repository.UserRepo;

@RestController
public class RegistrationController {
    
    @Autowired
    UserRepo repo;
    
    @RequestMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Registration_Form");
        return mv;
    }
    
    @RequestMapping("/AlreadyLogin")
    public ModelAndView AlreadyLogin() {
        return new ModelAndView("Login_Form");
    }
    
    @RequestMapping("/Registration")
    public ModelAndView registration(UserRegistration reg) {
        repo.save(reg);
        return new ModelAndView("Login_Form");
    }
    
    @RequestMapping("/Login")
    public ModelAndView login(String email, String password) {
        ModelAndView mv = new ModelAndView("Login_Form");
        
        UserRegistration user = repo.findByEmailAndPassword(email, password);
        
        if(user != null) {
            String msg = "Login Successful";  
            mv.addObject("message", msg);  
            mv.setViewName("view");
        } else {
            String msg = "Sorry, you entered an incorrect email or password";  
            mv.addObject("message", msg);  
            mv.setViewName("error"); 
        }

        return mv;
    }

    @GetMapping("/storeEbook")
    public ModelAndView getbookStore() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("storeEbook"); // This assumes "storeEbook.jsp" exists in your configured view resolver
        return mv;
    }

    @GetMapping("/Available_books")
    public ModelAndView getAllBooks() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Available_books"); // This assumes "storeEbook.jsp" exists in your configured view resolver
        return mv;
    }

    @GetMapping("/Register_book")
    public ModelAndView registerBook(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Register_book");
        mv.addObject("registrationResult", registrationResult);
        return mv;
    }
}
