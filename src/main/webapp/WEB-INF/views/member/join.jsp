<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>join.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 180px;}
  	.container {
  		background-color: #eee;
  	}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<h1 class="text-center m-5">올리브영 회원가입</h1>
<hr style="margin:0px auto; width:1140px; border:solid 0.5px black;" />
<div class="container">
	<div class="row">
		<div class="col m-4">
			<h4 style="margin-bottom:20px">회원가입 여부 안내</h4>
			<ul style="padding: 20px">
				<li>기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게 확인하실 수 있습니다. 입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.</li>
				<li>올리브영, CJ더마켓, CJ온스타일, COOKIT, CJ문화재단, ONEiVERSE 에서는 전자상거래에 의거하여 만 14세 미만의 어린이/학생의 회원가입을 제한합니다.</li>
			</ul>
		</div>
	  <div class="col m-4">
	  	<form name="myform" method="post">
				<div class="input-field">
			  	<label for="name">이름</label>
					<input type="text" name="name" id="name" placeholder="이름을 입력해주세요." required autofocus class="form-control"/>
		  	</div>
				<div class="input-field">
			  	<label for="name">이름</label>
					<input type="text" name="name" id="name" placeholder="아이디를 입력해주세요." required autofocus class="form-control"/>
		  	</div>
		  
		  </form>
	  </div>
	</div>
</div>
<p><br/></p>
</body>
</html>