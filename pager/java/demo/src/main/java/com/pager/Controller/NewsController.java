package com.pager.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pager.model.News;
import com.pager.model.Shop;
import com.pager.service.NewsService;

import lombok.RequiredArgsConstructor;

@Controller  // ✅ RestController → Controller 로 변경
@RequestMapping("/news")
@RequiredArgsConstructor
public class NewsController {
private final NewsService newsService;

    // ✅ 단일 견적 조회
    @GetMapping("{id}")
    public String getCompany(@PathVariable Long id, Model model) {
    	News news = newsService.getNews(id);
        model.addAttribute("news", news);
        return "news_view"; // bid_view.html 로 이동
    }
    
    @GetMapping("/list")
    public String list(Model model) {
        List<News> news = newsService.getNewsList();
        model.addAttribute("news", news);
        return "news"; // ✅ quote.html 렌더링
    }
    
    @GetMapping("/newsList")
    @ResponseBody
    public Map<String, Object> newsList() {
        List<News> news = newsService.getNewsList();

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("news", news);
        result.put("total", news.size());
        return result; // ✅ JSON 형태로 React에 전달
    }
    
    @GetMapping("/newsView/{id}")
    @ResponseBody
    public Map<String, Object> getNewsView(@PathVariable Long id, Model model) {
    	News news = newsService.getNews(id);

        Map<String, Object> result = new HashMap<>();
        if (news != null) {
            result.put("success", true);
            result.put("news", news);
        } else {
            result.put("success", false);
            result.put("message", "해당 뉴스가 존재하지 않습니다.");
        }
        return result;
    }
}
