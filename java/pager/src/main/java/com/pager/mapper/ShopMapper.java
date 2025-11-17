package com.pager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.pager.model.Shop;

@Mapper
public interface ShopMapper {

    // ✅ 1. 상품 등록
    @Insert("""
        INSERT INTO shop 
            (title, price, delivery_price, total_price, category1, category2, company, content, thumb, created_at, url)
        VALUES 
            (#{title}, #{price}, #{delivery_price}, #{total_price}, #{category1}, #{category2}, #{company}, #{content}, #{thumb}, NOW(), #{url})
    """)
    void insertShop(Shop shop);

    // ✅ 2. 상품 수정
    @Update("""
        UPDATE shop
        SET title = #{title},
            price = #{price},
            delivery_price = #{delivery_price},
            total_price = #{total_price},
            category1 = #{category1},
            category2 = #{category2},
            company = #{company},
            content = #{content},
            thumb = #{thumb},
            updated_at = NOW(),
            url = #{url}
        WHERE id = #{id}
    """)
    void updateShop(Shop shop);

    // ✅ 3. 조건 필터 검색 (카테고리 + 가격)
    @Select("""
	    SELECT * FROM shop
	    WHERE price BETWEEN #{min} AND #{max}
	    ORDER BY hot desc, id DESC
	""")
	List<Shop> findByPrice(int min, int max);

    @Select("""
    	    SELECT *
    	    FROM shop
    	    WHERE price BETWEEN #{minPrice} AND #{maxPrice}
    	      AND (#{category1} IS NULL OR #{category1} = '' OR category1 = #{category1})
    	      AND (#{category2} IS NULL OR #{category2} = '' OR category2 = #{category2})
    	    ORDER BY hot DESC, id DESC
    """)
    List<Shop> simpleFilter(int minPrice, int maxPrice, String category1, String category2);

    @Select("""
    	    SELECT *
    	    FROM shop
    	    WHERE price BETWEEN #{minPrice} AND #{maxPrice}
    	      AND (#{category1} IS NULL OR #{category1} = '' OR category1 = #{category1})
    	      AND (#{category2} IS NULL OR #{category2} = '' OR category2 = #{category2})
    	      AND (
    	          title LIKE CONCAT('%', #{keyword}, '%')
    	          OR company LIKE CONCAT('%', #{keyword}, '%')
    	      )
    	    ORDER BY hot DESC, id DESC
	""")
	List<Shop> search(int minPrice, int maxPrice, String category1, String category2, String keyword);



    // ✅ 4. 상품 삭제
    @Delete("DELETE FROM shop WHERE id = #{id}")
    void deleteShop(Long id);

    // ✅ 5. 상품 단건 조회
    @Select("SELECT * FROM shop WHERE id = #{id}")
    Shop getShop(Long id);

    // ✅ 6. 전체 목록
    @Select("SELECT * FROM shop ORDER BY hot desc, id DESC")
    List<Shop> getShopList();
    
    @Select("SELECT * FROM shop where hot = 1 ORDER BY id DESC")
	List<Shop> getShopHotList();
}
