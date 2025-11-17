package com.pager.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pager.mapper.ShopMapper;
import com.pager.model.Shop;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ShopService {

    private final ShopMapper shopMapper;

    // ✅ 파일 저장 경로 (실제 경로에 맞게 수정하세요)
    private static final String UPLOAD_DIR = "C:/upload/shop/";

    // ✅ 1. 상품 등록
    public void insertShop(Shop shop, MultipartFile thumbFile, List<MultipartFile> editorFiles) {
        try {
            // 🖼️ 썸네일 파일 저장
            if (thumbFile != null && !thumbFile.isEmpty()) {
                String savedThumb = saveFile(thumbFile, "thumb");
                shop.setThumb(savedThumb);
            }

            // 📝 에디터 파일 저장 (선택)
            if (editorFiles != null && !editorFiles.isEmpty()) {
                StringBuilder contentImages = new StringBuilder(shop.getContent() != null ? shop.getContent() : "");
                for (MultipartFile file : editorFiles) {
                    String savedPath = saveFile(file, "content");
                    contentImages.append("<img src='/upload/shop/content/").append(savedPath).append("' />");
                }
                shop.setContent(contentImages.toString());
            }

            // 💾 DB 등록
            shopMapper.insertShop(shop);

        } catch (IOException e) {
            throw new RuntimeException("파일 업로드 중 오류 발생", e);
        }
    }

    // ✅ 2. 상품 수정
    public void updateShop(Shop shop, MultipartFile thumbFile, List<MultipartFile> editorFiles) {
        try {
            // 썸네일 변경 시
            if (thumbFile != null && !thumbFile.isEmpty()) {
                String savedThumb = saveFile(thumbFile, "thumb");
                shop.setThumb(savedThumb);
            }

            // 에디터 파일 추가 시
            if (editorFiles != null && !editorFiles.isEmpty()) {
                StringBuilder contentImages = new StringBuilder(shop.getContent() != null ? shop.getContent() : "");
                for (MultipartFile file : editorFiles) {
                    String savedPath = saveFile(file, "content");
                    contentImages.append("<img src='/upload/shop/content/").append(savedPath).append("' />");
                }
                shop.setContent(contentImages.toString());
            }

            shopMapper.updateShop(shop);

        } catch (IOException e) {
            throw new RuntimeException("파일 업로드 중 오류 발생", e);
        }
    }
    
    public void deleteThumb(Shop shop) {
        try {
            if (shop.getThumb() != null) {
                File file = new File("C:/upload/shop/thumb/" + shop.getThumb());
                if (file.exists()) file.delete();
            }
            shop.setThumb(null);
            shopMapper.updateShop(shop);
        } catch (Exception e) {
            throw new RuntimeException("썸네일 삭제 중 오류 발생", e);
        }
    }


    // ✅ 3. 상품 삭제
    public void deleteShop(Long id) {
        shopMapper.deleteShop(id);
    }

    // ✅ 4. 단일 상품 조회
    @Transactional(readOnly = true)
    public Shop getShop(Long id) {
        return shopMapper.getShop(id);
    }
    
    // ✅ 5. 메인 상품 목록
    @Transactional(readOnly = true)
    public List<Shop> getShopHotList() {
        return shopMapper.getShopHotList();
    }
    
    // ✅ 5. 전체 상품 목록
    @Transactional(readOnly = true)
    public List<Shop> getShopList() {
        return shopMapper.getShopList();
    }
    
    // ✅ 6. 조건 검색 (카테고리 + 가격 필터)
    @Transactional(readOnly = true)
    public List<Shop> filterShops(String category1, String category2,
            int minPrice, int maxPrice, String search_txt) {

		if ((search_txt == null || search_txt.isBlank())
		&& (category1 == null || category1.isBlank())
		&& (category2 == null || category2.isBlank())) 
		{
		return shopMapper.findByPrice(minPrice, maxPrice);
		}
		
		if (search_txt != null && !search_txt.isBlank()) {
		return shopMapper.search(minPrice, maxPrice, category1, category2, search_txt);
		}
		
		return shopMapper.simpleFilter(minPrice, maxPrice, category1, category2);
	}


    // ✅ 파일 저장 로직
    private String saveFile(MultipartFile file, String type) throws IOException {
        String dir = UPLOAD_DIR + type + "/";
        Path uploadPath = Paths.get(dir);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        String originalName = file.getOriginalFilename();
        String ext = originalName.substring(originalName.lastIndexOf("."));
        String savedName = UUID.randomUUID() + ext;

        Path savePath = uploadPath.resolve(savedName);
        file.transferTo(savePath.toFile());

        return savedName;
    }
}
