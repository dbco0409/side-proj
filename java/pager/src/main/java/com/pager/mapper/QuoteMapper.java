package com.pager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.pager.model.Quote;

@Mapper
public interface QuoteMapper {

	@Insert("""
		    INSERT INTO quote_api_data (
		        order_plan_unty_no, biz_nm, order_instt_nm, dept_nm, tel_no,
		        ofcl_nm, ntice_dt, bsns_ty_nm, cntrct_mthd_nm, prcrmnt_methd,
		        ntce_ntice_yn, sum_order_amt
		    ) VALUES (
		        #{orderPlanUntyNo}, #{bizNm}, #{orderInsttNm}, #{deptNm}, #{telNo},
		        #{ofclNm}, #{nticeDt}, #{bsnsTyNm}, #{cntrctMthdNm}, #{prcrmntMethd},
		        #{ntceNticeYn}, #{sumOrderAmt}
		    )
		    ON DUPLICATE KEY UPDATE
		        biz_nm = VALUES(biz_nm),
		        order_instt_nm = VALUES(order_instt_nm),
		        dept_nm = VALUES(dept_nm),
		        tel_no = VALUES(tel_no),
		        ofcl_nm = VALUES(ofcl_nm),
		        ntice_dt = VALUES(ntice_dt),
		        bsns_ty_nm = VALUES(bsns_ty_nm),
		        cntrct_mthd_nm = VALUES(cntrct_mthd_nm),
		        prcrmnt_methd = VALUES(prcrmnt_methd),
		        ntce_ntice_yn = VALUES(ntce_ntice_yn),
		        sum_order_amt = VALUES(sum_order_amt)
		""")
	void upsert(Map<String, Object> item);


    @Select("SELECT * FROM quote_api_data ORDER BY ntice_dt DESC")
    List<Map<String, Object>> selectAll();

    @Select("SELECT * FROM quote_api_data WHERE order_plan_unty_no = #{orderPlanUntyNo}")
    Map<String, Object> findByOrderPlanUntyNo(String orderPlanUntyNo);

    // 견적요청 단건 조회
    @Select("SELECT * FROM quote_api_data WHERE order_plan_unty_no = #{orderPlanUntyNo}")
    Quote getQuote(String orderPlanUntyNo);

    // 견적요청 전체 목록 조회
    @Select("SELECT * FROM quote_api_data ORDER BY ntice_dt DESC")
    List<Quote> allQuoteList();
    
    @Delete("DELETE FROM quote_api_data WHERE order_plan_unty_no = #{orderPlanUntyNo}")
    void deleteQuote(String orderPlanUntyNo);
}
