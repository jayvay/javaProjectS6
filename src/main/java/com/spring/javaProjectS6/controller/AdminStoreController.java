package com.spring.javaProjectS6.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaProjectS6.service.AdminStoreService;
import com.spring.javaProjectS6.vo.ProductVO;

@Controller
@RequestMapping("/adminStore")
public class AdminStoreController {

	@Autowired
	AdminStoreService adminStoreService;
	
	
	@RequestMapping(value = "/storeCategory", method = RequestMethod.GET)
	public String storeCategoryGet(Model model) {
		List<ProductVO> majorCatVOS = adminStoreService.getMajorCategory();
		List<ProductVO> subCatVOS = adminStoreService.getSubCategory();
		
		model.addAttribute("majorCatVOS", majorCatVOS);
		model.addAttribute("subCatVOS", subCatVOS);
		model.addAttribute("adminFlag", "storeCategory");
		return "admin/admin";
	}
/*	
	@ResponseBody
	@RequestMapping(value = "/storeMajorCatInput", method = RequestMethod.POST)
	public String storeMajorCatInputPost(String majorCatCode, String majorCatName) {
		ProductVO productVO = adminStoreService.getMajorCatSearch(majorCatCode, majorCatName);
		
		if(productVO != null) return "0";
		
		int res = adminStoreService.setMajorCatInput(majorCatCode, majorCatName);
		return res + "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/categorySubInput", method=RequestMethod.POST)
	public String categorySubInputPost(ProductVO vo) {
		ProductVO productVO = adminStoreService.getSubCatSearch(vo);
		
		if(productVO != null) return "0";
		
		int res = adminStoreService.setSubCatInput(vo);	// 소분류항목 저장하기
		return res + "";
	}
*/
	@ResponseBody
	@RequestMapping(value = "/storeCategory/{category}/{query}", method=RequestMethod.POST)
	public String storeMajorCategoryPost(@PathVariable String category, @PathVariable String query, ProductVO vo) {
		ProductVO productVO;
		productVO = adminStoreService.getCategorySearch(category, vo);
		
		if(productVO != null) return "0";
		
		int res = 0;
		if(query.equals("input")) res = adminStoreService.setCategoryInput(category, vo);
		else if(query.equals("delete")) res = adminStoreService.setCategoryDelete(category, vo);
		return res + "";
	}
	
	
	@RequestMapping(value = "/storeProductInput", method = RequestMethod.GET)
	public String storeProductInputGet(Model model) {
		List<ProductVO> majorCatVOS = adminStoreService.getMajorCategory();
		
		model.addAttribute("majorCatVOS", majorCatVOS);
		model.addAttribute("adminFlag", "storeProductInput");
		return "admin/admin";
	}

	@ResponseBody
	@RequestMapping(value = "/major_subCatName", method = RequestMethod.POST)
	public List<ProductVO> major_subCatNamePost(String majorCatCode) {
		return adminStoreService.getUnderCatSearch(majorCatCode);
	}
	
	//관리자 상품 등록시 ckeditor 에 사진 첨부할 경우 dbShop 폴더에 저장, 저장한 파일을 브라우저 textarea 상자에 보여준다
	@ResponseBody
	@RequestMapping("/detailImgUpload")
	public void detailImgUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFileName = upload.getOriginalFilename();
		System.out.println("originalFileName:"+originalFileName);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFileName = sdf.format(date) + "_" + originalFileName;
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/store/");
		byte[] bytes = upload.getBytes();
		OutputStream fos = new FileOutputStream(new File(uploadPath + originalFileName));
		fos.write(bytes);
		
		//사진 미리보기
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/store/" + originalFileName;
		out.println("{\"originalFilename\":\""+originalFileName+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();
		fos.close();
	}
	
	@RequestMapping(value = "/storeProductInput", method = RequestMethod.POST)
	public String storeProductInputPost(MultipartFile file, ProductVO vo) {
		int res = adminStoreService.setProductInput(file, vo);
		
		if(res != 0) return "redirect:/message/productInputOk";
		return "redirect:/message/productInputNo";
	}
	
	@RequestMapping(value = "/storeProductOptionInput", method = RequestMethod.GET)
	public String storeProductOptionInput(Model model) {
		model.addAttribute("adminFlag", "storeProductOptionInput");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/storeProductList", method = RequestMethod.GET)
	public String storeProductList(Model model) {
		model.addAttribute("adminFlag", "storeProductList");
		return "admin/admin";
	}
}
