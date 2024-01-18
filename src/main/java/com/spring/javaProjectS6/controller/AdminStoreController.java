package com.spring.javaProjectS6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/storeCategory", method = RequestMethod.POST)
	public String storeCategoryPost(Model model) {
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/storeProductInput", method = RequestMethod.GET)
	public String storeProductInput(Model model) {
		model.addAttribute("adminFlag", "storeProductInput");
		return "admin/admin";
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
