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
  	
  	.majorCat {
  		font-size: 21pt;
  		font-weight: bold;
  		margin-bottom: 20px;
  		padding-bottom: 10px;
  		border-bottom: 1px solid gray;
  	}
  	.subCats {
  		font-size: 12pt;
  		margin: 20px 50px;
  	}
  	.subCat {
  		color: gray;
  		font-weight: bold;
  		margin: 10px 40px;
  		padding: 10px;
  	}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<div class="majorCat">${majorVO.majorCatName}</div>
	<div class="subCats">
		<a href="#" class="subCat">전체</a>
		<c:forEach var="subVO" items="${subVOS}">
			<a href="#" class="subCat">${subVO.subCatName}</a>
		</c:forEach>
	</div>
	<!-- 최신순 뭐 그런 거 -->
	
  <div class="w3-row" style="margin-top: 40px;">
  	<c:forEach var="prodVO" items="${prodVOS}">
	    <div class="w3-col l3 s6">
	      <div class="w3-container">
	      	<a href="${ctp}/store/goodsDetail?prodIdx=${prodVO.prodIdx}">
		        <img src="${ctp}/store/product/${prodVO.prodFSName}" style="width:250px; height:250px;">
		        <span class="w3-tag w3-display-topleft">Sale</span>
		        <p>${prodVO.prodName}<br><b>${prodVO.prodPrice}</b></p>
	      	</a>
	      </div>
	    </div>
		</c:forEach>
<%-- 
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
--%>
  </div>
</div>
<p><br/></p>
</body>
</html>