package com.pager.controller;

import com.pager.model.Qna;
import com.pager.model.Shop;
import com.pager.service.QnaService;
import com.pager.service.ShopService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final QnaService qnaService;
    private final ShopService shopService;

    /** 1. GET "/" — index.html 렌더링 */
    @GetMapping("/")
    public String showIndex(Model model) {
    	List<Shop> shops = shopService.getShopList();
        model.addAttribute("shops", shops);
        return "index"; 
    }

    /** 2. POST "/" — AJAX JSON 처리 */
    @PostMapping("/")
    @ResponseBody
    public Map<String, Object> submitQna(@RequestBody Qna qna) {
        Map<String, Object> result = new HashMap<>();
        try {
            qnaService.insertQna(qna);
            result.put("success", true);
            result.put("message", "문의가 정상적으로 접수되었습니다. 담당자가 빠르게 답변드리겠습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "문의 접수 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
        return result; // JSON으로 반환
    }
}
