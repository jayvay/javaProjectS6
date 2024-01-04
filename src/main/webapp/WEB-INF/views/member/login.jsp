<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>login.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <jsp:include page="/WEB-INF/views/include/loginCss.jsp" />
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
  </script>
</head>
<body>
<p><br/></p>
<a href="${ctp}/" class="mb-1 ml-3"><font size="5"><i class="ri-arrow-left-circle-line"></i></font></a>
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form name="signUpForm" method="post">
      <h1 class="mb-4">SIGN UP</h1>
      <div class="social-container m-0 p-0">
      	<a href="javascript:kakaoLogin()"><img src="${ctp}/images/kakao_login_medium_narrow.png"/></a>
      </div>
      <span>or use your email for registration</span>
      <input type="text" placeholder="Name" />
      <input type="email" placeholder="Email" />
      <input type="password" placeholder="Password" />
      <button onclick="signUp()">Sign Up</button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form name="loginForm" method="post">
      <h1 class="mb-4">LOGIN</h1>
  		<div class="social-container m-0 p-0">
      	<a href="javascript:kakaoLogin()"><img src="${ctp}/images/kakao_login_medium_narrow.png"/></a>
      </div>
      <span>or use your account</span>
      <input type="text" placeholder="ID" name="mid" id="mid" required/>
      <input type="password" placeholder="Password" name="pwd" id="pwd" required/>
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="customSwitch1">
			  <label class="custom-control-label" for="customSwitch1"><font size="2">아이디 기억하기</font></label>
			</div>
      <a href="#">비밀번호를 잊으셨나요?</a>
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