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
    	let subCatCode = myform.subCatCode.value;
    	let prdBrandName = myform.prdBrandName.value;
    	let prdName = myform.prdName.value;
			let prdPrice = myform.prdPrice.value;
			let file = myform.file.value;	
			let ext = file.substring(file.lastIndexOf(".")+1);
			let uExt = ext.toUpperCase();
			let regExpPrice = /^[0-9|_]*$/;
			
			if(majorCatCode == "") {
				alert("상품 대분류를 입력하세요!");
				return false;
			}
			else if(subCatCode == "") {
				alert("상품 소분류를 입력하세요!");
				return false;
			}
			else if(prdBrandName == "") {
				alert("브랜드명을 입력하세요!");
				return false;
			}
			else if(prdName == "") {
				alert("상품명을 입력하세요!");
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
			else if(prdPrice == "" || !regExpPrice.test(prdPrice)) {
				alert("상품금액은 숫자로 입력하세요.");
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
    
    // 대분류 선택시 소분류 가져오기
    function categorySubChange() {
    	var majorCatCode = myform.majorCatCode.value;
			$.ajax({
				type : "post",
				url  : "${ctp}/adminStore/major_subCatName",
				data : {majorCatCode : majorCatCode},
				success:function(res) {
					var str = "";
					str += "<option value=''>소분류</option>";
					for(var i=0; i<res.length; i++) {
						str += "<option value='"+res[i].subCatCode+"'>"+res[i].subCatName+"</option>";
					}
					$("#subCatCode").html(str);
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
        <select id="majorCatCode" name="majorCatCode" class="form-control sel" onchange="categorySubChange()">
          <option value="">대분류를 선택하세요</option>
          <c:forEach var="majorCatVO" items="${majorCatVOS}">
          	<option value="${majorCatVO.majorCatCode}">${majorCatVO.majorCatName}</option>
          </c:forEach>
        </select>
      </div>
      <div class="form-group">
        <label for="subCatCode">소분류</label>
        <select id="subCatCode" name="subCatCode" class="form-control sel" >
          <option value="">소분류를 선택하세요</option>
		  	  <c:forEach var="subCatVO" items="${subCatVOS}">
		  	    <option value=""></option>
		  	  </c:forEach>
        </select>
      </div>
      <div class="form-group">
        <label for="prdBrandName">브랜드명</label>
        <input type="text" name="prdBrandName" id="prdBrandName" class="form-control" placeholder="브랜드명을 입력하세요" required />
      </div>
      <div class="form-group">
        <label for="file">메인이미지 (업로드 가능파일:jpg, jpeg, gif, png)</label>
        <input type="file" name="file" id="file" class="form-control-file border" accept=".jpg,.gif,.png,.jpeg" required />
      </div>
      <div class="form-group">
      	<label for="prdPrice">상품가격</label>
      	<input type="text" name="prdPrice" id="prdPrice" class="form-control" required />
      </div>
      <div class="form-group">
      	<label for="prdName">상품명</label>
      	<input type="text" name="prdName" id="prdName" class="form-control" required />
      </div>
      <div class="form-group">
      	<label for="prdContent">상품상세설명</label>
      	<textarea rows="5" name="prdContent" id="CKEDITOR" class="form-control" required></textarea>
      </div>
      <script>
		    CKEDITOR.replace("prdContent",{
		    	uploadUrl:"${ctp}/adminStore/detailImgUpload",
		    	filebrowserUploadUrl: "${ctp}/adminStore/detailImgUpload",
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