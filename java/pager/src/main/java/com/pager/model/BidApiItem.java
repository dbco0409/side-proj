package com.pager.model;

import lombok.Data;

@Data
public class BidApiItem {

    // 기본 정보
    private String bidNtceNo;        // 입찰공고번호
    private String ntceNm;           // 요청명(공고명)
    private String cntrctMthdNm;     // 계약체결방법
    private String ntceDivNm;        // 공고종류
    private String bidMethdNm;       // 입찰방식
    private String sucsfbidMthdNm;   // 낙찰방식
    private String rgstDt;           // 등록일시
    private String opengDt;          // 개찰일시(공고게시일)
    private String bidClseDt;        // 입찰마감일시
    private String opengPlce;        // 개찰장소
    private String orderPlanUntyNo;  // 연계 사업 번호 (있을 경우)
    
    // 기관 / 담당자 정보
    private String ntceInsttNm;      // 공고 기관명
    private String ofclNm;           // 담당자명
    private String ofclTelNo;        // 담당자 연락처
    private String ofclEmail;        // 담당자 이메일

    // 공고문 파일 다운로드 URL 및 이름 (최대 9개)
    private String ntceSpecDocUrl1;
    private String ntceSpecDocNm1;
    private String ntceSpecDocUrl2;
    private String ntceSpecDocNm2;
    private String ntceSpecDocUrl3;
    private String ntceSpecDocNm3;
    private String ntceSpecDocUrl4;
    private String ntceSpecDocNm4;
    private String ntceSpecDocUrl5;
    private String ntceSpecDocNm5;
    private String ntceSpecDocUrl6;
    private String ntceSpecDocNm6;
    private String ntceSpecDocUrl7;
    private String ntceSpecDocNm7;
    private String ntceSpecDocUrl8;
    private String ntceSpecDocNm8;
    private String ntceSpecDocUrl9;
    private String ntceSpecDocNm9;

    // ✅ 추가로 API에서 자주 나오는 필드 (여유분)
    private String ntceKindNm;       // 공고 종류명 (예: 일반)
    private String rgstTyNm;         // 등록유형명
    private String bidNtceDt;        // 공고게시일시
    private String ntceInsttCd;      // 공고기관코드
    private String bidBeginDt;       // 입찰시작일시

    // ✅ 유틸: 다이나믹 필드 접근 (파일 루프에서 사용)
    public String getField(String fieldName) {
        try {
            return (String) this.getClass().getDeclaredField(fieldName).get(this);
        } catch (Exception e) {
            return null;
        }
    }
}
