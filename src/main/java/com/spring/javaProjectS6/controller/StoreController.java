package com.spring.javaProjectS6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/store")
public class StoreController {

	@RequestMapping(value = "/goodsList", method = RequestMethod.GET)
	public String goodsListGet() {
		return "store/goodsList";
	}

	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	public String goodsDetailGet(Model model, int idx) {
		
		//model.addAttribute("", );
		return "store/goodsDetail";
	}
	
	

}
