package com.pager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.pager.model.User;

@Mapper
public interface UserMapper {

    // ✅ 1. 이메일(ID)로 회원 조회
    @Select("SELECT * FROM `user` WHERE mbId = #{mbId} AND mbName = #{mbName} AND hashYN != 'Y'")
    User findByMbId(String mbId, String mbName); 
    
    @Select("SELECT * FROM `user` WHERE mbId = #{mbId}  AND hashYN != 'Y'")
    User getByMbId(String mbId); 
    
    @Select("SELECT * FROM `user` ")
    List<User> getUser(); 

    // ✅ 2. 회원가입
    @Insert("""
        INSERT INTO `user` (mbId, mbPassword, mbName, joinDate, recentDate, hashYN)
        VALUES (#{mbId}, #{mbPassword}, #{mbName}, NOW(), NOW(), 'N')
    """)
    void insertUser(User user); 

    // ✅ 3. 회원 정보 수정 (비밀번호 제외)
    @Update("""
        UPDATE `user`
        SET mbName = #{mbName},
            recentDate = NOW()
        WHERE mbId = #{mbId}
    """)
    void updateUser(User user);

    // ✅ 4. 비밀번호 수정
    @Update("""
        UPDATE `user`
        SET mbPassword = #{mbPassword},
            recentDate = NOW()
        WHERE mbId = #{mbId}
    """)
    void updatePassword(User user);

    // ✅ 5. 회원탈퇴 처리 (hashYN를 'Y'로 변경)
    @Update("""
        UPDATE `user`
        SET hashYN = 'Y',
            recentDate = NOW()
        WHERE mbId = #{mbId}
    """)
    void deleteUserByMbId(String mbId);
}
