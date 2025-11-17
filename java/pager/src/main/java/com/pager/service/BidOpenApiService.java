package com.pager.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pager.mapper.BidMapper;
import com.pager.model.BidApiItem;

import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
    @Scheduled(cron = "0 0 9 * * *")
    public void syncBidDataDaily() {
        System.out.println("🔄 [BidSync] 입찰정보 동기화 시작 " + new Date());
        List<String> keywords = List.of("웹", "홈페이지", "앱", "web", "모바일","사이트", "게임","프론트엔드","백엔드","java","php","퍼블리싱");

        for (String keyword : keywords) {
            List<BidApiItem> list = fetchByKeyword(keyword, 1, 100);

            for (BidApiItem item : list) {
                Map<String, Object> map = new HashMap<>();
                map.put("bidNtceNo", item.getBidNtceNo());
                map.put("cntrctMthdNm", item.getCntrctMthdNm());
                map.put("rgstDt", item.getRgstDt());
                map.put("ntceNm", item.getNtceNm());
                map.put("ntceDivNm", item.getNtceDivNm());
                map.put("bidMethdNm", item.getBidMethdNm());
                map.put("sucsfbidMthdNm", item.getSucsfbidMthdNm());
                map.put("ntceInsttNm", item.getNtceInsttNm());
                map.put("ofclNm", item.getOfclNm());
                map.put("ofclTelNo", item.getOfclTelNo());
                map.put("ofclEmail", item.getOfclEmail());

                // ✅ 공고문 파일 정보 (1~9)
                for (int i = 1; i <= 9; i++) {
                    map.put("ntceSpecDocUrl" + i, item.getField("ntceSpecDocUrl" + i));
                    map.put("ntceSpecDocNm" + i, item.getField("ntceSpecDocNm" + i));
                }

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

        // ✅ 기본 정보
        it.setBidNtceNo(n.path("bidNtceNo").asText(""));        // 입찰공고번호
        it.setNtceNm(n.path("ntceNm").asText(""));              // 요청명(공고명)
        it.setCntrctMthdNm(n.path("cntrctMthdNm").asText(""));  // 계약체결방법
        it.setNtceDivNm(n.path("ntceDivNm").asText(""));        // 공고종류
        it.setBidMethdNm(n.path("bidMethdNm").asText(""));      // 입찰방식
        it.setSucsfbidMthdNm(n.path("sucsfbidMthdNm").asText("")); // 낙찰방식
        it.setRgstDt(n.path("rgstDt").asText(""));              // 등록일시
        it.setOpengDt(n.path("opengDt").asText(""));            // 개찰일시
        it.setBidClseDt(n.path("bidClseDt").asText(""));        // 입찰마감일시
        it.setOpengPlce(n.path("opengPlce").asText(""));        // 개찰장소
        it.setOrderPlanUntyNo(n.path("orderPlanUntyNo").asText("")); // 사업계획번호

        // ✅ 기관 / 담당자 정보
        it.setNtceInsttNm(n.path("ntceInsttNm").asText(""));    // 공고기관명
        it.setOfclNm(n.path("ofclNm").asText(""));              // 담당자명
        it.setOfclTelNo(n.path("ofclTelNo").asText(""));        // 담당자연락처
        it.setOfclEmail(n.path("ofclEmail").asText(""));        // 담당자이메일

        // ✅ 공고문 파일 (최대 9개)
        for (int i = 1; i <= 9; i++) {
            String urlKey = "ntceSpecDocUrl" + i;
            String nmKey = "ntceSpecDocNm" + i;

            try {
                var urlField = BidApiItem.class.getDeclaredField(urlKey);
                var nmField = BidApiItem.class.getDeclaredField(nmKey);
                urlField.setAccessible(true);
                nmField.setAccessible(true);
                urlField.set(it, n.path(urlKey).asText(""));
                nmField.set(it, n.path(nmKey).asText(""));
            } catch (Exception ignored) {}
        }

        // ✅ 기타 필드 (API에 따라 존재할 수도 있음)
        it.setNtceKindNm(n.path("ntceKindNm").asText(""));
        it.setRgstTyNm(n.path("rgstTyNm").asText(""));
        it.setBidNtceDt(n.path("bidNtceDt").asText(""));
        it.setBidBeginDt(n.path("bidBeginDt").asText(""));
        it.setNtceInsttCd(n.path("ntceInsttCd").asText(""));

        return it;
    }
    
    @Transactional
    public void deleteBid(String bidNtceNo) {
        bidMapper.deleteBid(bidNtceNo);
    }

}
