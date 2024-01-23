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
  <title>storeProductOptionInput.jsp</title>
  <style>
  	a {text-decoration: none; color: black;}
  	a:hover {text-decoration: none; color: red;}
  	.sel {
  		border-radius: 0px;
  	}
  	.addOption {
  		padding: 20px;
  		border: 1px solid gray;
  		background-color: #f6f6f6;
  	}
  	.addbtn {
  		height: 25px;
  		line-height: 10px;
  		border-radius: 1px;
  	}
  	.inputBtn {
  		width: 100px;
			height: 50px;  		
  		border-radius: 0px;
  	}
  	.optionPreview {
  		margin : 10px;
  	}
  	.bgRow {
  		border: 1px solid gray;
  	}
  	
  </style>
  <script>
  	'use strict';
    let cnt = 1;
    
    // 옵션항목 추가
    function addOption() {
    	let strOption = "";
    	let test = "t" + cnt; 
    	
    	strOption += '<div id="'+test+'" class="addOption">';
    	strOption += '<font size="4"><b>옵션 추가</b></font>&nbsp;&nbsp;&nbsp;';
    	strOption += '<input type="button" value="삭제" class="btn btn-outline-danger btn-sm addbtn" onclick="removeOption('+test+')"/><hr/>'
    	strOption += '상품옵션명';
    	strOption += '<input type="text" name="opName" id="opName'+cnt+'" class="form-control m-1"/>';
    	strOption += '<div class="form-group">';
    	strOption += '상품옵션가격';
    	strOption += '<input type="text" name="opPrice" id="opPrice'+cnt+'" class="form-control m-1"/>';
    	strOption += '</div>';
    	strOption += '</div>';
    	strOption += '<br/>';
    	$("#optionType").append(strOption);
    	cnt++;
    }
    
    // 옵션항목 삭제
    function removeOption(test) {
    	/* $("#"+test).remove(); */
    	$("#"+test.id).remove();
    }
    
    // 옵션 입력후 등록전송
    function fCheck() {
    	for(let i=1; i<=cnt; i++) {
    		if($("#t"+i).length != 0 && document.getElementById("opName"+i).value=="") {
    			alert("상품 옵션명을 모두 입력하셔야 합니다");
    			return false;
    		}
    		else if($("#t"+i).length != 0 && document.getElementById("opPrice"+i).value=="") {
    			alert("상품 옵션 가격을 모두 입력하셔야 합니다");
    			return false;
    		}
    	}
    	if(document.getElementById("opName").value=="") {
    		alert("상품 옵션이름을 입력하세요");
    		return false;
    	}
    	else if(document.getElementById("opPrice").value=="") {
    		alert("상품 옵션가격을 입력하세요");
    		return false;
    	}
    	else if(document.getElementById("prodName").value=="") {
    		alert("상품명을 선택하세요");
    		return false;
    	}
    	else {
    		myform.submit();
    	}
    }
    
    // 상품 입력창에서 대분류 선택(Change)시 소분류 가져오기
    function subCatChange() {
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
    
    // 상품 입력창에서 소분류 선택(Change)시 해당 상품들을 가져와서 품목 선택박스에 뿌리기
    function productChange() {
    	var majorCatCode = myform.majorCatCode.value;
    	var subCatCode = myform.subCatCode.value;
			$.ajax({
				type : "post",
				url  : "${ctp}/adminStore/sub_productName",
				data : {
					majorCatCode : majorCatCode,
					subCatCode : subCatCode
				},
				success:function(res) {
					var str = "";
					str += "<option value=''>상품명(상품코드)</option>";
					for(var i=0; i<res.length; i++) {
						str += "<option value='"+res[i].prodCode+"'>"+res[i].prodName+"</option>";
					}
					$("#prodName").html(str);
				},
				error : function() {
					alert("전송오류!");
				}
			});
  	}
    
    // 상품명을 선택하면 상품의 설명을 띄워준다.
    function productNameCheck() {
    	var prodName = document.getElementById("prodName").value;
    	$.ajax({
    		type:"post",
    		url : "${ctp}/adminStore/getProductInfo",
    		data: {prodName : prodName},
    		success:function(vo) {
    			let str = '<div class="row">';
    			str += '<div class="col">';
    			str += '<img src="${ctp}/store/product/'+vo.prodFSName+'" width="220px" height="220px"/><br/>';
    			str += '</div>';
    			str += '<div class="col">';
    			str += '<div class="optionPreview"><b>대분류명 ></b> '+vo.majorCatName+'</div>';
    			str += '<div class="optionPreview"><b>소분류명 ></b> '+vo.subCatName+'</div>';
    			str += '<div class="optionPreview"><b>상품코드 ></b> '+vo.prodCode+'</div>';
    			str += '<div class="optionPreview"><b>상품명	></b> '+vo.prodName+'</div>';
    			str += '<div class="optionPreview"><b>상품가격 ></b> '+numberWithCommas(vo.prodPrice)+'원</div>';
    			str += '<input type="button" value="옵션보기(삭제)" onclick="optionShow('+vo.prodIdx+')" class="btn btn-dark btn-sm optionPreview"/><br/>';
    			str += '</div>';
    			str += '<div class="col">';
    			str += '<div id="optionDemo"></div>';
    			str += '</div>';
    			str += '</div>';
    			$("#demo").css({
    				"margin-top" : "20px",
    				"padding": "30px",
    	  		"border": "1px solid gray",
    	  		"background-color": "#f6f6f6"});
    			$("#demo").html(str);
    			document.myform.prodIdx.value = vo.prodIdx;
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 옵션상세내역보기
    function optionShow(prodIdx) {
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/adminStore/getOptionList",
    		data : {prodIdx : prodIdx},
    		success:function(vos) {
    			let str = '<div class="optionPreview"><b>옵션목록</b></div>';
    			if(vos.length != 0) {
	    			for(let i=0; i<vos.length; i++) {
							str += '<div>' + vos[i].opName;
	    				str += '<a href="javascript:optionDelete('+vos[i].opIdx+')"><font size="4"><i class="ri-delete-bin-5-fill"></i></font></a></div>';
	    			}
    			}
    			else {
    				str = "현 상품에 등록된 옵션이 없습니다.";
    			}
					$("#optionDemo").html(str);
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 옵션항목 삭제하기
    function optionDelete(opIdx) {
    	let ans = confirm("현재 선택한 옵션을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/adminStore/optionDelete",
    		data : {opIdx : opIdx},
    		success:function() {
    			alert("삭제되었습니다.");
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 콤마찍기
    function numberWithCommas(x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>상품 옵션 등록</h2><hr/>
  <form name="myform" method="post">
    <div class="form-group">
      <label for="majorCatCode">대분류</label>
      <select id="majorCatCode" name="majorCatCode" class="form-control sel" onchange="subCatChange()">
        <option value="">대분류를 선택하세요</option>
        <c:forEach var="majorCatVO" items="${majorCatVOS}">
        	<option value="${majorCatVO.majorCatCode}">${majorCatVO.majorCatName}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <label for="subCatCode">소분류</label>
      <select id="subCatCode" name="subCatCode" class="form-control sel" onchange="productChange()">
     		<option value="">소분류를 선택하세요</option>
        <c:forEach var="subCatVO" items="${subCatVOS}">
        	<option value="${subCatVO.subCatCode}">${subCatVO.subCatName}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <label for="prodName">상품모델명</label>
      <select name="prodName" id="prodName" class="form-control sel" onchange="productNameCheck()">
        <option value="">상품선택</option>
        <c:forEach var="prodCodeVO" items="${prodCodeVOS}">
        	<option value="${prodCodeVO.prodCode}">${prodCodeVO.prodName}</option>
        </c:forEach>
      </select>
      <div id="demo"></div>
    </div>
    <br/>
    <div class="addOption">
	    <font size="4"><b>옵션 추가</b></font>&nbsp;&nbsp;
	    <input type="button" value="옵션박스추가" onclick="addOption()" class="btn btn-secondary btn-sm addbtn"/><hr/>
	    <div class="form-group">
	      <label for="opName">상품옵션명</label>
	      <input type="text" name="opName" id="opName" class="form-control"/>
	    </div>
	    <div class="form-group">
	      <label for="opPrice">상품옵션가격</label>
	      <input type="text" name="opPrice" id="opPrice" class="form-control"/>
	    </div>
    </div><br/>
    <div id="optionType"></div>
    <div style="text-align: center;"><hr/>
	  	<input type="button" value="옵션등록" onclick="fCheck()" class="btn btn-secondary inputBtn"/>
	  </div>
    <input type="hidden" name="prodIdx">
  </form>
</div>
<p><br/></p>
</body>
</html>