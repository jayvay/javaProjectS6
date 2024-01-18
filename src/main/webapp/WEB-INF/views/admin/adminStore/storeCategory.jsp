<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>storeCategory.jsp</title>
  <style>
  	/* .container {padding-top: 60px;} */
  	div.sticky {
		  position: -webkit-sticky;
		  position: sticky;
		  top: 0;
		  padding: 5px;
		  background-color: #cae8ca;
		  border: 2px solid #4CAF50;
		}
		.btn {
			width: 70px;
			height: 80px;
			border-radius: 1px;
		}
  </style>
  <script>
  	'use strict';
  	
  	function majorCategoryCheck() {
			let majorCatCode = majorCatForm.majorCatCode.value.toUpperCase();
			let majorCatName = majorCatForm.majorCatName.value;
			if(majorCatCode.trim() == "" || majorCatName.trim() == "") {
				alert("대분류 코드와 대분류명을 입력해 주세요.");
				majorCatForm.majorCatCode.focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/adminStore/storeMajorCatInput",
				data : {
					majorCatCode : majorCatCode,
					majorCatName : majorCatName
				},
				success : function(res) {
					if(res == "0") alert("이미 등록된 카테고리입니다.");
					else {
						alert("대분류 카테고리가 등록되었습니다.");
						location.reload();
					}
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
  	
  	function subCategoryCheck() {
			let subCatCode = subCatForm.subCatCode.value.toUpperCase();
			let subCatName = subCatForm.subCatName.value;
			if(subCatCode.trim() == "" || subCatName.trim() == "") {
				alert("대분류 코드와 대분류명을 입력해 주세요.");
				subCatForm.subCatCode.focus();
				return false;
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/adminStore/storeSubCatInput",
				data : {
					majorCatCode : majorCatCode,
					subCatCode : subCatCode,
					subCatName : subCatName
				},
				success : function(res) {
					if(res == "0") alert("이미 등록된 카테고리입니다.");
					else {
						alert("소분류 카테고리가 등록되었습니다.");
						location.reload();
					}
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
  	
    function majorCategoryDelete(majorCatCode) {
    	let ans = confirm("대분류 카테고리를 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/storeMajorCatDelete",
    		data : {majorCatCode : majorCatCode},
    		success:function(res) {
    			if(res == "0") {
    				alert("소속된 상품이 존재합니다. 상품을 먼저 삭제해 주세요.");
    			}
    			else {
    				alert("대분류 카테고리가 삭제되었습니다.");	//240118_2238 소분류를 같이 삭제할지...아..정말..생각할 거 많네
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    function subCategoryDelete(categoryMiddleCode) {
    	let ans = confirm("중분류항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/storeSubCatDelete",
    		data : {subCatCode : subCatCode},
    		success:function(res) {
    			if(res == "0") {
    				alert("소속된 소분류가 존재합니다. 소분류를 먼저 삭제해 주세요.");
    			}
    			else {
    				alert("소분류 카테고리가 삭제되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<div class="alert alert-success alert-dismissible sticky fade show">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Success!</strong> This alert box could indicate a successful or positive action.
</div>
<div class="container">
	<div class="w3-container">
	  <h2>상품분류</h2><hr/>
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
	  		<div class="col">
			  	<table class="table table-borderless">
			  		<tr>
			  			<td><h5>대분류 등록</h5></td>
			  		</tr>
			  		<tr>
			  			<td><label for="majorCatCode">대분류코드</label></td>
			  			<td><input type="text" name="majorCatCode" size="1" maxlength="1" class="form-control"/></td>
			  			<td rowspan="3"><button onclick="majorCategoryCheck()" class="btn btn-secondary">추가</button></td>
			  		</tr>
			  		<tr>
			  			<td><label for="majorCatName">대분류명</label></td>
			  			<td><input type="text" name="majorCatName" class="form-control"/></td>
			  		</tr>
			  	</table>
			 	</div>
	  	</div>
	  </form>
	  <hr/>
	  <form name="subCatForm">
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
	  		<div class="col">
			  	<table class="table table-borderless">
			  		<tr>
			  			<td><h5>소분류 등록</h5></td>
			  		</tr>
			  		<tr>
			  			<td><label for="subCatCode">소분류코드</label></td>
			  			<td><input type="text" name="subCatCode" size="1" maxlength="1" class="form-control"/></td>
			  			<td rowspan="3"><button onclick="subCategoryCheck()" class="btn btn-secondary">추가</button></td>
			  		</tr>
			  		<tr>
			  			<td><label for="subCatName">소분류명</label></td>
			  			<td><input type="text" name="subCatName" class="form-control"/></td>
			  		</tr>
			  	</table>
			 	</div>
	  	</div>
	  </form>
	  <hr/>
	</div>
</div>

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
