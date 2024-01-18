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
		return "admin2/adminMain";
	}
	
	@RequestMapping(value = "/adminLeft", method = RequestMethod.GET)
	public String adminLeft() {
		return "admin/adminLeft";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		model.addAttribute("adminFlag", "admin");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String login2(Model model) {
		model.addAttribute("adminFlag", "login");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/register2", method = RequestMethod.GET)
	public String register2(Model model) {
		model.addAttribute("adminFlag", "register");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/password2", method = RequestMethod.GET)
	public String password2(Model model) {
		model.addAttribute("adminFlag", "password");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String charts(Model model) {
		model.addAttribute("adminFlag", "charts");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Model model) {
		model.addAttribute("adminFlag", "tables");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/401", method = RequestMethod.GET)
	public String a401Get(Model model) {
		model.addAttribute("adminFlag", "401");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String a404Get(Model model) {
		model.addAttribute("adminFlag", "404");
		return "admin/admin";
	}
	
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String a500Get(Model model) {
		model.addAttribute("adminFlag", "500");
		return "admin/admin";
	}
}
 