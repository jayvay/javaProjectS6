<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>slide.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	body,h1,h2,h3,h4,h5,h6 {font-family: 'Noto Sans KR', sans-serif;}
  
  /* Make the image fully responsive */
  .carousel-inner img{
    width: 100%;
    height: 100%;
  }
  .carousel-caption {
  	position: absolute;
  	left: 600px;
  	bottom: 90px;
  	font-size: 32pt;
  	text-align: justify;
  	color: #1f1f1f;
  }
  .bannerTitle {
  	font-weight: bold;
  	font-size: 15pt;
  	color: #1f1f1f;
  }
  .bannerTitle:after {
  	content: "";
  	display: block;
  	width: 12px;
  	height: 1px;
  	margin: 20px 0;
  	background: #b0afb6;
  }
  </style>
</head>
<body>

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://image.oliveyoung.co.kr/uploads/images/display/90000010001/1/8175820400926483104.jpg" alt="Los Angeles" width="1100" height="800">
      <div class="carousel-caption W3-container">
        <p class="bannerTitle">올영PICK</p>
        <strong>
        	올리브영이
        	<br/>
					PICK한        	
        	<br/>
        	이 달의 브랜드
        </strong>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://image.oliveyoung.co.kr/uploads/images/display/90000010001/1/2460233993479519933.jpg" alt="Chicago" width="1100" height="800">
      <div class="carousel-caption W3-container">
        <p class="bannerTitle">올영PICK</p>
        <strong>
        	올리브영이
        	<br/>
					PICK한        	
        	<br/>
        	이 달의 브랜드
        </strong>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://image.oliveyoung.co.kr/uploads/images/display/90000010001/1/6958855610758781593.jpg" alt="New York" width="1100" height="800">
      <div class="carousel-caption W3-container">
        <p class="bannerTitle">올영PICK</p>
        <strong>
        	올리브영이
        	<br/>
					PICK한        	
        	<br/>
        	이 달의 브랜드
        </strong>
      </div>
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

</body>
</html>

