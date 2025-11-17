package com.pager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.pager.model.News;

@Mapper
public interface NewsMapper {

    // 1) 등록
    @Insert("""
        INSERT INTO news (title, content, regdate, category)
        VALUES (#{title}, #{content}, #{regdate}, #{category})
    """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertNews(News news);

    // 2) 수정
    @Update("""
        UPDATE news
        SET title = #{title},
            content = #{content}
        WHERE id = #{id}
    """)
    int updateNews(News news);

    // 3) 삭제
    @Delete("DELETE FROM news WHERE id = #{id}")
    int deleteNews(Long id);

    // 4) 상세보기(단건)
    @Select("SELECT id, title, content, regdate, category FROM news WHERE id = #{id}")
    News getNews(Long id);

    // 5) 리스트(전체)
    @Select("SELECT id, title, content, regdate, category FROM news ORDER BY regdate DESC, id DESC")
    List<News> getNewsList();
}
