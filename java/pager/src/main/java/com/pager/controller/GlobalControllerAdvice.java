package com.pager.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.pager.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@ControllerAdvice("globalExceptionHandler")
public class GlobalControllerAdvice {

    @ModelAttribute("loginUser")
    public User addUserToModel(HttpSession session) {
        return (User) session.getAttribute("loginUser");
    }
    
    @ModelAttribute("currentURI")
    public String currentUri(HttpServletRequest request) {
        return request.getRequestURI();
    }
}
