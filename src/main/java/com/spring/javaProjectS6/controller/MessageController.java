package com.spring.javaProjectS6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(Model model, @PathVariable String msgFlag, String mid) {
		if(msgFlag.equals("joinOk")) {
			model.addAttribute("msg", "회원가입이 완료되었습니다. 다시 로그인해 주세요.");
			model.addAttribute("url", "member/login");	//URL은 매핑주소!!!!
		}
		else if(msgFlag.equals("joinNo")) {
			model.addAttribute("msg", "회원가입 실패, 다시 시도해 주세요.");
			model.addAttribute("url", "member/join");
		}
		else if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("msg", "이미 사용 중인 아이디입니다.");
			model.addAttribute("url", "member/join");
		}
		else if(msgFlag.equals("loginOk")) {
			model.addAttribute("msg", mid + " 님, 로그인 되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("loginNo")) {
			model.addAttribute("msg", "로그인 실패, 다시 시도해 주세요.");
			model.addAttribute("url", "member/login");
		}
		else if(msgFlag.equals("logoutOk")) {
			model.addAttribute("msg", mid + " 님, 로그아웃 되었습니다.");
			model.addAttribute("url", "");
		}

		//store
		else if(msgFlag.equals("cartEmpty")) {
			model.addAttribute("msg", "장바구니가 비었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("productInputOk")) {
			model.addAttribute("msg", "상품이 정상적으로 등록되었습니다.");
			model.addAttribute("url", "adminStore/storeProductInput");
		}
		else if(msgFlag.equals("productInputNo")) {
			model.addAttribute("msg", "상품 등록 실패, 다시 시도하세요.");
			model.addAttribute("url", "adminStore/storeProductInput");
		}
		else if(msgFlag.equals("optionInputOk")) {
			model.addAttribute("msg", "옵션이 정상적으로 등록되었습니다.");
			model.addAttribute("url", "adminStore/storeProductOptionInput");
		}
		else if(msgFlag.equals("optionInputNo")) {
			model.addAttribute("msg", "옵션 등록 실패, 다시 시도하세요.");
			model.addAttribute("url", "adminStore/storeProductOptionInput");
		}
		
		
		
		return "include/message";
	}
}
