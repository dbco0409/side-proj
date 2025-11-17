package com.pager.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pager.mapper.UserMapper;
import com.pager.model.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    public User findByMbId(String mbId, String mbName) {
        return userMapper.findByMbId(mbId, mbName);
    }
    
    public User getByMbId(String mbId) {
        return userMapper.getByMbId(mbId);
    }
    
    public List<User> getUser(){
    	return userMapper.getUser();
    } 

    public boolean checkPassword(String rawPassword, String hashedPassword) {
        return passwordEncoder.matches(rawPassword, hashedPassword);
    }
    
    public boolean register(String mbId, String mbPassword, String mbName) {
        try {
            User existing = userMapper.getByMbId(mbId);
            if (existing != null) return false;

            User user = new User();
            user.setMbId(mbId);
            user.setMbPassword(passwordEncoder.encode(mbPassword));
            user.setMbName(mbName);

            userMapper.insertUser(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace(); // 콘솔에 에러 출력
            return false;
        }
    }

    public String encodePassword(String raw) {
        return passwordEncoder.encode(raw);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }
    
    public void updatePassword(User user) {
        userMapper.updatePassword(user);
    }
    
    public void deleteUserByMbId(String mbId) {
    	userMapper.deleteUserByMbId(mbId);
    }

}
