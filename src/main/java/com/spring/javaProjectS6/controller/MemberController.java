package com.spring.javaProjectS6.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaProjectS6.service.MemberService;
import com.spring.javaProjectS6.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					request.setAttribute("mid", cookies[i].getValue());
					break;
				}
			}
		}
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "mid", defaultValue = "", required = false) String mid,
			@RequestParam(name = "pwd", defaultValue = "", required = false)String pwd,
			@RequestParam(name = "idRemember", defaultValue = "", required = false)String idRemember) {
			
		
		return "member/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGet() {
		return "member/join";
	}

	@ResponseBody
	@RequestMapping(value = "/join/idOverlapCheck", method = RequestMethod.POST)
	public String idOverlapCheckPost(String mid) {
		MemberVO vo = memberService.getMemberIdSearch(mid);
		if(vo != null) return "1";
		else return "0";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(MemberVO vo) {
		if(memberService.getMemberIdSearch(vo.getMid()) != null) return "redirect:/message/idCheckNo";
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		int res = 0;
		if(vo.getAgree() == 1) res = memberService.setMemberJoin(vo);
		
		if(res == 1) return "redirect:/message/joinOk";
		else return "redirect:/message/joinNo";
	}
	
	
}
