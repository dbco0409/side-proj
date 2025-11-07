package com.pager.Controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.pager.model.User;

import jakarta.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalControllerAdvice {

    @ModelAttribute("loginUser")
    public User addUserToModel(HttpSession session) {
        return (User) session.getAttribute("loginUser");
    }
}
