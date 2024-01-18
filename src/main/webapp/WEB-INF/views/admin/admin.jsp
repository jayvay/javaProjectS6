<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>admin.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <jsp:include page="styles.jsp" />
  <style>
  	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
		body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', sans-serif;}
		.container {padding-top: 55px;}
  </style>
</head>
<body class="sb-nav-fixed">
<jsp:include page="adminTop.jsp" />
<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <jsp:include page="adminLeft.jsp" />
  </div>
  <div id="layoutSidenav_content">
    <main>
      <c:if test="${empty adminFlag || adminFlag == 'admin'}"><jsp:include page="adminContent.jsp" /></c:if>
      <c:if test="${adminFlag=='storeCategory'}"><jsp:include page="adminStore/storeCategory.jsp" /></c:if>
      <c:if test="${adminFlag=='storeProductInput'}"><jsp:include page="adminStore/storeProductInput.jsp" /></c:if>
      <c:if test="${adminFlag=='storeProductOptionInput'}"><jsp:include page="adminStore/storeProductOptionInput.jsp" /></c:if>
      <c:if test="${adminFlag=='storeProductList'}"><jsp:include page="adminStore/storeProductList.jsp" /></c:if>
      <c:if test="${adminFlag=='dbShopContent'}"><jsp:include page="adminStore/dbShopContent.jsp" /></c:if>
      <c:if test="${adminFlag=='login'}"><jsp:include page="etc/login.jsp" /></c:if>
      <c:if test="${adminFlag=='register'}"><jsp:include page="etc/register.jsp" /></c:if>
      <c:if test="${adminFlag=='password'}"><jsp:include page="etc/password.jsp" /></c:if>
      <c:if test="${adminFlag=='charts'}"><jsp:include page="etc/charts.jsp" /></c:if>
      <c:if test="${adminFlag=='tables'}"><jsp:include page="etc/tables.jsp" /></c:if>
      <c:if test="${adminFlag=='401'}"><jsp:include page="etc/401.jsp" /></c:if>
      <c:if test="${adminFlag=='404'}"><jsp:include page="etc/404.jsp" /></c:if>
      <c:if test="${adminFlag=='500'}"><jsp:include page="etc/500.jsp" /></c:if>
		</main>
	</div>
</div>
</body>
</html>
