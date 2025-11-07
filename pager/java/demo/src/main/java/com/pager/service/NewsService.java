package com.pager.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pager.mapper.NewsMapper;
import com.pager.model.News;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class NewsService {

    private final NewsMapper newsMapper;

    /** 1) 등록 */
    public void insertNews(News news) {
        // regdate가 비어 있으면 현재 시각으로 기본값 설정
        if (news.getRegdate() == null) {
            news.setRegdate(LocalDateTime.now());
        }
        newsMapper.insertNews(news);
    }

    /** 2) 수정 (수정 성공 시 true) */
    public boolean updateNews(News news) {
        int updated = newsMapper.updateNews(news);
        return updated > 0;
    }

    /** 3) 삭제 (삭제 성공 시 true) */
    public boolean deleteNews(Long id) {
        int deleted = newsMapper.deleteNews(id);
        return deleted > 0;
    }

    /** 4) 단건 조회 */
    @Transactional(readOnly = true)
    public News getNews(Long id) {
        return newsMapper.getNews(id);
    }

    /** 5) 전체 리스트 */
    @Transactional(readOnly = true)
    public List<News> getNewsList() {
        return newsMapper.getNewsList();
    }
}
