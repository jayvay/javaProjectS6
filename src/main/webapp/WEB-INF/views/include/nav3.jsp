<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', sans-serif;}

body, html {
  height: 100%;
  line-height: 1.8;
}

div a, div a:hover {
  color: black;
  text-decoration: none;
}

/* Full height image header */
.bgimg-1 {
  background-position: center;
  background-size: cover;
  min-height: 75%;
}

.w3-bar .w3-button {
  padding: 16px;
}

.topMenu {
	font-size: 9pt;
	margin: 0 50px;
}

.logo {
	position: relative;
	left: 400px;
}

.search_box input[type=text] {
  width: 400px;
  height: 36px;
  border: 0;
  padding: 8px 10px 8px 0;
  font-size: 12px;
  background-color: transparent;
  outline: none; 
}

.search_box {
	position: relative;
	left: 350px;
  float: left;
  width: 350px;
  height: 40px;
  margin: 22px 0 0 90px;
  padding: 0 45px 0 20px;
  border: 2px solid #9bce26;
  background: #fff;
  border-radius: 20px;
}

#searchSubmit {
	position: absolute;
  border: 0;
  top: 4px;
  right: 18px;
  width: 30px;
  height: 30px;
	background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_search21x212.png) 50% 50% no-repeat;
  text-indent: -9999px;
}

.category {
	position: relative;
	left: 400px;
	line-height: 65px; 
}

.menu li {
	list-style: none;
	text-align: center;
}
.division1 {
	display:inline-block;
	width:180px;
	height:40px;
	margin: 40px 0 0 20px;
	background-color: #eee;
	padding-left: 15px;
	font-weight: bold;
	line-height: 40px;
}

.division1 {
	float: right;
	padding: 10px 5px 0 0;
}

.division2 {
	padding-left: 30px;
	font-size: 13px;
}

.menu {
	/* display:none; */
	margin: -3px -928px 0px -30px;
	height:350px;
	border: 1px solid black;
	z-index:2;
	position:relative;
	background-color: white;
}

.menu a:hover{
	color: black;
	text-decoration: none;
}
</style>
<script>
	'use strict';
	
	
</script>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
		<div class="text-right topMenu">
		  <ul class="nav justify-content-end">
		    <li class="nav-item">
		      <a class="nav-link" href="${ctp}/member/join">회원가입</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="${ctp}/member/login">로그인</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">장바구니</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">주문배송</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">고객센터</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">매장안내</a>
		    </li>
		  </ul>
		</div>
		<div><a href="${ctp}/" class="w3-bar-item w3-button w3-wide logo"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/h1_logo.png" alt="올리브영" width="250px"></a></div>
		<div>
			<div class="search_box">
				<div>
					<input type="text" id="query" name="" value="" data-placeholder="검색어를 입력해 주세요" />
					<button id="searchSubmit">검색</button>
				</div>
			</div>
		</div>
		<div class="category">
	    <!-- Right-sided navbar links -->
	    <!-- 
	    <div class="w3-center w3-hide-small">
	      <a href="#about" class="w3-bar-item w3-button category">카테고리</a>
	      <div>
	      	<div class="row" >                                                                                                                                            
						<div class="menu">                                                                                                                               
						<div class="dropdown-menu">                                                                                                                               
						<a href="#" class="division1">카테고리</a>
							<div class="col pr-0" style="width:200px;">                                                                                                    
								<div>                                                                                                                                        
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">스킨케어</a></div>   
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">클렌징</a></div>   
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">메이크업</a></div>     
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">선케어</a></div>          
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">마스크팩</a></div>         
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">바디/헤어</a></div>       
									<div style="line-height: 30px;"><a href="#" class="dropdown-item">미용소품</a></div>            
								</div>     
							</div>
						</div>
					</div>   
	      </div>
	       -->
   	    <div class="w3-dropdown-hover w3-hide-small">
	      <button class="w3-padding-large w3-button" title="More">STUDY1 <i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="${ctp}/user/userList" class="w3-bar-item w3-button">UserList1</a>
	        <a href="${ctp}/user2/user2List" class="w3-bar-item w3-button">UserList2</a>
	        <a href="${ctp}/study/ajax/ajaxForm" class="w3-bar-item w3-button">AjaxTest</a>
	        <a href="${ctp}/study/uuid/uidForm" class="w3-bar-item w3-button">랜덤(UUID)</a>
	        <a href="${ctp}/study/password/sha256" class="w3-bar-item w3-button">암호화(SHA256)</a>
	        <a href="${ctp}/study/password/aria" class="w3-bar-item w3-button">암호화(Aria)</a>
	        <a href="${ctp}/study/password/bCryptPassword" class="w3-bar-item w3-button">암호화(Security)</a>
	        <a href="${ctp}/study/mail/mailForm" class="w3-bar-item w3-button">메일연습</a>
	        <a href="${ctp}/study/fileUpload/fileUpload" class="w3-bar-item w3-button">파일업로드</a>
	      </div>
	    </div>
	      <a href="#team" class="w3-bar-item"><i class="fa fa-user"></i> TEAM</a>
	      <a href="#work" class="w3-bar-item"><i class="fa fa-th"></i> WORK</a>
	      <a href="#pricing" class="w3-bar-item"><i class="fa fa-usd"></i> PRICING</a>
	      <a href="#contact" class="w3-bar-item"><i class="fa fa-envelope"></i> CONTACT</a>
	    </div>
    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT</a>
  <a href="#team" onclick="w3_close()" class="w3-bar-item w3-button">TEAM</a>
  <a href="#work" onclick="w3_close()" class="w3-bar-item w3-button">WORK</a>
  <a href="#pricing" onclick="w3_close()" class="w3-bar-item w3-button">PRICING</a>
  <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">CONTACT</a>
</nav>


<script>
'use strict';

$(function() {
	$('.menu li').mouseover(function() {
		$('ul',this).show();
	});
	$('.menu li').mouseout(function() {
		$('ul',this).hide();
	});
});

//Toggle between showing and hiding the sidebar when clicking the menu icon
let mySidebar = document.getElementById("mySidebar");

function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
}
</script>
