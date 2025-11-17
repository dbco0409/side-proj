package com.pager.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pager.service.QuoteService;

import java.util.*;

@Controller
@RequestMapping("/ordering")
@RequiredArgsConstructor
public class QuoteController {

    private final QuoteService quoteService;

    // 목록 (템플릿)
    @GetMapping("/list")
    public String getQuoteApiList(Model model) {
        // ✅ 서비스가 반환하는 타입에 맞춰 받기 (List)
        List<Map<String, Object>> items = quoteService.getAllQuotes();

        // ✅ 정렬 키 주의: 서비스에서 사용하는 키 이름과 맞추세요 (예: "orderPlanDate" or "orderBgnYm")
        items.sort((a, b) -> 
            String.valueOf(b.getOrDefault("orderPlanDate", ""))
                  .compareTo(String.valueOf(a.getOrDefault("orderPlanDate", "")))
        );

        model.addAttribute("items", items);
        model.addAttribute("total", items.size());
        return "quote"; // templates/quote.html
    }

    // 상세 (템플릿)
    @GetMapping("/view/{orderPlanUntyNo}")
    public String viewOrdering(@PathVariable String orderPlanUntyNo, Model model) {
        Map<String, Object> item = quoteService.getQuoteDetail(orderPlanUntyNo);
        if (item == null || item.isEmpty()) {
            return "redirect:/ordering/list";
        }
        model.addAttribute("item", item);
        return "quote_view"; // templates/quote_view.html
    }

    // 목록 (JSON)
    @GetMapping("/ordering_list")
    @ResponseBody
    public Map<String, Object> getQuoteApiListJson() {
        List<Map<String, Object>> items = quoteService.getAllQuotes();

        items.sort((a, b) ->
            String.valueOf(b.getOrDefault("orderPlanDate", ""))
                  .compareTo(String.valueOf(a.getOrDefault("orderPlanDate", "")))
        );

        Map<String, Object> result = new HashMap<>();
        result.put("items", items);
        result.put("total", items.size());
        return result;
    }

    // 상세 (JSON)
    @GetMapping("/ordering_view/{orderPlanUntyNo}")
    @ResponseBody
    public Map<String, Object> viewQuoteAjax(@PathVariable String orderPlanUntyNo) {
        Map<String, Object> item = quoteService.getQuoteDetail(orderPlanUntyNo);

        Map<String, Object> result = new HashMap<>();
        if (item != null && !item.isEmpty()) {
            result.put("success", true);
            result.put("item", item);
        } else {
            result.put("success", false);
            result.put("message", "해당 데이터가 존재하지 않습니다.");
        }
        return result;
    }
    
    @GetMapping("/sync")
    public String syncNow(Model model) {
        try {
            quoteService.syncOpenApiData(); // 즉시 API 호출 및 DB 반영
            model.addAttribute("success", true);
            model.addAttribute("message", "발주 데이터 수동 갱신이 완료되었습니다.");
        } catch (Exception e) {
            model.addAttribute("success", false);
            model.addAttribute("message", "갱신 중 오류 발생: " + e.getMessage());
        }

        return "admin/ordering_sync"; 
    }

}
