package com.example.demo.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.UserRegistration;

public interface UserRepo extends CrudRepository<UserRegistration, Long> {

    UserRegistration findByEmail(String email);

    UserRegistration findByEmailAndPassword(String email, String password);
    UserRegistration findByUname(String uname);
}
