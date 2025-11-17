package com.pager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pager.model.Company;

@Mapper
public interface CompanyMapper {
	// ✅ 1. 입찰 등록
    @Insert("""
        INSERT INTO company 
            (no1, no2, title, company, status, category1, category2, category3, startTime, endTime, 
             name, tel, content, fileName1, file1, fileName2, file2, fileName3, file3)
        VALUES 
            (#{no1}, #{no2}, #{title}, #{company}, #{status}, #{category1}, #{category2}, #{category3}, 
             now(), #{endTime}, #{name}, #{tel}, #{content}, 
             #{fileName1}, #{file1}, #{fileName2}, #{file2}, #{fileName3}, #{file3})
    """)
    void insertCompany(Company company);

    // ✅ 2. 입찰 수정
    @Update("""
        UPDATE company
        SET no1 = #{no1},
            no2 = #{no2},
            title = #{title},
            company = #{company},
            status = #{status},
            category1 = #{category1},
            category2 = #{category2},
            category3 = #{category3},
            endTime = #{endTime},
            name = #{name},
            tel = #{tel},
            content = #{content},
            fileName1 = #{fileName1},
            file1 = #{file1},
            fileName2 = #{fileName2},
            file2 = #{file2},
            fileName3 = #{fileName3},
            file3 = #{file3}
        WHERE id = #{id}
    """)
    void updateCompany(Company company);

    // ✅ 3. 입찰 삭제
    @Delete("DELETE FROM company WHERE id = #{id}")
    void deleteCompany(Long id);

    // ✅ 4. 입찰 단건 조회
    @Select("SELECT * FROM company WHERE id = #{id}")
    Company getCompany(Long id);

    // ✅ 5. 입찰 전체 목록 조회
    @Select("SELECT * FROM company ORDER BY id DESC")
    List<Company> allCompanyList();

}
