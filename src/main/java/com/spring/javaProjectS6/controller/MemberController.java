package com.spring.javaProjectS6.controller;

import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaProjectS6.service.MemberService;
import com.spring.javaProjectS6.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
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
			
		MemberVO vo = memberService.getMemberIdSearch(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getLevel() < 4) {
			//세션 저장
			String sLevelName = "";
			if(vo.getLevel() == 0) sLevelName = "관리자";
			else if(vo.getLevel() == 1) sLevelName = "우수회원";
			else if(vo.getLevel() == 2) sLevelName = "정회원";
			else if(vo.getLevel() == 3) sLevelName = "준회원";
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sLevelName", sLevelName);
			
			//쿠키 저장
			if(idRemember.equals("on")) {
				Cookie cookieMid = new Cookie("cMid", mid);
				cookieMid.setMaxAge(60*60*24*14);
				response.addCookie(cookieMid);
				System.out.println("cookie:"+cookieMid);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			return "redirect:/message/loginOk?mid=" + mid;
		}
		else {
			return "redirect:/message/loginNo";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		session.invalidate();
		return "redirect:/message/logoutOk?mid=" + mid;
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
	
	@RequestMapping(value = "/idFind", method = RequestMethod.GET)
	public String idFindGet() {
		return "member/idFind";
	}

	@RequestMapping(value = "/pwdFind", method = RequestMethod.GET)
	public String pwdFindGet() {
		return "member/pwdFind";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public String idFindPost(String name, String email) {
		List<String> midList = memberService.getMemberIdListSearch(name, email);
		
		String res = "";
		for(String mid : midList) {
			res += mid + "/";
		}
		
		if(midList.size() == 0) return "0";
		else return res;
	}
	
	@ResponseBody
	@RequestMapping(value = "/pwdFind", method = RequestMethod.POST)
	public String pwdFindPost(String mid, String name, String email) throws MessagingException {
		MemberVO vo = memberService.getMemberIdSearch(mid);
		if(vo != null && vo.getEmail().equals(email)) {
			//정보 확인 후 임시 비밀번호 발급 받아 이메일로 발송하는 코드
			UUID uid = UUID.randomUUID();
			String tempPwd = uid.toString().substring(0,8);
			
			//발급 받은 임시 비밀번호를 암호화 후 DB에 저장
			memberService.setMemberPwdFindUpdate(mid, passwordEncoder.encode(tempPwd));
			
			//발급된 임시 비밀번호를 이메일로 전송
			String title = "[올리브영테스트] 임시 비밀번호가 발급되었습니다.";
			String mailFlag = "임시 비밀번호로 로그인 후 비밀번호를 변경해 주세요.<br/>임시 비밀번호 : " + tempPwd;
			String res = sendMail(email, title, mailFlag);
			
			if(res == "1") return "1";
		}
		return "0";
	}
	
	
	//메일 전송
	public String sendMail(String recipient, String title, String mailFlag) throws MessagingException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String content = "";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setTo(recipient);
		messageHelper.setSubject(title);
		messageHelper.setText(content);
		
		content = content.replace("\n", "<br/>");
		content += "<br/><h3>" + mailFlag + "</h3><hr/><br/>";
		content += "<p><img src=\"cid:oliveyoungLogo.jpg\" width='500px'></p>";
		content += "<p><a href='49.142.157.251:9090/cjgreen'>올리브영으로 가기</a></p>";
		messageHelper.setText(content, true);
				
		FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/oliveyoungLogo.jpg"));
		messageHelper.addInline("oliveyoungLogo.jpg", file);
		
		mailSender.send(message);
		
		return "1";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageGet() {
		return "member/myPage";
	}
}
