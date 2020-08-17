package com.mk.ukim.finki.wp.buildy.service;

import com.mk.ukim.finki.wp.buildy.model.dto.UserDto;
import com.mk.ukim.finki.wp.buildy.model.request.user.LoginRequest;
import com.mk.ukim.finki.wp.buildy.model.request.user.RegisterRequest;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    UserDto login(LoginRequest userRequest);

    UserDto register(RegisterRequest registerRequest);
}
