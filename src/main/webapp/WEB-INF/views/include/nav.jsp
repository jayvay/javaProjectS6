<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
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
  min-height: 80%;
}

.w3-bar .w3-button {
  padding: 16px;
}

.topMenu {
	font-size: 9pt;
	margin: 0 300px;
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
</style>
<script>
	'use strict';
	
	
</script>
</head>
<body>
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
	</div>	
<jsp:include page="/WEB-INF/views/include/navnav.jsp" />
</div>		


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
</body>
</html>