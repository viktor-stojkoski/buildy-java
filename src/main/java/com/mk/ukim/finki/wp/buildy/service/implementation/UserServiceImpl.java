package com.mk.ukim.finki.wp.buildy.service.implementation;

import com.mk.ukim.finki.wp.buildy.model.entity.User;
import com.mk.ukim.finki.wp.buildy.model.exception.BuildyNotFoundException;
import com.mk.ukim.finki.wp.buildy.model.exception.ErrorCodes;
import com.mk.ukim.finki.wp.buildy.model.request.user.UserRequest;
import com.mk.ukim.finki.wp.buildy.persistance.UserRepository;
import com.mk.ukim.finki.wp.buildy.service.UserService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User Login(UserRequest userRequest) {
        User user = userRepository
                .findUserByUsername(userRequest.username)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.USER_NOT_FOUND));

        return user;
    }

    @Override
    public User loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository
                .findUserByUsername(username)
                .orElseThrow(() -> new BuildyNotFoundException(ErrorCodes.USER_NOT_FOUND));

        return user;
    }
}
