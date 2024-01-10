package com.spring.javaProjectS6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMainGet() {
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/adminLeft", method = RequestMethod.GET)
	public String adminLeft() {
		return "admin/adminLeft";
	}
	
	@RequestMapping(value = "/admin2", method = RequestMethod.GET)
	public String admin2(Model model) {
		model.addAttribute("adminFlag", "admin2");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String login2(Model model) {
		model.addAttribute("adminFlag", "login");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/register2", method = RequestMethod.GET)
	public String register2(Model model) {
		model.addAttribute("adminFlag", "register");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/password2", method = RequestMethod.GET)
	public String password2(Model model) {
		model.addAttribute("adminFlag", "password");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String charts(Model model) {
		model.addAttribute("adminFlag", "charts");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Model model) {
		model.addAttribute("adminFlag", "tables");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/401", method = RequestMethod.GET)
	public String a401Get(Model model) {
		model.addAttribute("adminFlag", "401");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String a404Get(Model model) {
		model.addAttribute("adminFlag", "404");
		return "admin2/admin2";
	}
	
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String a500Get(Model model) {
		model.addAttribute("adminFlag", "500");
		return "admin2/admin2";
	}
}
 