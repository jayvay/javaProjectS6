<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>shopCategory.jsp</title>
  <style>
  	div.sticky {
		  position: -webkit-sticky;
		  position: sticky;
		  top: 0;
		  padding: 5px;
		  background-color: #cae8ca;
		  border: 2px solid #4CAF50;
		}
		
  </style>
  <script>
  	'use strict';
  	
  	function majorCategoryCheck() {
			
		}
  </script>
</head>
<body>
<div class="alert alert-success alert-dismissible sticky fade show">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Success!</strong> This alert box could indicate a successful or positive action.
</div>
<div class="w3-container">
  <h2>상품분류</h2>
  <form name="majorCatForm">
  	<h4>대분류 관리</h4>
  	<div class="row text-center">
		 	<div class="col">	
		  	<table class="table table-bordered">
		  		<tr>
			  		<th>대분류코드</th>
			  		<th>대분류명</th>
			  		<th>비고</th> 
		  		</tr>
			  	<c:forEach var="majorCatVO" items="${majorCatVOS}">
			  		<tr>
				  		<td>${majorCatVO.majorCatCode}</td>
				  		<td>${majorCatVO.majorCatName}</td>
				  		<td><button onclick="" class="btn btn-sm btn-danger">삭제</button></td>
				  	</tr>
			  	</c:forEach>
		  	</table>  
	  	</div>
  		<div class="col"><h5>대분류 등록</h5><button onclick="majorCategoryCheck()" class="btn btn-sm btn-warning">등록</button>
		  	<div class="row">
		  		<div class="col"></div>
			  	<div class="col-4"><label for="majorCatCode">대분류코드</label><input type="text" name="majorCatCode" size="1" maxlength="1" class="form-control"/></div>
			  	<div class="col-6"><label for="majorCatName">대분류명</label><input type="text" name="majorCatName" class="form-control"/></div>
		  		<div class="col"></div>
		  	</div>
		 	</div>
  	</div>
  </form>
  <hr/>
  <form name="middleCatForm">
  	<h4>중분류 관리</h4>
  	<div class="row text-center">
		 	<div class="col">	
		  	<table class="table table-bordered">
		  		<tr>
			  		<th>중분류코드</th>
			  		<th>중분류명</th>
			  		<th>비고</th> 
		  		</tr>
			  	<c:forEach var="middleCatVO" items="${middleCatVOS}">
			  		<tr>
				  		<td>${middleCatVO.middleCatCode}</td>
				  		<td>${middleCatVO.middleCatName}</td>
				  		<td><button onclick="" class="btn btn-sm btn-danger">삭제</button></td>
				  	</tr>
			  	</c:forEach>
		  	</table>  
	  	</div>
  		<div class="col"><h5>중분류 등록</h5>
		  	<div class="row">
		  		<div class="col"></div>
			  	<div class="col-4"><label for="middleCatCode">중분류코드</label><input type="text" name="middleCatCode" size="1" maxlength="1" class="form-control"/></div>
			  	<div class="col-6"><label for="middleCatName">중분류명</label><input type="text" name="middleCatName" class="form-control"/></div>
		  		<div class="col"></div>
		  	</div>
		 	</div>
  	</div>
  </form>
  <hr/>
  <form>
 		<h4>소분류 관리</h4>
  	<div class="row text-center">
		 	<div class="col">	
		  	<table class="table table-bordered">
		  		<tr>
			  		<th>소분류코드</th>
			  		<th>소분류명</th>
			  		<th>비고</th> 
		  		</tr>
			  	<c:forEach var="subCatVO" items="${subCatVOS}">
			  		<tr>
				  		<td>${subCatVO.subCatCode}</td>
				  		<td>${subCatVO.subCatName}</td>
				  		<td><button onclick="" class="btn btn-sm btn-danger">삭제</button></td>
				  	</tr>
			  	</c:forEach>
		  	</table>  
	  	</div>
  		<div class="col"><h5>소분류 등록</h5>
		  	<div class="row">
		  		<div class="col"></div>
			  	<div class="col-4"><label for="subCatCode">소분류코드</label><input type="text" name="subCatCode" size="1" maxlength="1" class="form-control"/></div>
			  	<div class="col-6"><label for="subCatName">소분류명</label><input type="text" name="subCatName" class="form-control"/></div>
		  		<div class="col"></div>
		  	</div>
		 	</div>
  	</div>
  </form>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-black w3-animate-right w3-top w3-text-light-grey w3-large" style="z-index:3;width:250px;font-weight:bold;display:none;right:0;" id="mySidebar">
  <a href="javascript:void()" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-32">CLOSE</a> 
  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">PORTFOLIO</a> 
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">ABOUT ME</a> 
  <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">CONTACT</a>
</nav>

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>
