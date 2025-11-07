package com.pager.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pager.mapper.BidMapper;
import com.pager.model.BidApiItem;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@RequiredArgsConstructor
public class BidOpenApiService {

    private final BidMapper bidMapper;

    private static final String SERVICE_URL =
        "https://apis.data.go.kr/1230000/ao/PrvtBidNtceService/getPrvtBidPblancListInfoServcPPSSrch";
    private static final String SERVICE_KEY = "b6QUXFo4NJdzDjrwkgiDQAoVJIhjHLU9NplomktTDExQr8f5t153FdoHN%2FhWgBpgNcbIWhNsL%2FfJSnFqNZGdvg%3D%3D"; // 🔑 실제 API Key 필요
    private static final DateTimeFormatter DT_FMT = DateTimeFormatter.ofPattern("yyyyMMddHHmm");

    /**
     * ✅ 매일 새벽 2시에 자동으로 API 데이터를 DB에 저장 (스케줄링)
     */
    @Scheduled(cron = "0 0 2 * * *")
    public void syncBidDataDaily() {
        System.out.println("🔄 [BidSync] 입찰정보 동기화 시작 " + new Date());

        List<String> keywords = List.of("웹", "홈페이지", "앱", "web", "ai");
        for (String keyword : keywords) {
            List<BidApiItem> list = fetchByKeyword(keyword, 1, 100);
            for (BidApiItem item : list) {
                Map<String, Object> map = new HashMap<>();
                map.put("bidNtceNo", item.getBidNtceNo());
                map.put("ntceNm", item.getNtceNm());
                map.put("opengPlce", item.getOpengPlce());
                map.put("opengDt", item.getOpengDt());
                map.put("cntrctMthdNm", item.getCntrctMthdNm());
                map.put("sucsfbidMthdNm", item.getSucsfbidMthdNm());
                bidMapper.upsert(map);
            }
        }

        System.out.println("✅ [BidSync] 입찰정보 DB 저장 완료 (" + new Date() + ")");
    }

    /**
     * ✅ DB에서 모든 입찰 데이터 조회
     */
    public List<Map<String, Object>> getAllBids() {
        return bidMapper.selectAll();
    }

    /**
     * ✅ DB에서 단건 조회
     */
    public Map<String, Object> getBidDetail(String bidNtceNo) {
        return bidMapper.selectByBidNo(bidNtceNo);
    }

    /**
     * ✅ API 호출 (기존 로직 재사용)
     */
    private List<BidApiItem> fetchByKeyword(String keyword, int pageNo, int numOfRows) {
        List<BidApiItem> list = new ArrayList<>();
        try {
            LocalDateTime end = LocalDateTime.now();
            LocalDateTime begin = end.minusMonths(6);
            String inqryBgnDt = begin.format(DT_FMT);
            String inqryEndDt = end.format(DT_FMT);

            String url = String.format(
                "%s?serviceKey=%s&type=json&pageNo=%d&numOfRows=%d&inqryDiv=1&inqryBgnDt=%s&inqryEndDt=%s&bidNtceNm=%s",
                SERVICE_URL,
                SERVICE_KEY,
                pageNo, numOfRows, inqryBgnDt, inqryEndDt,
                URLEncoder.encode(keyword, StandardCharsets.UTF_8)
            );

            RestTemplate rt = new RestTemplate();
            ResponseEntity<String> res = rt.getForEntity(URI.create(url), String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(res.getBody());
            JsonNode items = root.path("response").path("body").path("items");

            if (items.isArray()) {
                for (JsonNode n : items) list.add(mapItem(n));
            } else if (!items.isMissingNode() && !items.isNull()) {
                list.add(mapItem(items));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private BidApiItem mapItem(JsonNode n) {
        BidApiItem it = new BidApiItem();
        it.setBidNtceNo(n.path("bidNtceNo").asText(""));
        it.setNtceNm(n.path("ntceNm").asText(""));
        it.setOpengPlce(n.path("opengPlce").asText(""));
        it.setOpengDt(n.path("opengDt").asText(""));
        it.setCntrctMthdNm(n.path("cntrctMthdNm").asText(""));
        it.setSucsfbidMthdNm(n.path("sucsfbidMthdNm").asText(""));
        return it;
    }
}
