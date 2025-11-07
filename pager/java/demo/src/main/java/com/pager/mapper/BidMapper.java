package com.pager.mapper;

import org.apache.ibatis.annotations.*;
import java.util.*;

@Mapper
public interface BidMapper {

    @Insert("""
        INSERT INTO tb_bid_info (
            bid_ntce_no, ntce_nm, openg_plce, openg_dt, 
            cntrct_mthd_nm, sucsfbid_mthd_nm
        ) VALUES (
            #{bidNtceNo}, #{ntceNm}, #{opengPlce}, #{opengDt}, 
            #{cntrctMthdNm}, #{sucsfbidMthdNm}
        )
        ON DUPLICATE KEY UPDATE 
            ntce_nm = VALUES(ntce_nm),
            openg_plce = VALUES(openg_plce),
            openg_dt = VALUES(openg_dt),
            cntrct_mthd_nm = VALUES(cntrct_mthd_nm),
            sucsfbid_mthd_nm = VALUES(sucsfbid_mthd_nm)
    """)
    void upsert(Map<String, Object> item);

    @Select("SELECT * FROM tb_bid_info ORDER BY openg_dt DESC")
    List<Map<String, Object>> selectAll();

    @Select("SELECT * FROM tb_bid_info WHERE bid_ntce_no = #{bidNtceNo}")
    Map<String, Object> selectByBidNo(String bidNtceNo);
}
