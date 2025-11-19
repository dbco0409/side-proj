package com.pager.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pager.mapper.QuoteMapper;

import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@RequiredArgsConstructor
public class QuoteService {

	private final QuoteMapper quoteMapper;

    private static final String SERVICE_URL =
        "https://apis.data.go.kr/1230000/ao/OrderPlanSttusService/getOrderPlanSttusListServcPPSSrch";
    private static final String SERVICE_KEY = "";
    private static final DateTimeFormatter DT_FMT = DateTimeFormatter.ofPattern("yyyyMMddHHmm");

    @Scheduled(cron = "0 0 2 * * *") 
    public void syncOpenApiData() {
        List<String> keywords = List.of("홈페이지", "웹", "앱", "web", "app", "모바일","사이트","프론트엔드","백엔드","퍼블리싱");

        for (String keyword : keywords) {
            List<Map<String, Object>> items = fetchOpenApiData(keyword);
            items.forEach(quoteMapper::upsert);
        }

        System.out.println("데이터 동기화 완료: " + new Date());
    }
    
    private List<Map<String, Object>> fetchOpenApiData(String bizNm) {
        List<Map<String, Object>> resultList = new ArrayList<>();

        try {
            String url = String.format(
                "%s?serviceKey=%s&pageNo=1&numOfRows=1000&type=json&bizNm=%s",
                SERVICE_URL,
                SERVICE_KEY,
                URLEncoder.encode(bizNm, StandardCharsets.UTF_8)
            );

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.getForEntity(URI.create(url), String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            JsonNode itemsNode = root.path("response").path("body").path("items");

            if (itemsNode.isMissingNode() || itemsNode.isNull()) {
                System.out.println("API 응답에 items 없음 (" + bizNm + ")");
                return resultList;
            }

            if (itemsNode.isArray()) {
                for (JsonNode item : itemsNode) {
                    resultList.add(parseItem(item));
                }
            } else if (itemsNode.isObject()) {
                resultList.add(parseItem(itemsNode));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }

    // JSON → Map 변환 (실제 응답 필드 반영)
    private Map<String, Object> parseItem(JsonNode item) {
        Map<String, Object> map = new HashMap<>();

        map.put("orderPlanUntyNo", item.path("orderPlanUntyNo").asText());
        map.put("bizNm", item.path("bizNm").asText());
        map.put("orderInsttNm", item.path("orderInsttNm").asText());
        map.put("deptNm", item.path("deptNm").asText());
        map.put("ofclNm", item.path("ofclNm").asText());
        map.put("telNo", item.path("telNo").asText());
        map.put("bsnsTyNm", item.path("bsnsTyNm").asText());
        map.put("cntrctMthdNm", item.path("cntrctMthdNm").asText());
        map.put("prcrmntMethd", item.path("prcrmntMethd").asText());
        map.put("ntceNticeYn", item.path("ntceNticeYn").asText());
        map.put("nticeDt", item.path("nticeDt").asText());
        map.put("totlmngInsttNm", item.path("totlmngInsttNm").asText());

        // 금액 변환
        String amtStr = item.path("sumOrderAmt").asText();
        try {
            map.put("sumOrderAmt", Long.parseLong(amtStr.replaceAll("[^0-9]", "")));
        } catch (NumberFormatException e) {
            map.put("sumOrderAmt", 0L);
        }

        return map;
    }


    // 사용자 조회용
    public List<Map<String, Object>> getAllQuotes() {
        return quoteMapper.selectAll();
    }

    // 상세 조회
    public Map<String, Object> getQuoteDetail(String orderPlanUntyNo) {
        return quoteMapper.findByOrderPlanUntyNo(orderPlanUntyNo);
    }
    
    @Transactional
    public void deleteQuote(String orderPlanUntyNo) {
    	quoteMapper.deleteQuote(orderPlanUntyNo);
    }
}
