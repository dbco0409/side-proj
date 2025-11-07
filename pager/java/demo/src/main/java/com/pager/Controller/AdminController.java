package com.pager.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pager.model.Company;
import com.pager.model.News;
import com.pager.model.Shop;
import com.pager.model.User;
import com.pager.model.Qna;
import com.pager.service.CompanyService;
import com.pager.service.NewsService;
import com.pager.service.QnaService;
import com.pager.service.ShopService;
import com.pager.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private final UserService userService;
	private final NewsService newsService;
	private final ShopService shopService;
	private final CompanyService companyService;
	private final QnaService qnaService;
	
	@GetMapping("/main")
	public String adminMethod(Model model, HttpSession session) {
    	
		User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) return "redirect:/login";
        if (!"admin@naver.com".equals(loginUser.getMbId())) return "redirect:/";
        
        model.addAttribute("mbId", loginUser.getMbId());
        model.addAttribute("mbName", loginUser.getMbName());
        
		return "/admin/index";
	}
	
	@PostMapping("/main")
	@ResponseBody
	public Map<String, Object> edit(
	        @RequestParam String mbId,
	        @RequestParam String mbPassword,
	        @RequestParam String mbPasswordRe,
	        @RequestParam String mbName,
	        HttpSession session) {

	    Map<String, Object> result = new HashMap<>();

	    User loginUser = (User) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        result.put("success", false);
	        result.put("message", "로그인이 필요합니다.");
	        return result;
	    }

	    User user = userService.getByMbId(mbId);
	    if (user == null) {
	        result.put("success", false);
	        result.put("message", "회원 정보를 찾을 수 없습니다.");
	        return result;
	    }

	    if (!mbPassword.equals(mbPasswordRe)) {
	        result.put("success", false);
	        result.put("message", "비밀번호가 일치하지 않습니다.");
	        return result;
	    }

	    // DB 업데이트
	    user.setMbId(mbId);
	    user.setMbName(mbName);
	    user.setMbPassword(userService.encodePassword(mbPassword));
	    userService.updateUser(user);
	    userService.updatePassword(user);

	    session.setAttribute("loginUser", user);

	    result.put("success", true);
	    result.put("message", "관리자정보가 수정되었습니다.");
	    return result;
	}
	
	
	/* 이벤트 관리*/
	
	@GetMapping("/news/add")
    public String getAddNews(Model model) {
		model.addAttribute("news", new News());
        return "admin/news_view";
    }
	
	@PostMapping("/news/add")
    public String addNews(News news) {
		newsService.insertNews(news);
        return "redirect:/admin/news/list"; // 등록 후 리스트 페이지로 이동
    }
	
	@GetMapping("/news/edit/{id}")
    public String getNews(@PathVariable Long id, Model model) {
    	News news = newsService.getNews(id);
        model.addAttribute("news", news);
        return "admin/news_view";
    }
	
	@GetMapping("/news/delete/{id}")
    public String deleteNews(@PathVariable Long id) {
		newsService.deleteNews(id);
        return "redirect:/admin/news/list"; 
    }
	
	@PostMapping("/news/edit/")
    public String editCompany(News news) {
		newsService.updateNews(news);
        return "redirect:/admin/news/list"; // 등록 후 리스트 페이지로 이동
    }
    
    @GetMapping("/news/list")
    public String list(Model model) {
        List<News> news = newsService.getNewsList();
        model.addAttribute("news", news);
        return "admin/news"; 
    }
    
    @GetMapping("/shop/add")
    public String addForm(Model model) {
        model.addAttribute("shop", new Shop());
        return "admin/product_view"; // → templates/shop_add.html
    }
    
    @PostMapping("/shop/add")
    public String addShop(
            @ModelAttribute Shop shop,
            @RequestParam(required = false) MultipartFile thumbFile,
            @RequestParam(required = false) List<MultipartFile> editorFiles) {

        shopService.insertShop(shop, thumbFile, editorFiles);
        return "redirect:/admin/shop/list";
    }

    // ✅ 3. 상품 수정 페이지 이동
    @GetMapping("/shop/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        Shop shop = shopService.getShop(id);
        model.addAttribute("shop", shop);
        return "admin/product_view"; // → templates/shop_edit.html
    }

    // ✅ 4. 상품 수정 처리
    @PostMapping("/shop/edit/{id}")
    public String editShop(
            @PathVariable Long id,
            @ModelAttribute Shop shop,
            @RequestParam(required = false) MultipartFile thumbFile,
            @RequestParam(required = false) List<MultipartFile> editorFiles,
            @RequestParam(required = false) String deleteThumb) {

        shop.setId(id);

        // ✅ 썸네일 삭제 요청이 있는 경우 처리
        if ("true".equals(deleteThumb)) {
            shopService.deleteThumb(shop);
        }

        // ✅ 수정 로직 실행
        shopService.updateShop(shop, thumbFile, editorFiles);

        return "redirect:/admin/shop/edit/" + id;
    }


    // ✅ 6. 상품 목록 보기
    @GetMapping("/shop/list")
    public String listShop(Model model) {
        List<Shop> shops = shopService.getShopList();
        model.addAttribute("shops", shops);
        return "admin/product_list"; // → templates/shop_list.html
    }
    
 // ✅ 7. 상품 삭제
    @GetMapping("/shop/delete/{id}")
    public String deleteShop(@PathVariable Long id) {
        shopService.deleteShop(id);
        return "redirect:/shop/list";
    }
    
    @PostMapping("/shop/delete-image")
    @ResponseBody
    public Map<String, Object> deleteEditorImage(@RequestBody Map<String, String> data) {
        Map<String, Object> result = new HashMap<>();
        try {
            String imageUrl = data.get("url"); // 예: "/upload/editor/1731065452_image.png"
            if (imageUrl != null && imageUrl.startsWith("/upload/editor/")) {
                String path = "C:/upload" + imageUrl.replace("/upload", "");
                File file = new File(path);
                if (file.exists()) file.delete();
            }
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
        }
        return result;
    }

    
    @PostMapping("/shop/upload")
    @ResponseBody
    public Map<String, Object> uploadEditorImage(@RequestParam MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        try {
            String uploadDir = "C:/upload/editor/";
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File dest = new File(uploadDir + fileName);
            file.transferTo(dest);

            result.put("url", "/upload/editor/" + fileName);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
        }
        return result;
    }
    
    @GetMapping("/company/list")
    public String listCompany(Model model) {
        List<Company> companys = companyService.allCompanyList();
        model.addAttribute("companys", companys);
        return "admin/company_list"; // ✅ quote.html 렌더링
    }
    
    @GetMapping("/company/add")
    public String addCompanyForm(Model model) {
        model.addAttribute("company", new Company());
        return "admin/company_view"; // → templates/shop_add.html
    }
    
    @PostMapping("/company/add")
    public String addCompany(Company company) {
		companyService.insertBid(company);
        return "redirect:/admin/company/list"; // 등록 후 리스트 페이지로 이동
    }

    // ✅ 단일 견적 조회
    @GetMapping("/company/edit/{id}")
    public String getCompany(@PathVariable Long id, Model model) {
    	Company company = companyService.getCompany(id);
        model.addAttribute("company", company);
        return "admin/company_view"; // bid_view.html 로 이동
    }
    
    @GetMapping("/qna/list")
    public String Qnalist(Model model) {
        List<Qna> qna = qnaService.getQnaList();
        model.addAttribute("qna", qna);
        return "admin/qna"; 
    }

    // ✅ 단일 견적 조회
    @GetMapping("/qna/view/{id}")
    public String getQna(@PathVariable Long id, Model model) {
    	Qna qna = qnaService.getQna(id);
        model.addAttribute("qna", qna);
        return "admin/qna_view"; // bid_view.html 로 이동
    }
    
    @GetMapping("/qna/delete/{id}")
    public String deleteQnA(@PathVariable Long id) {
    	qnaService.deleteQna(id);
        return "redirect:/admin/qna/list";
    }
    
}
