<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>myPage.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 180px;}
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <p><br/></p>
  <div class="container">
    <h2>마이페이지</h2>
    <div>
    	<nav class="navbar">
        <div class="navbar-nav">
          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle m-2 red" data-toggle="dropdown" id="nav-product">혜택관리</a>
            <div class="dropdown-menu bg-transparent border-0 show">
                <a href="/javaweb6S/member/myCouponList" class="dropdown-item">쿠폰</a>
                <a href="/javaweb6S/member/myPointList" class="dropdown-item">적립금</a>
            </div>
          </div>
          <div class="nav-item dropdown">
            <a href="#">메뉴1</a>
          </div>
          <div class="nav-item dropdown">
            <a href="#">메뉴1</a>
          </div>
        </div>
      </nav>
    </div>
  </div>
  <p><br/></p>
</body>
</html>