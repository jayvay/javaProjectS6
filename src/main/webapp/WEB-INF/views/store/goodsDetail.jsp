<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>goodsDetail.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 180px;}
  	img {max-width: 510px; max-height:510px;}
  	.prod_brand {
  		font-size: 16px;
  		line-hight: 24px;
  	}
  	.prod_name {
  		margin-top: 10px;
  		font-size: 26px;
  		line-height: 34px;
  		word-break: normal;
  	}
  	.price {
  		display: flex;
  		margin-top: 15px;
  	}
  	.price-1 {
  		position: relative;
  		margin-right: 12px;
  		font-size: 16px;
  		display: flex;
  		align-items: center;
  	}
  	.price-2 {
  		color: #e02020;
  		font-size: 28px;
  		display: flex;
  		font-weight: 700;
  		align-items: center;
  	}
  	.moreInfo {
  		position: relative;
  		font-size: 16px;
  		margin-bottom: 5px;
  	}
  	.cntBox {
  		position: relative;
			margin: 10px 0 0;
			padding: 15px 20px;
  		border: 1px solid #e9e9e9;
  		background-color: #f9f9f9;
  		border-radius: 5px;
  	}
  	.cntBox2 {
  		position: relative;
			margin: 10px 0 0;
			padding: 15px 20px;
  		border: 1px solid #e9e9e9;
  		background-color: #f9f9f9;
  		border-radius: 5px;
  		height: 90px;
  	}
  	.cnt {
  		position: absolute;
  		bottom: 15px;
  		right: 22px;
  		max-width: 50%;
  	}
  	.cnt2 {
  		position: absolute;
  		display: block;
  		bottom: 13px;
  		left: 18px;
  		max-width: 50%;
  	}
  	.cntOption {
  		display: block;
			max-width: 121px;
			border: 1px solid #e9e9e9;
			border-radius: 5px;
  		overflow: hidden;
  	}
  	.btnCalc {
  		float: left;
  		width: 29px;
  		height: 28px;
  		text-indent: -9999px;
  		outline: none;
  		background: url(https://static.oliveyoung.co.kr/pc-static-root/image/product/ico_calculator.png) 0 50% no-repeat #f5f5f5;
  	}
  	.minus {
  		background-position: 1px 50%;
  		border: 1px solid lightgray;
  	} 
  	.plus {
  		background-position: -32px 50%;
  		border: 1px solid lightgray;
  	}
  	.cntOption input[type=text] {
  		float: left;
  		width: 60px;
  		height: 28px;
  		padding: 0 10px;
  		border: 0;
  		text-align: center;
  	}
  	.optionPrice {
  		position: absolute;
  		width: 120px;
  		bottom: 12px;
  		right: 50px;
  		margin-top: 10px;
  		font-size: 13pt;
  		font-weight: 600;
  		background-color: transparent;
  		border:0px;
      outline: none;
      text-align: end;
  	}
  	.optionTxt {
  		font-size: 10pt;
  		font-weight: 600;
  	}
		.btnOpDelete {
			border:0px;
      outline: none;
      position: absolute;
      right: 22px;
      bottom: 12px;
			/* vertical-align:middle; */
			font-size: 12pt;
			background-color: transparent;
		}
  	.totPriceDiv {
  		overflow: hidden;
  		height: 60px;
  		margin: 10px 0 0;
  		padding: 18px 0 0;
  		color: #e02020;
  		font-weight: 700;
  		border-bottom: 2px solid #f27370;
  	}
  	.totPrc {
  		font-size: 22px;
  		margin-right: 2px;
  		vertical-align: -2px;
  	}
		.totalPrice {
			border:0px;
      outline: none;
			background-color: transparent;
			color: #e02020;
			text-align: end;
		}
  	.btnCart, .btnBuy {
  		width: 140px;
  		height: 65px;
  		font-size: 20px;
  		font-weight: 600px;
  		margin-top: 20px;
  		border: 1px solid #ff5753;
  	}
  	.btnCart {
  		color: #ff5753;
  		background: #fff;
  		margin-right: 20px;
  	}
  	.btnBuy {
  		color: #fff;
  		background: #f27370;
  	}
		.detailMenuClick {
			width:110px;
			height:50px;
			line-height: 50px;
			border-bottom: 2px solid gray;
			font-size: 16px;
		}
		.detailMenu {
			width: 110px;
			height: 50px;
			line-height: 50px;
			font-size: 16px;
			color: yellowgreen;
			/* justify-content: center; */
		}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<div style="overflow: auto;">
	  <div style="float:left; width:510px;">
	  	<div>
	  		<img src="${ctp}/store/product/${prodVO.prodFSName}" />
	  	</div>
	  </div>
	  <div style="float:right; width:450px;">
	  	<div>
	  		<p class="prod_brand"><a href="#">${prodVO.subCatName}&nbsp;<i class="ri-store-line"></i></a></p>
	  		<p class="prod_name">${prodVO.prodName}</p>
	  		<div class="price">
	  			<span class="price-1"><strike>${prodVO.prodPrice}</strike><span>원</span></span>
	  			<span class="price-2"><strong>${prodVO.prodPrice}</strong><span>원</span></span>
	  		</div>
	  		<div class="moreInfo">
	  			<div style="display: table;">
	  				<span style="display: table-cell; font-weight: 700;">배송정보</span>
	  				<span style="width:1px;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	  				<div style="display: table-cell;"> 2,500원(20,000원 이상 무료배송)</div>
					</div>
	  		</div>
	  		<hr/>
	  		
	      <div class="form-group">
	        <form name="optionForm">
	          <select size="1" class="form-control" id="prodOption">
	            <option value="" disabled selected>옵션을 선택해주세요</option>
	            <c:forEach var="opVO" items="${opVOS}">
	              <option value="${opVO.opIdx}:${opVO.opName}_${opVO.opPrice}">${opVO.opName}</option>
	            </c:forEach>
	          </select>
	        </form>
	      </div>
				<div>
	        <form name="myform" id="myform" method="post" >
	          <input type="hidden" name="mid" value="${sMid}"/>
	          <input type="hidden" name="prodIdx" value="${prodVO.prodIdx}"/>
	          <%-- <input type="hidden" name="prodName" value="${prodVO.prodName}"/> --%>
	          <%-- <input type="hidden" name="prodPrice" value="${prodVO.prodPrice}"/> --%>
	          <%-- <input type="hidden" name="prodFSName" value="${prodVO.prodFSName}"/> --%>
	          <!-- <input type="hidden" name="totalPrice" id="totalPriceForm"/> -->
	          <input type="hidden" name="flag" id="flag"/>
	
			      <div id="prodOptionSelect"></div>
	        </form>
	      </div>
	  		
	  		<div class="totPriceDiv">
	  			<span style="float: left; font-size: 18px;">상품금액 합계</span>
	  			<span style="float: right;"><span class="totPrc">
	  				<input type="text" class="totalPrice text-right" id="totalPrice" value="<fmt:formatNumber value='0'/>" readonly />
					</span>원</span>
	  		</div>
	  		<div style="display: flex; justify-content: flex-end;">
	  			<button class="btnCart" onclick="cartAdd()" formaction="${ctp}/">장바구니</button>
	  			<button class="btnBuy" onclick="buyNow()">바로구매</button>
	  		</div>
	  	</div>
	  </div>
  </div>
  <div style="margin-top:100px">
  	<div class="row mt-2 ml-3" style="border-bottom:1px solid lightgray; justify-content: space-evenly;">
	  	<div class="detailMenuClick text-center"><a href="#detail">DETAIL INFO</a></div>
	  	<div class="detailMenu text-center"><a href="#review">REVIEW</a></div>
	  	<div class="detailMenu text-center"><a href="#QnA">NOTICE</a></div>
	  </div>
  	<div class="text-center" style="padding-top:50px;">
  		${prodVO.prodContent}
  	</div>
  </div>
</div>
<p><br/></p>
<script>
	'use strict';
	
/* 		
		<div class="cntBox2">
			<div class="optionTxt">01.크림</div>
			<div class="cnt2">
				<span class="cntOption">
  				<button class="btnCalc minus" onclick="numCalc('m', this)">수량 1감소</button>
  				<input type="text" id="numCalc" name="numCalc" value="1" class="tx_num" title="구매수량">
  				<button class="btnCalc plus" onclick="numCalc('p', this)">수량 1증가</button>
				</span>
			</div>
			<div class="optionPrice">29000원<span><a href=""><font size="5pt"><i class="ri-close-line"></i></font></a></span></div>
		</div>
		 */
	
  let idxArray = new Array();	 
		 
	$("#prodOption").change(function() {
		
		let prodOption = $(this).val();
		let opIdx = prodOption.substring(0, prodOption.indexOf(":"));
		let opName = prodOption.substring(prodOption.indexOf(":")+1, prodOption.indexOf("_"));
		let opPrice = prodOption.substring(prodOption.indexOf("_")+1);
		let opPriceComma = numberWithCommas(opPrice);
		
		if($('#layer'+opIdx).length == 0 && prodOption != "") {
			idxArray[opIdx] = opIdx;
			
			let str = '';
			str += '<div class="cntBox2" id="layer'+opIdx+'">';
			str += '<div class="row optionTxt"><div class="col">'+opName+'</div>';
			str += '<div class="cnt2">';
			str += '<span class="cntOption">';
			str += '<button type="button" class="btnCalc minus" onclick="numPMCalc(\'m\', '+opIdx+', this)">수량 1감소</button>';
			str += '<input type="text" id="quantity" name="quantityArr" value="1" class="tx_num" title="구매수량" readonly>';
			str += '<button type="button" class="btnCalc plus" onclick="numPMCalc(\'p\', '+opIdx+', this)">수량 1증가</button>';
			str += '</span>';
			str += '</div>';
			str += '<input type="text" id="opPriceComma'+opIdx+'" value="'+opPriceComma+'원" class="optionPrice" readonly/>';
			str += '<button type="button" class="btnOpDelete" onclick="removeOption('+opIdx+')"><i class="ri-close-line"></i></button>';
      str += '<input type="hidden" name="opIdxArr" value="'+opIdx+'"/>';
      /* str += '<input type="hidden" name="opName" value="'+opName+'"/>'; */
			str += '<input type="hidden" id="opPrice'+opIdx+'" value="'+opPrice+'"/>';
			str += '<input type="hidden" name="opTotalPriceArr" id="opTotalPriceArr'+opIdx+'" value="'+opPrice+'"/>';
			str += '</div>';
			str += '</div>';
			$("#prodOptionSelect").append(str);
			totPriceCalc();
		}
	});
	
	function numPMCalc(type, opIdx, ths) {
		let inputNum = $(ths).parents("span").find("input[name='quantityArr']");	<!-- 240123 모르겠다.. -->
		let cnt = Number(inputNum.val());
		let opPrice = document.getElementById("opPrice"+opIdx).value;
		
		 if(type == 'p') {
			 inputNum.val(Number(cnt + 1));
			 cnt = Number(cnt + 1);
			 if(cnt > 20) {
				 alert("최대 구매 수량은 20개입니다.");
				 inputNum.val(20);
				 cnt = 20;
			 }
		 }
		 else {
			 if(cnt > 1) {
				 inputNum.val(Number(cnt - 1));
				 cnt = Number(cnt - 1);
			 }
			 else if(cnt <= 1) {
				 alert("최소 구매 수량은 1개입니다.");
				 inputNum.val(1);
				 cnt = 1;
			 }
		 }
		 let opTotalPrice = cnt * opPrice;
		 let opTotalPriceComma = numberWithCommas(opTotalPrice);
		 document.getElementById("opTotalPriceArr"+opIdx).value = opTotalPrice;
		 document.getElementById("opPriceComma"+opIdx).value = opTotalPriceComma + "원";
		 totPriceCalc();
		 
	}
	
	function removeOption(opIdx) {
		$("div").remove("#layer" + opIdx);
		
		if($(".optionPrice").length) totPriceCalc();
		else location.reload();
	}

 	function totPriceCalc() {
		let totPrice = 0;
	  for(let i=0; i<idxArray.length; i++) {
      if($('#layer'+idxArray[i]).length != 0) {
    	  totPrice +=  parseInt((document.getElementById("opPriceComma"+idxArray[i]).value).replace(/,/g , ''));
        /* document.getElementById("totalPriceForm").value = totPrice; */
      }
    }
    document.getElementById("totalPrice").value = numberWithCommas(totPrice);
	}
	
  // 천 단위마다 콤마를 표시해 주는 함수
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
  }
  
  function cartAdd() {
	  if('${sMid}' == "") {
			alert("로그인 후 이용 가능합니다");
			location.href = "${ctp}/member/login";
		}
	  else if(document.getElementById("totalPrice").value == 0) {
			alert("필수 옵션을 선택해주세요");
			return false;
		}
		else {
			let ans = confirm("장바구니에 상품이 정상적으로 담겼습니다. 장바구니로 이동하시겠습니까?");
			if(ans) document.getElementById("flag").value = "goCart";
			/* else document.getElementById("flag").value = "stay"; */
			
			document.myform.submit();
		}
	}

	function buyNow() {
		let totalPrice = document.getElementById("totalPrice").value;
		if('${sMid}' == "") {
			alert("로그인 후 이용 가능합니다");
			location.href = "${ctp}/member/login";
		}
		else if(totalPrice == "" || totalPrice == 0) {
			alert("필수 옵션을 선택해주세요");
			return false;
		}
		else {
			document.getElementById("flag").value = "order";
			
			let myform = $("#myform");
			myform.attr("action", "${ctp}/store/buyNow");
			document.myform.submit();
		}
	}
</script>
</body>
</html>