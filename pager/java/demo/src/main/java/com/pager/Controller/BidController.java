package com.pager.Controller;

import com.pager.service.BidOpenApiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/bid")
@RequiredArgsConstructor
public class BidController {

    private final BidOpenApiService bidOpenApiService;

    /**
     * ✅ 1. 입찰 목록 페이지 (템플릿용)
     * DB에서 조회한 결과를 bid.html에 출력
     */
    @GetMapping("/list")
    public String list(Model model) {
        List<Map<String, Object>> bids = bidOpenApiService.getAllBids(); // ✅ DB 조회
        model.addAttribute("bids", bids);
        model.addAttribute("total", bids.size());
        return "bid"; // → templates/bid.html
    }

    /**
     * ✅ 2. 입찰 상세 페이지 (템플릿용)
     */
    @GetMapping("/view/{bidNtceNo}")
    public String viewBid(@PathVariable String bidNtceNo, Model model) {
        Map<String, Object> item = bidOpenApiService.getBidDetail(bidNtceNo); // ✅ DB에서 단건 조회

        if (item == null || item.isEmpty()) {
            // 데이터가 없을 경우 목록으로 리다이렉트
            model.addAttribute("error", "해당 입찰 정보를 찾을 수 없습니다.");
            return "redirect:/bid/list";
        }

        model.addAttribute("item", item);
        return "bid_view"; // → templates/bid_view.html
    }

    /**
     * ✅ 3. AJAX용 입찰 목록 (JSON 반환)
     * JS fetch()에서 /bid/bid_list 호출 시 DB 데이터 반환
     */
    @GetMapping("/bid_list")
    @ResponseBody
    public Map<String, Object> listAjax() {
        List<Map<String, Object>> bids = bidOpenApiService.getAllBids();

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("bids", bids);
        result.put("total", bids.size());
        return result;
    }

    /**
     * ✅ 4. AJAX용 입찰 상세보기 (JSON)
     * 단일 입찰 상세조회
     */
    @GetMapping("/bid_view/{bidNtceNo}")
    @ResponseBody
    public Map<String, Object> viewBidAjax(@PathVariable String bidNtceNo) {
        Map<String, Object> item = bidOpenApiService.getBidDetail(bidNtceNo);

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

    /**
     * ✅ 5. 관리자 수동 동기화 버튼용 (예: /bid/sync)
     * API로부터 데이터를 다시 불러와 DB 갱신
     */
    @GetMapping("/sync")
    @ResponseBody
    public Map<String, Object> syncNow() {
        Map<String, Object> result = new HashMap<>();
        try {
            bidOpenApiService.syncBidDataDaily(); // ✅ 즉시 API 호출 및 DB 반영
            result.put("success", true);
            result.put("message", "입찰 데이터 수동 갱신이 완료되었습니다.");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "갱신 중 오류가 발생했습니다: " + e.getMessage());
        }
        return result;
    }
}
