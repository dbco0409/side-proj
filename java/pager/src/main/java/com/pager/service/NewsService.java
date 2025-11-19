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

    public void insertNews(News news) {
        // regdate가 비어 있으면 현재 시각으로 기본값 설정
        if (news.getRegdate() == null) {
            news.setRegdate(LocalDateTime.now());
        }
        newsMapper.insertNews(news);
    }

    public boolean updateNews(News news) {
        int updated = newsMapper.updateNews(news);
        return updated > 0;
    }

    public boolean deleteNews(Long id) {
        int deleted = newsMapper.deleteNews(id);
        return deleted > 0;
    }

    @Transactional(readOnly = true)
    public News getNews(Long id) {
        return newsMapper.getNews(id);
    }

    @Transactional(readOnly = true)
    public List<News> getNewsList() {
        return newsMapper.getNewsList();
    }
}
