package com.spring.javaProjectS6.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaProjectS6.service.MemberService;
import com.spring.javaProjectS6.service.StoreService;
import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.DeliveryVO;
import com.spring.javaProjectS6.vo.MemberVO;
import com.spring.javaProjectS6.vo.OrderVO;
import com.spring.javaProjectS6.vo.PaymentVO;
import com.spring.javaProjectS6.vo.ProductVO;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	StoreService storeService; 
	
	@Autowired
	MemberService memberService;
	
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
		String[] strOpTotalPriceArr = vo.getOpTotalPriceArr().split(",");
		System.out.println("vo.getOpIdxArr() : "+ vo.getOpIdxArr());
		System.out.println("vo.getQuantityArr() : "+ vo.getQuantityArr());
		System.out.println("vo.getOpTotalPriceArr() : "+ vo.getOpTotalPriceArr());
		
		//int[] opIdxArray = new int[strOpIdxArr.length];
		List<CartVO> cartVOS = new ArrayList<>();
		for(int i=0; i<strOpIdxArr.length; i++) {
			CartVO cartVO = new CartVO();
			cartVO.setOpIdx(Integer.parseInt(strOpIdxArr[i]));
			cartVO.setQuantity(Integer.parseInt(strQuantityArr[i]));
			cartVO.setOpTotalPrice(Integer.parseInt(strOpTotalPriceArr[i]));
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
					existCartVO.setOpTotalPrice(existCartVO.getOpTotalPrice() + cartVOS.get(i).getOpTotalPrice());
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
	
	@ResponseBody
	@RequestMapping(value = "/cartDelete", method = RequestMethod.POST)
	public String cartDeletePost(int cIdx) {
		storeService.setCartDelete(cIdx);
		return "1";
	}

	@RequestMapping(value = "/buyNow", method = RequestMethod.POST)
	public String buyNowPost(HttpSession session, CartVO vo, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		//주문번호 만들기
		OrderVO maxIdx = storeService.getOrderMaxIdx();
		int oIdx = 1;
		if(maxIdx != null) oIdx = maxIdx.getMaxOIdx() + 1;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(date) + oIdx;
		
		//주문 옵션 하나씩 저장하기
		String[] strOpIdxArr = vo.getOpIdxArr().split(",");
		String[] strQuantityArr = vo.getQuantityArr().split(",");
		String[] strOpTotalPriceArr = vo.getOpTotalPriceArr().split(",");
		
		int totalPrice = 0;
		for(int i=0; i<strOpTotalPriceArr.length; i++) {
			totalPrice += Integer.parseInt(strOpTotalPriceArr[i]);
		}
		
		ProductVO prodVO = storeService.getProductSearch(vo.getProdIdx());
		List<ProductVO> opVOS = storeService.getProdOptionSearch(vo.getProdIdx());
		
		List<OrderVO> orderVOS = new ArrayList<>();
		for(int i=0; i<strOpIdxArr.length; i++) {
			OrderVO orderVO = new OrderVO();
			orderVO.setOpIdx(Integer.parseInt(strOpIdxArr[i]));
			orderVO.setQuantity(Integer.parseInt(strQuantityArr[i]));
			orderVO.setOpTotalPrice(Integer.parseInt(strOpTotalPriceArr[i]));
			orderVO.setOrderIdx(orderIdx);
			orderVO.setMid(mid);
			orderVO.setProdIdx(vo.getProdIdx());
			orderVO.setProdName(prodVO.getProdName());
			orderVO.setProdPrice(prodVO.getProdPrice());
			orderVO.setProdFSName(prodVO.getProdFSName());
			orderVO.setTotalPrice(totalPrice);
			
			if(totalPrice >= 50000) orderVO.setDelivCharge(0);
			else orderVO.setDelivCharge(2500);
			orderVO.setPayPrice(totalPrice + orderVO.getDelivCharge());
			
			for(int j=0; j<opVOS.size(); j++) {
				if(opVOS.get(j).getOpIdx() == Integer.parseInt(strOpIdxArr[i])) {
					orderVO.setOpName(opVOS.get(j).getOpName());
					orderVO.setOpPrice(opVOS.get(j).getOpPrice());
				}	
			}
			orderVOS.add(orderVO);
		}
		session.setAttribute("sOrderVOS", orderVOS);
		
		MemberVO memberVO = memberService.getMemberIdSearch(mid);
		model.addAttribute("memberVO", memberVO);
		
		return "store/order";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderPost(HttpSession session, HttpServletRequest request, Model model,
			@RequestParam(name="totalPrice", defaultValue="0", required=false) int totalPrice,
			@RequestParam(name="payPrice", defaultValue="0", required=false) int payPrice,
			@RequestParam(name="delivCharge", defaultValue="0", required=false) int delivCharge) {
		String mid = (String) session.getAttribute("sMid");
		
		OrderVO maxIdx = storeService.getOrderMaxIdx();
		int oIdx = 1;
		if(maxIdx != null) oIdx = maxIdx.getMaxOIdx() + 1;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(date) + oIdx;
		
		//주문 옵션 하나씩 저장하기
		String[] cIdxChecked = request.getParameterValues("cIdxChecked");
		
		CartVO cartVO = new CartVO();
		List<OrderVO> orderVOS = new ArrayList<OrderVO>();
		
    //ProductVO prodVO = storeService.getProductSearch(cartVO.getProdIdx());
    //List<ProductVO> opVOS = storeService.getProdOptionSearch(cartVO.getProdIdx());
    
    for(String strCIdx : cIdxChecked) {
      cartVO = storeService.getCartIdxSearch(Integer.parseInt(strCIdx));
      OrderVO orderVO = new OrderVO();
      orderVO.setProdIdx(cartVO.getProdIdx());
      orderVO.setProdName(cartVO.getProdName());
      orderVO.setProdPrice(cartVO.getProdPrice());
      orderVO.setProdFSName(cartVO.getProdFSName());
      orderVO.setOpIdx(cartVO.getOpIdx());
      orderVO.setOpName(cartVO.getOpName());
      orderVO.setOpPrice(cartVO.getOpPrice());
      orderVO.setQuantity(cartVO.getQuantity());
      orderVO.setOpTotalPrice(cartVO.getOpTotalPrice());
      orderVO.setCIdx(cartVO.getCIdx());
      orderVO.setTotalPrice(totalPrice);
      orderVO.setPayPrice(payPrice);
      orderVO.setDelivCharge(delivCharge);

      //orderVO.setOIdx(oIdx); 
      orderVO.setOrderIdx(orderIdx); 
      orderVO.setMid(mid);

      orderVOS.add(orderVO);
    }
    session.setAttribute("sOrderVOS", orderVOS);
		
		MemberVO memberVO = memberService.getMemberIdSearch(mid);
		model.addAttribute("memberVO", memberVO);
		
		return "store/order";
	}

	// 결제시스템(결제창 호출) - 결제 API이용
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String paymentPost(OrderVO orderVo, PaymentVO paymentVO, DeliveryVO deliveryVO, HttpSession session, Model model) {
		model.addAttribute("paymentVO", paymentVO);
		session.setAttribute("sPaymentVO", paymentVO);
		session.setAttribute("sDeliveryVO", deliveryVO);
		
		return "store/paymentOk";
	}
	
	@RequestMapping(value="/paymentResult", method=RequestMethod.GET)
	public String paymentResultGet(HttpSession session, PaymentVO receivePaymentVO, 
			@RequestParam(name="delivMsg", defaultValue="", required = false) String delivMsg) {
		List<OrderVO> orderVOS = (List<OrderVO>) session.getAttribute("sOrderVOS");
		PaymentVO paymentVO = (PaymentVO) session.getAttribute("sPaymentVO");
		DeliveryVO deliveryVO = (DeliveryVO) session.getAttribute("sDeliveryVO");
		
		session.removeAttribute("sDeliveryVO");

		deliveryVO.setOrderIdx(orderVOS.get(0).getOrderIdx());
		deliveryVO.setName(paymentVO.getBuyer_name());
		deliveryVO.setTel(paymentVO.getBuyer_tel());
		deliveryVO.setPostcode(paymentVO.getBuyer_postcode());
		deliveryVO.setAddress(paymentVO.getBuyer_addr());
		deliveryVO.setDelivMsg(delivMsg);
		
		storeService.setOrderTransaction(deliveryVO, orderVOS, paymentVO);
		
		//storeService.setDeliveryInput(deliveryVO);
		//int dIdx = storeService.getDeliveryIdxSearch(orderVOS.get(0).getOrderIdx());
		
//		for(OrderVO orderVO : orderVOS) {
//			orderVO.setDIdx(dIdx);
//			orderVO.setPayment(paymentVO.getPayment());
//			System.out.println("orderVO: "+ orderVO);
//			storeService.setOrderInput(orderVO);
//			storeService.setCartDelete(orderVO.getCIdx());
//		}
		
		//storeService.setMemberPointPlus((int)(orderVOS.get(0).getTotalPrice() * 0.01), orderVOS.get(0).getMid());
		
		paymentVO.setImp_uid(receivePaymentVO.getImp_uid());
		paymentVO.setMerchant_uid(receivePaymentVO.getMerchant_uid());
		paymentVO.setPaid_amount(receivePaymentVO.getPaid_amount());
		paymentVO.setApply_num(receivePaymentVO.getApply_num());
		
		System.out.println("receivePaymentVO2: "+receivePaymentVO);
		System.out.println("paymentVO2: "+paymentVO);
		System.out.println("deliveryVO2: "+deliveryVO);
		
		session.setAttribute("sPaymentVO", paymentVO);
		session.setAttribute("sOrderVOS", orderVOS);
		return "store/paymentResult";
	}
	
//	// 결제시스템(결제창 호출) - 결제 API이용
//	@RequestMapping(value="/payment", method=RequestMethod.POST)
//	public String paymentPost(OrderVO orderVo, PaymentVO paymentVO, DeliveryVO deliveryVO, HttpSession session, Model model) {
//		model.addAttribute("paymentVO", paymentVO);
//		session.setAttribute("sPaymentVO", paymentVO);
//		session.setAttribute("sDeliveryVO", deliveryVO);
//		
//		System.out.println("paymentVO1:"+paymentVO);
//		System.out.println("deliveryVO1:"+deliveryVO);
//		return "store/paymentOk";
//	}
//	
//	@RequestMapping(value="/paymentResult", method=RequestMethod.GET)
//	public String paymentResultGet(HttpSession session, PaymentVO receivePaymentVO, 
//			@RequestParam(name="delivMsg", defaultValue="", required = false) String delivMsg) {
//		List<OrderVO> orderVOS = (List<OrderVO>) session.getAttribute("sOrderVOS");
//		PaymentVO paymentVO = (PaymentVO) session.getAttribute("sPaymentVO");
//		DeliveryVO deliveryVO = (DeliveryVO) session.getAttribute("sDeliveryVO");
//		
//		session.removeAttribute("sDeliveryVO");
//
//		deliveryVO.setOrderIdx(orderVOS.get(0).getOrderIdx());
//		deliveryVO.setName(paymentVO.getBuyer_name());
//		deliveryVO.setTel(paymentVO.getBuyer_tel());
//		deliveryVO.setPostcode(paymentVO.getBuyer_postcode());
//		deliveryVO.setAddress(paymentVO.getBuyer_addr());
//		deliveryVO.setDelivMsg(delivMsg);
//		
//		storeService.setOrderTransaction(deliveryVO, orderVOS, paymentVO);
//		
//		//storeService.setDeliveryInput(deliveryVO);
//		//int dIdx = storeService.getDeliveryIdxSearch(orderVOS.get(0).getOrderIdx());
//		
////		for(OrderVO orderVO : orderVOS) {
////			orderVO.setDIdx(dIdx);
////			orderVO.setPayment(paymentVO.getPayment());
////			System.out.println("orderVO: "+ orderVO);
////			storeService.setOrderInput(orderVO);
////			storeService.setCartDelete(orderVO.getCIdx());
////		}
//		
//		//storeService.setMemberPointPlus((int)(orderVOS.get(0).getTotalPrice() * 0.01), orderVOS.get(0).getMid());
//		
//		paymentVO.setImp_uid(receivePaymentVO.getImp_uid());
//		paymentVO.setMerchant_uid(receivePaymentVO.getMerchant_uid());
//		paymentVO.setPaid_amount(receivePaymentVO.getPaid_amount());
//		paymentVO.setApply_num(receivePaymentVO.getApply_num());
//		
//		System.out.println("receivePaymentVO2: "+receivePaymentVO);
//		System.out.println("paymentVO2: "+paymentVO);
//		System.out.println("deliveryVO2: "+deliveryVO);
//		
//		session.setAttribute("sPaymentVO", paymentVO);
//		session.setAttribute("sOrderVOS", orderVOS);
//		return "store/paymentResult";
//	}
	
	
}
