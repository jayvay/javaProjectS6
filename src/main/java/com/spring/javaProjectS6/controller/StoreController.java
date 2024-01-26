package com.spring.javaProjectS6.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaProjectS6.service.StoreService;
import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.OrderVO;
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
		
		String[] strOpIdxArr = vo.getOpIdxArr().split(",");
		String[] strQuantityArr = vo.getQuantityArr().split(",");
		String[] strTotalPriceArr = vo.getTotalPriceArr().split(",");
		
		//int[] opIdxArray = new int[strOpIdxArr.length];
		List<CartVO> cartVOS = new ArrayList<>();
		for(int i=0; i<strOpIdxArr.length; i++) {
			CartVO cartVO = new CartVO();
			cartVO.setOpIdx(Integer.parseInt(strOpIdxArr[i]));
			cartVO.setQuantity(Integer.parseInt(strQuantityArr[i]));
			cartVO.setTotalPrice(Integer.parseInt(strTotalPriceArr[i])); //240126_2140 여기서 오류나고 끝
			cartVO.setMid(mid);
			cartVO.setProdIdx(vo.getProdIdx());
			cartVOS.add(cartVO);
		}
		
		
		//int cnt = 0;
		//for(int i=0; i<strOpIdxArr.length; i++) {
			//opIdxArray[i] = Integer.parseInt(strOpIdxArr[i]);
			//cnt++;
		//}

		int res = 0;
		//for( opIdx : opIdxArray) {
		for(int i=0; i<cartVOS.size(); i++) {
			//List<CartVO> cartVOS = storeService.getCartSearch(vo.getProdIdx(), opIdxArray[i] , mid);
			List<CartVO> existCartVOS = storeService.getCartSearch(vo.getProdIdx(), cartVOS.get(i).getOpIdx() , mid);
			if(existCartVOS.size() != 0) {
				for(CartVO existCartVO : existCartVOS) {
					existCartVO.setQuantity(existCartVO.getQuantity() + cartVOS.get(i).getQuantity());
					existCartVO.setTotalPrice(existCartVO.getTotalPrice() + cartVOS.get(i).getTotalPrice());
					res = storeService.setCartUpdate(existCartVO);
				}
			}
			else {
				res = storeService.setCartInput(cartVOS.get(i));
			}
		}
		
		if(res != 0) {
			if(flag.equals("order")) {
				return "redirect:/store/order";
			}
			else if(flag.equals("goCart")) {
				return "redirect:/store/cart";
			}
			else return "redirect:/store/goodsDetail";
		}
		else return "redirect:/message/cartInputNo";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<CartVO> cartVOS = storeService.getCartList(mid);
		
		if(cartVOS.size() == 0) {
			return "redirect:/message/cartEmpty";
		}
		model.addAttribute("cartVOS", cartVOS);
		return "store/cart";
	}

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartPost(HttpServletRequest request, HttpSession session, Model model,
			@RequestParam(name = "delivery", defaultValue = "0", required = false) int delivery) {
		String mid = (String) session.getAttribute("sMid");
		List<CartVO> cartVOS = storeService.getCartList(mid);
		
		//OrderVO maxIdx = storeService.getOrderMaxIdx();
		int idx = 1;
		//if(maxIdx != null) idx = maxIdx.getMaxIdx() + 1;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(date) + idx;
		
		if(cartVOS.size() == 0) {
			return "redirect:/message/cartEmpty";
		}
		model.addAttribute("cartVOS", cartVOS);
		return "store/cart";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<CartVO> cartVOS = storeService.getCartList(mid);
		
		//OrderVO maxIdx = storeService.getOrderMaxIdx();
		int idx = 1;
		//if(maxIdx != null) idx = maxIdx.getMaxIdx() + 1;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(date) + idx;
		
		if(cartVOS.size() == 0) {
			return "redirect:/message/cartEmpty";
		}
		model.addAttribute("cartVOS", cartVOS);
		return "store/cart";
	}
	
	
}
