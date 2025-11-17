package com.pager.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.pager.model.Qna;

@Mapper
public interface QnaMapper {

    // ✅ 1. Q&A 등록
    @Insert("""
        INSERT INTO qna (name, department, company, tel, email, category, content, regdate)
        VALUES (#{name}, #{department}, #{company}, #{tel}, #{email}, #{category}, #{content}, NOW())
    """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertQna(Qna qna);

    // ✅ 2. Q&A 수정
    @Update("""
        UPDATE qna
        SET name = #{name},
            department = #{department},
            company = #{company},
            tel = #{tel},
            email = #{email},
            category = #{category},
            content = #{content}
        WHERE id = #{id}
    """)
    int updateQna(Qna qna);

    // ✅ 3. Q&A 삭제
    @Delete("DELETE FROM qna WHERE id = #{id}")
    int deleteQna(Long id);

    // ✅ 4. 단건 조회
    @Select("SELECT * FROM qna WHERE id = #{id}")
    Qna getQna(Long id);

    // ✅ 5. 전체 목록 조회
    @Select("SELECT * FROM qna ORDER BY id DESC")
    List<Qna> getQnaList();
}
