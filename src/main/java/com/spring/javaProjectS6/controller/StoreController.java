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
	public String goodsListGet(Model model, 
			@RequestParam(name="majorCatCode", defaultValue = "", required = false) String majorCatCode,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part) {
		ProductVO majorVO = storeService.getMajorCategorySearch(majorCatCode); 
		List<ProductVO> subVOS = storeService.getSubCategorySearch(); 
		
		List<ProductVO> prodVOS = storeService.getProductList(part); 
		
		model.addAttribute("majorVO", majorVO);
		model.addAttribute("subVOS", subVOS);
		model.addAttribute("part", part);
		model.addAttribute("prodVOS", prodVOS);
		
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
	
	@RequestMapping(value = "/goodsDetail", method = RequestMethod.POST)
	public String goodsDetailPost(HttpSession session, CartVO vo, String flag) {
		String mid = (String) session.getAttribute("sMid");
		
		int[] opIdxArray = new int[20];
		String[] strOpIdx = vo.getOpIdx().split(",");
		int cnt = 0;
		for(int i=0; i<strOpIdx.length; i++) {
			opIdxArray[i] = Integer.parseInt(strOpIdx[i]);
			cnt++;
		}

		int res = 0;
//		for(int opIdx : opIdxArray) {
			
		for(int i=0; i<cnt; i++) {
			List<CartVO> cartVOS = storeService.getCartSearch(vo.getProdIdx(), opIdxArray[i] , mid);
			if(cartVOS.size() != 0) {
				for(CartVO cartVO : cartVOS) {
					cartVO.setQuantity(cartVO.getQuantity() + vo.getQuantity());
					cartVO.setTotalPrice(cartVO.getTotalPrice() + vo.getTotalPrice());
					res = storeService.setCartUpdate(cartVO);
				}
			}
			else {
				System.out.println("vo" + vo);
				res = storeService.setCartInput(vo, opIdxArray[i]);
			}
		}
		
		System.out.println("res:" + res);
		
		if(res != 0) {
			if(flag.equals("order")) {
				return "redirect:/message/cartOrderOk";
			}
			else {
				return "redirect:/message/cartInputOk";
			}
		}
		else return "redirect:/message/cartOrderNo";
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
