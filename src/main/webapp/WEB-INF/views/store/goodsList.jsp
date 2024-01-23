<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>goodsList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 180px;}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <!-- Product grid -->
  <div class="w3-row">
    <div class="w3-col l3 s6">
      <div class="w3-container">
      	<a href="${ctp}/store/goodsDetail?prodIdx=1">
	        <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
	        <p>Ripped Skinny Jeans<br><b>$24.99</b></p>
      	</a>
      </div>
      <div class="w3-container">
        <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
        <p>Mega Ripped Jeans<br><b>$19.99</b></p>
      </div>
    </div>

    <div class="w3-col l3 s6">
      <div class="w3-container">
        <div class="w3-display-container">
          <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
          <span class="w3-tag w3-display-topleft">New</span>
          <div class="w3-display-middle w3-display-hover">
            <button class="w3-button w3-black">Buy now <i class="fa fa-shopping-cart"></i></button>
          </div>
        </div>
        <p>Mega Ripped Jeans<br><b>$19.99</b></p>
      </div>
      <div class="w3-container">
        <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
        <p>Washed Skinny Jeans<br><b>$20.50</b></p>
      </div>
    </div>

    <div class="w3-col l3 s6">
      <div class="w3-container">
      	<a href="${ctp}/store/goodsDetail?prodIdx=2">
	        <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
	        <p>Washed Skinny Jeans<br><b>$20.50</b></p>
        </a>
      </div>
      <div class="w3-container">
        <div class="w3-display-container">
          <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
          <span class="w3-tag w3-display-topleft">Sale</span>
          <div class="w3-display-middle w3-display-hover">
            <button class="w3-button w3-black">Buy now <i class="fa fa-shopping-cart"></i></button>
          </div>
        </div>
        <p>Vintage Skinny Jeans<br><b class="w3-text-red">$14.99</b></p>
      </div>
    </div>

    <div class="w3-col l3 s6">
      <div class="w3-container">
        <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
        <p>Vintage Skinny Jeans<br><b>$14.99</b></p>
      </div>
      <div class="w3-container">
        <img src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0019/A00000019810902ko.jpg?l=ko" style="width:100%">
        <p>Ripped Skinny Jeans<br><b>$24.99</b></p>
      </div>
    </div>
  </div>
</div>
<p><br/></p>
</body>
</html>