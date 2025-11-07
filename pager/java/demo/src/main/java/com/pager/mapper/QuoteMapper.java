package com.pager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.pager.model.Quote;

@Mapper
public interface QuoteMapper {

	@Insert("""
        INSERT INTO quote_api_data (
            orderPlanUntyNo, bizNm, orderInsttNm, nticeDt, 
            sumOrderAmt, cntrctMthdNm, prcrmntMethd, deptNm, telNo
        ) VALUES (
            #{orderPlanUntyNo}, #{bizNm}, #{orderInsttNm}, #{nticeDt}, 
            #{sumOrderAmt}, #{cntrctMthdNm}, #{prcrmntMethd}, #{deptNm}, #{telNo}
        )
        ON DUPLICATE KEY UPDATE
            bizNm = VALUES(bizNm),
            orderInsttNm = VALUES(orderInsttNm),
            nticeDt = VALUES(nticeDt),
            sumOrderAmt = VALUES(sumOrderAmt),
            cntrctMthdNm = VALUES(cntrctMthdNm),
            prcrmntMethd = VALUES(prcrmntMethd),
            deptNm = VALUES(deptNm),
            telNo = VALUES(telNo)
    """)
    void upsert(Map<String, Object> item);

    @Select("SELECT * FROM quote_api_data ORDER BY nticeDt DESC")
    List<Map<String, Object>> selectAll();

    @Select("SELECT * FROM quote_api_data WHERE orderPlanUntyNo = #{orderPlanUntyNo}")
    Map<String, Object> findByOrderPlanUntyNo(String orderPlanUntyNo);

    // ✅ 4. 견적요청 단건 조회
    @Select("SELECT * FROM quote_api_data WHERE orderPlanUntyNo = #{orderPlanUntyNo}")
    Quote getQuote(Long id);

    // ✅ 5. 견적요청 전체 목록 조회
    @Select("SELECT * FROM quote_api_data ORDER BY nticeDt DESC")
    List<Quote> allQuoteList();
}
