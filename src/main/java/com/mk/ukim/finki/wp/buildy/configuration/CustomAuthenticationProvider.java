//package com.mk.ukim.finki.wp.buildy.configuration;
//
//import com.mk.ukim.finki.wp.buildy.model.exception.ErrorCodes;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//public class CustomAuthenticationProvider implements AuthenticationProvider {
//
//    private final UserService userService;
//
//    private final PasswordEncoder passwordEncoder;
//
//    public CustomAuthenticationProvider(PasswordEncoder passwordEncoder,
//                                        UserService userService) {
//        this.passwordEncoder = passwordEncoder;
//        this.userService = userService;
//    }
//
//
//    @Override
//    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//        String username = authentication.getName();
//        String password = authentication.getCredentials().toString();
//
//        if (username.trim().equals("") || password.trim().equals("")) {
//            throw new BadCredentialsException(ErrorCodes.INVALID_CREDENTIALS);
//        }
//
//
//    }
//
//    @Override
//    public boolean supports(Class<?> aClass) {
//        return false;
//    }
//}
