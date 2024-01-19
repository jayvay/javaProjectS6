package com.spring.javaProjectS6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/storeProductOptionInput", method = RequestMethod.GET)	//240119_2140 하..오늘은..여기까지..
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
