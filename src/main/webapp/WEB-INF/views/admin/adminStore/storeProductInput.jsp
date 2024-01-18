<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>storeProductInput.jsp</title>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <style>
  	input[type=text], .sel {
  		border-radius: 0px;
  	}
  	.btn {
  		width: 100px;
			height: 50px;  		
  		border-radius: 0px;
  	}
  </style>
  <script>
    'use strict';
    
    // 상품 등록하기전에 체크후 전송...
    function fCheck() {
    	let majorCatCode = myform.majorCatCode.value;
    	let middleCatCode = myform.middleCatCode.value;
    	let categorySubCode = myform.categorySubCode.value;
    	let productName = myform.productName.value;
			let mainPrice = myform.mainPrice.value;
			let detail = myform.detail.value;
			let file = myform.file.value;	
			let ext = file.substring(file.lastIndexOf(".")+1);
			let uExt = ext.toUpperCase();
			let regExpPrice = /^[0-9|_]*$/;
			
			if(categorySubCode == "") {
				alert("상품 소분류(세분류)를 입력하세요!");
				return false;
			}
			else if(product == "") {
				alert("상품명(모델명)을 입력하세요!");
				return false;
			}
			else if(file == "") {
				alert("상품 메인 이미지를 등록하세요");
				return false;
			}
			else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "JPEG") {
				alert("업로드 가능한 파일이 아닙니다.");
				return false;
			}
			else if(mainPrice == "" || !regExpPrice.test(mainPrice)) {
				alert("상품금액은 숫자로 입력하세요.");
				return false;
			}
			else if(detail == "") {
				alert("상품의 초기 설명을 입력하세요");
				return false;
			}
			else if(document.getElementById("file").value != "") {
				var maxSize = 1024 * 1024 * 10;  // 10MByte까지 허용
				var fileSize = document.getElementById("file").files[0].size;
				if(fileSize > maxSize) {
					alert("첨부파일의 크기는 10MB 이내로 등록하세요");
					return false;
				}
				else {
					myform.submit();
				}
			}
    }
    
    // 상품 입력창에서 대분류 선택(onChange)시 중분류를 가져와서 중분류 선택박스에 뿌리기
    function categoryMainChange() {
    	var majorCatCode = myform.majorCatCode.value;
			$.ajax({
				type : "post",
				url  : "${ctp}/dbShop/categoryMiddleName",
				data : {majorCatCode : majorCatCode},
				success:function(data) {
					var str = "";
					str += "<option value=''>중분류</option>";
					for(var i=0; i<data.length; i++) {
						str += "<option value='"+data[i].middleCatCode+"'>"+data[i].categoryMiddleName+"</option>";
					}
					$("#middleCatCode").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}
    
    // 중분류 선택시 소분류항목 가져오기
    function categoryMiddleChange() {
    	var majorCatCode = myform.majorCatCode.value;
    	var middleCatCode = myform.middleCatCode.value;
			$.ajax({
				type : "post",
				url  : "${ctp}/dbShop/categorySubName",
				data : {
					majorCatCode : majorCatCode,
					middleCatCode : middleCatCode
				},
				success:function(data) {
					var str = "";
					str += "<option value=''>소분류</option>";
					for(var i=0; i<data.length; i++) {
						str += "<option value='"+data[i].categorySubCode+"'>"+data[i].categorySubName+"</option>";
					}
					$("#categorySubCode").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}
  </script>
</head>
<body>
<br/>
<div class="container">
  <div id="product">
    <h2>상품등록</h2><hr/>
    <form name="myform" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="majorCatCode">대분류</label>
        <select id="majorCatCode" name="majorCatCode" class="form-control sel" onchange="categoryMainChange()">
          <option value="">대분류를 선택하세요</option>
          <c:forEach var="majorCatVO" items="${majorCatVOS}">
          	<option value="${majorCatVO.majorCatCode}">${majorCatVO.majorCatName}</option>
          </c:forEach>
        </select>
      </div>
      <div class="form-group">
        <label for="middleCatCode">중분류</label>
        <select id="middleCatCode" name="middleCatCode" class="form-control sel" onchange="categoryMiddleChange()">
          <option value="">중분류명</option>
		  	  <c:forEach var="middleCatVO" items="${middleCatVOS}">
		  	    <option value=""></option>
		  	  </c:forEach>
        </select>
      </div>
      <div class="form-group">
        <label for="productCode">상품모델명</label>
        <input type="text" name="productCode" id="productCode" class="form-control" placeholder="상품 모델명을 입력하세요" required />
      </div>
      <div class="form-group">
        <label for="file">메인이미지 (업로드 가능파일:jpg, jpeg, gif, png)</label>
        <input type="file" name="file" id="file" class="form-control-file border" accept=".jpg,.gif,.png,.jpeg" required />
      </div>
      <div class="form-group">
      	<label for="productPrice">상품가격</label>
      	<input type="text" name="productPrice" id="productPrice" class="form-control" required />
      </div>
      <div class="form-group">
      	<label for="productName">상품명</label>
      	<input type="text" name="productName" id="productName" class="form-control" required />
      </div>
      <div class="form-group">
      	<label for="productContent">상품상세설명</label>
      	<textarea rows="5" name="productContent" id="CKEDITOR" class="form-control" required></textarea>
      </div>
      <script>
		    CKEDITOR.replace("content",{
		    	uploadUrl:"${ctp}/store/imageUpload",
		    	filebrowserUploadUrl: "${ctp}/store/imageUpload",
		    	height:460
		    });
		  </script>
		  <div style="text-align: center;">
		  	<input type="reset" value="재입력" class="btn btn-secondary"/>
		  	<input type="button" value="상품등록" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
		  </div>
    </form>
  </div>
</div>
<p><br/></p>
</body>
</html>