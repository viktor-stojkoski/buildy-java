package com.mk.ukim.finki.wp.buildy.model.request.user;

import com.mk.ukim.finki.wp.buildy.model.entity.helpers.Gender;

import java.time.LocalDateTime;

public class RegisterRequest {

    public String firstName;

    public String lastName;

    public String emailAddress;

    public String username;

    public String password;

    public Gender gender;

    public LocalDateTime dateOfBirth;
}
