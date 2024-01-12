package com.spring.javaProjectS6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS6.service.StoreService;
import com.spring.javaProjectS6.vo.ProductVO;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	StoreService storeService; 
	
	@RequestMapping(value = "/goodsList", method = RequestMethod.GET)
	public String goodsListGet() {
		return "store/goodsList";
	}

	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	public String goodsDetailGet(Model model, int prdIdx) {
		ProductVO prdVO = storeService.getProductSearch(prdIdx);
		List<ProductVO> opVOS = storeService.getPrdOptionSearch(prdIdx);
		
		model.addAttribute("prdVO", prdVO);
		model.addAttribute("opVOS", opVOS);
		return "store/goodsDetail";
	}
	
	

}
