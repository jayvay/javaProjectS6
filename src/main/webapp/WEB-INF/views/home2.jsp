<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>home.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body {
			margin: 0 300px;
			padding: 0px;
		}
		a {
		 color: black;
		}
		.top {
			width: 1000px;
		}
		.nav {
			font-size: 9pt;
		}
		.header_inner .search_box input[type=text] {
		  width: 250px;
	    height: 36px;
	    border: 0;
	    padding: 8px 10px 8px 0;
	    font-size: 12px;
	    background-color: transparent;
		}
		.header_inner .search_box {
	    float: left;
	    position: relative;
	    width: 340px;
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
		#Gnb {
	    position: relative;
	    width: 100%;
	    min-width: 1020px;
	    height: 47px;
	    background: #fff;
	    border-top: 1px solid #ddd;
	    border-bottom: 2px solid #555;
	    z-index: 10;
		}
	</style>
	
</head>
<body>
<div class="container top">
<div class="text-right">
  <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="#">회원가입</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">로그인</a>
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
<div class="header_inner">
	<h1><a href="#"><img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/h1_logo.png" alt="올리브영" width="300px"></a></h1>
	<div class="search_box">
		<div>
			<input type="text" id="query" name="" value="" data-placeholder="검색어를 입력해 주세요" />
			<button id="searchSubmit">검색</button>
		</div>
	</div>
</div>
</div>
<div id="Gnb" class="">

</div>
<div><jsp:include page="/WEB-INF/views/include/slide.jsp" /></div>
</body>
</html>