package com.mk.ukim.finki.wp.buildy.service;

import com.mk.ukim.finki.wp.buildy.model.entity.User;
import com.mk.ukim.finki.wp.buildy.model.request.user.UserRequest;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User Login(UserRequest userRequest);
}
