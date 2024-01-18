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
  	.myInfo {
  		margin: 0 auto;
  		padding: 40px;
  		width: 700px;
  		height: 100px;
  		border: 1px solid gray;
  	}
  	.navItem {
  		font-size: 11pt;
  	}
  	
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <p><br/></p>
  <div class="container">
  	<div class="row">
  		<div class="col-3">
		  	<!-- Sidebar -->
				<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5" id="mySidebar">
				  <h3 class="w3-bar-item"><b>마이페이지</b></h3>
				  <a class="w3-bar-item w3-button w3-hover-black navItem" href="#">주문내역조회</a>
				  <a class="w3-bar-item w3-button w3-hover-black navItem" href="#">적립금</a>
				  <a class="w3-bar-item w3-button w3-hover-black navItem" href="#">1:1문의</a>
				  <a class="w3-bar-item w3-button w3-hover-black navItem" href="#">회원정보수정</a>
				</nav>
			</div>
			<div class="col-9">	
				<div class="w3-main" style="margin-top:0px; text-align:center;">
				  <div class="w3-row w3-padding-64">
				    <div class="w3-twothird w3-container">
				      <div class="myInfo">
				      	<div class="row">
				      		<div class="col">회원등급 </div>
				      		<div class="col">회원등급 </div>
				      		<div class="col">회원등급 </div>
				      		<div class="col">회원등급 </div>
				      	</div>
				      </div>
				    </div>
				  </div>
			  </div>
			    <!-- Pagination -->
			  <div class="w3-center w3-padding-32">
			    <div class="w3-bar">
			      <a class="w3-button w3-black" href="#">1</a>
			      <a class="w3-button w3-hover-black" href="#">2</a>
			      <a class="w3-button w3-hover-black" href="#">3</a>
			      <a class="w3-button w3-hover-black" href="#">4</a>
			      <a class="w3-button w3-hover-black" href="#">5</a>
			      <a class="w3-button w3-hover-black" href="#">»</a>
			    </div>
			  </div>
	 	  </div>
	  </div>
  </div>
  <p><br/></p>
<script>
</script>
</body>
</html>