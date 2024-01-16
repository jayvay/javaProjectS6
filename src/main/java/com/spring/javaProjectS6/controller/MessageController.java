package com.spring.javaProjectS6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(Model model, @PathVariable String msgFlag) {
		if(msgFlag.equals("joinOk")) {
			model.addAttribute("msg", "회원가입이 완료되었습니다. 다시 로그인 해주세요.");
			model.addAttribute("url", "member/login");
		}
		else if(msgFlag.equals("joinNo")) {
			model.addAttribute("msg", "회원가입 실패, 다시 시도해 주세요.");
			model.addAttribute("url", "member/join");
		}
		else if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("msg", "이미 사용 중인 아이디입니다.");
			model.addAttribute("url", "member/join");
		}
		
		
		return "include/message";
	}
}
