package com.pager.mapper;

import org.apache.ibatis.annotations.*;
import java.util.*;

@Mapper
public interface BidMapper {

	@Insert("""
	        INSERT INTO tb_bid_info (
	            bid_ntce_no, cntrct_mthd_nm, rgst_dt, ntce_nm, 
	            ntce_div_nm, bid_methd_nm, sucsfbid_mthd_nm,
	            ntce_instt_nm, ofcl_nm, ofcl_tel_no, ofcl_email,
	            ntce_spec_doc_url1, ntce_spec_doc_nm1,
	            ntce_spec_doc_url2, ntce_spec_doc_nm2,
	            ntce_spec_doc_url3, ntce_spec_doc_nm3,
	            ntce_spec_doc_url4, ntce_spec_doc_nm4,
	            ntce_spec_doc_url5, ntce_spec_doc_nm5,
	            ntce_spec_doc_url6, ntce_spec_doc_nm6,
	            ntce_spec_doc_url7, ntce_spec_doc_nm7,
	            ntce_spec_doc_url8, ntce_spec_doc_nm8,
	            ntce_spec_doc_url9, ntce_spec_doc_nm9
	        ) VALUES (
	            #{bidNtceNo}, #{cntrctMthdNm}, #{rgstDt}, #{ntceNm},
	            #{ntceDivNm}, #{bidMethdNm}, #{sucsfbidMthdNm},
	            #{ntceInsttNm}, #{ofclNm}, #{ofclTelNo}, #{ofclEmail},
	            #{ntceSpecDocUrl1}, #{ntceSpecDocNm1},
	            #{ntceSpecDocUrl2}, #{ntceSpecDocNm2},
	            #{ntceSpecDocUrl3}, #{ntceSpecDocNm3},
	            #{ntceSpecDocUrl4}, #{ntceSpecDocNm4},
	            #{ntceSpecDocUrl5}, #{ntceSpecDocNm5},
	            #{ntceSpecDocUrl6}, #{ntceSpecDocNm6},
	            #{ntceSpecDocUrl7}, #{ntceSpecDocNm7},
	            #{ntceSpecDocUrl8}, #{ntceSpecDocNm8},
	            #{ntceSpecDocUrl9}, #{ntceSpecDocNm9}
	        )
	        ON DUPLICATE KEY UPDATE
	            cntrct_mthd_nm = VALUES(cntrct_mthd_nm),
	            rgst_dt = VALUES(rgst_dt),
	            ntce_nm = VALUES(ntce_nm),
	            ntce_div_nm = VALUES(ntce_div_nm),
	            bid_methd_nm = VALUES(bid_methd_nm),
	            sucsfbid_mthd_nm = VALUES(sucsfbid_mthd_nm),
	            ntce_instt_nm = VALUES(ntce_instt_nm),
	            ofcl_nm = VALUES(ofcl_nm),
	            ofcl_tel_no = VALUES(ofcl_tel_no),
	            ofcl_email = VALUES(ofcl_email)
	    """)
	    void upsert(Map<String, Object> item);

    @Select("SELECT * FROM tb_bid_info ORDER BY reg_date DESC")
    List<Map<String, Object>> selectAll();

    @Select("SELECT * FROM tb_bid_info WHERE bid_ntce_no = #{bidNtceNo}")
    Map<String, Object> selectByBidNo(String bidNtceNo);
    
    @Delete("DELETE FROM tb_bid_info WHERE bid_ntce_no = #{bidNtceNo}")
    void deleteBid(String bidNtceNo);
}
