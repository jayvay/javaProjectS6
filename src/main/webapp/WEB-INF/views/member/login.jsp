<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null) { 
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("cMid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>login.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <jsp:include page="/WEB-INF/views/include/loginCss.jsp" />
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <style>
  	.kakao_join {
  		width: 300px;
  	}
  </style>
  <script>
  	'use strict';
  
  	$(function() {
		  const signUpButton = document.getElementById('signUp');
		  const signInButton = document.getElementById('signIn');
		  const container = document.getElementById('container');
		
		  signUpButton.addEventListener('click', () => {
		    container.classList.add("right-panel-active");
		  });
		
		  signInButton.addEventListener('click', () => {
		    container.classList.remove("right-panel-active");
		  });
		});
  	
  	function login() {
			let mid = loginForm.mid.value;
			let pwd = loginForm.pwd.value;
			
			if(mid.trim() != "" || pwd.trim() != "") {
				loginForm.submit;
			}
			
			
		}
  	
  	//카카오 로그인을 위한 자바스크립트 앱 키
    window.Kakao.init("5277e19a72487035adae6349e84d6957");
    function kakaoLogin() {
			//카카오에 인증 요청
			window.Kakao.Auth.login({
				scope: 'profile_nickname',
				success : function(autoObj) {
					console.log(Kakao.Auth.getAccessToken(), "정상적으로 토큰이 발급되었습니다");
					window.Kakao.API.request({
						url : '/v2/user/me',
						success : function() {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
							location.href = "${ctp}/member/kakaoLogin?nickName="+kakao_account.profile.nickname+"&email="+kakao_account.email+"&accessToken="+Kakao.Auth.getAccessToken();
						}
					});
				}
			});
    }
  </script>
</head>
<body>
	<p><br/></p>
	<a href="${ctp}/" class="mb-1 ml-3"><font size="5"><i class="ri-arrow-left-circle-line"></i></font></a>
	<div class="container" id="container">
	  <div class="form-container sign-up-container">
	    <div class="signUpForm">
	      <h1 class="mb-4">SIGN UP</h1>
	      <div class="social-container m-0 p-0">
	      	<a href="javascript:kakaoLogin()"><img src="${ctp}/images/kakao_join.jpg" class="kakao_join"/></a>
	      </div><br/>
	      <span>또는</span><br/>
	      <span>일반 회원가입</span><br/>
	      <button onclick="location.href='join';">Sign Up</button>
	    </div>
	  </div>
	  <div class="form-container sign-in-container">
	    <form name="loginForm" method="post">
	      <h1 class="mb-4">LOGIN</h1>
	  		<div class="social-container m-0 p-0">
	      	<a href="javascript:kakaoLogin()"><img src="${ctp}/images/kakao_login_medium_narrow.png"/></a>
	      </div>
	      <span>or use your account</span>
	      <input type="text" placeholder="ID" name="mid" id="mid" value="${cMid}" required/>
	      <input type="password" placeholder="Password" name="pwd" id="pwd" required/>
				<div class="custom-control custom-switch">
					<c:if test="${cMid != null}">
					  <input type="checkbox" class="custom-control-input" id="customSwitch1" name="idRemember" checked>
					</c:if>
					<c:if test="${cMid == null}">
					  <input type="checkbox" class="custom-control-input" id="customSwitch1" name="idRemember">
					</c:if>
				  <label class="custom-control-label" for="customSwitch1"><font size="2">아이디 기억하기</font></label>
				</div>
				<span class="m-3">
	      <a href="${ctp}/member/idFind"><span>아이디</span></a>/
	      <a href="${ctp}/member/pwdFind"><span>비밀번호</span></a>를 잊으셨나요?
	      </span>
	      <button onclick="login()">Sign In</button>
	    </form>
	  </div>
	  <div class="overlay-container">
	    <div class="overlay">
	      <div class="overlay-panel overlay-left">
	        <h1>Welcome Back!</h1>
	        <p>To keep connected with us please login with your personal info</p>
	        <button class="ghost" id="signIn">Sign In</button>
	      </div>
	      <div class="overlay-panel overlay-right">
	        <h1>Hello, Friend!</h1>
	        <p>Enter your personal details and start journey with us</p>
	        <button class="ghost" id="signUp">Sign Up</button>
	      </div>
	    </div>
	  </div>
	</div>
	<p><br/></p>
</body>
</html>