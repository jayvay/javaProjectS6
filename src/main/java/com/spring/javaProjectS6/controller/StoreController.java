package com.spring.javaProjectS6.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS6.service.StoreService;
import com.spring.javaProjectS6.vo.CartVO;
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
	public String goodsDetailGet(Model model, @RequestParam(name="prodIdx", defaultValue = "0") int prodIdx) {
		ProductVO prodVO = storeService.getProductSearch(prodIdx);
		List<ProductVO> opVOS = storeService.getProdOptionSearch(prodIdx);
		
		model.addAttribute("prodVO", prodVO);
		model.addAttribute("opVOS", opVOS);
		return "store/goodsDetail";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartGet(HttpSession session, CartVO vo, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<CartVO> cartVOS = storeService.getCartList(mid);
		
		if(cartVOS.size() == 0) {
			return "redirect:/message/cartEmpty";
		}
		
		model.addAttribute("cartVOS", cartVOS);
		return "store/cart";
	}

}
