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

td {
	margin: 0px;
	padding: 0px;
	text-align: center;
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
	margin-left: 100px;
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
  float: left;
  width: 500px;
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

.category > div {
	line-height: 40px;
}

.menu li {
	list-style: none;
	text-align: center;
}
/* 
.menu li a {
  display: block; /*영역이 쪼꼬맣다 -> 영역을 차지하기 위해 block*/
  color: black;
}

.menu ul {
	position: absolute;
	display: none;
}  
*/
</style>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
  	<table class="table table-bordered m-0 p-0">
  		<tr>
  			<td colspan="3" class="m-0 p-0">
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
				</td>
  		</tr>
  		<tr>
  			<td><a href="#home" class="w3-bar-item w3-button w3-wide"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/h1_logo.png" alt="올리브영" width="250px"></a></td>
				<td>
					<div class="search_box">
						<div>
							<input type="text" id="query" name="" value="" data-placeholder="검색어를 입력해 주세요" />
							<button id="searchSubmit">검색</button>
						</div>
					</div>
				</td>
				<td class="category">
			    <!-- Right-sided navbar links -->
			    <div class="w3-center w3-hide-small">
			      <!-- <a href="#about" class="w3-bar-item w3-button category">카테고리</a> -->
			      <div>
			      	<ul class="w3-bar-item menu">
			      		<li><a href="#">카테고리</a>
			      			<ul class="w3-dropdown-content w3-bar-block w3-card-4">
			      				<li><a href="#">스킨케어</a>
			      					<ul>
					      				<li><a href="#">스킨/토너</a></li>
					      				<li><a href="#">에센스/세럼/앰플</a></li>
					      				<li><a href="#">크림</a></li>
					      				<li><a href="#">미스트/오일</a></li>
			      					</ul>
			      				</li>
					      		<li><a href="#">클렌징</a>
					      			<ul>
					      				<li><a href="#">클렌징폼</a></li>
					      				<li><a href="#">클렌징오일</a></li>
					      				<li><a href="#">클렌징워터</a></li>
					      				<li><a href="#">립&아이리무버</a></li>
					      			</ul>
					      		</li>
					      		<li><a href="#">메이크업</a>
					      			<ul>
					      				<li><a href="#">립메이크업</a></li>
					      				<li><a href="#">베이스메이크업</a></li>
					      				<li><a href="#">아이메이크업</a></li>
					      			</ul>
					      		</li>
			      			</ul>
			      		</li>
			      	</ul>
			      </div>
			      <a href="#team" class="w3-bar-item"><i class="fa fa-user"></i> TEAM</a>
			      <a href="#work" class="w3-bar-item"><i class="fa fa-th"></i> WORK</a>
			      <a href="#pricing" class="w3-bar-item"><i class="fa fa-usd"></i> PRICING</a>
			      <a href="#contact" class="w3-bar-item"><i class="fa fa-envelope"></i> CONTACT</a>
			    </div>
		    </td>
	    </tr>
    </table>
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
