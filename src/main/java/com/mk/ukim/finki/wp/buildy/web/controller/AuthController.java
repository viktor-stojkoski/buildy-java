package com.mk.ukim.finki.wp.buildy.web.controller;

import com.mk.ukim.finki.wp.buildy.model.dto.UserDto;
import com.mk.ukim.finki.wp.buildy.model.request.user.LoginRequest;
import com.mk.ukim.finki.wp.buildy.model.request.user.RegisterRequest;
import com.mk.ukim.finki.wp.buildy.service.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/auth")
@CrossOrigin(origins = "http://localhost:4200")
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("login")
    public UserDto login(@RequestBody LoginRequest userRequest) {
        return userService.login(userRequest);
    }

    @PostMapping("register")
    public UserDto register(@RequestBody RegisterRequest registerRequest) {
        return userService.register(registerRequest);
    }
}
