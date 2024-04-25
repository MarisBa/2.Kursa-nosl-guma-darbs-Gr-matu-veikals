package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;


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
            mv.setViewName("storeEbook2"); // Redirect to storeEbook upon successful login
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

    @GetMapping("/the-holy-grail-of-investing")
    public ModelAndView registerBookTony(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("the-holy-grail-of-investing");
        return mv;
    }
    @GetMapping("/the-last-devil-to-die")
    public ModelAndView registerBookDevil(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("the-last-devil-to-die");
        return mv;
    }

    @GetMapping("/the-atlas-manuever")
    public ModelAndView registerBookAtlasManuever(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("the-atlas-manuever");
        return mv;
    }

    @GetMapping("/heidi")
    public ModelAndView registerBookHeidi(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("heidi");
        return mv;
    }
    
    @GetMapping("/james")
    public ModelAndView registerBookJames(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("james");
        return mv;
    }

    @GetMapping("/one-hundred-years-of-solitude")
    public ModelAndView registerBookOneHoundred(@RequestParam(required = false) String registrationResult) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("one-hundred-years-of-solitude");
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
 