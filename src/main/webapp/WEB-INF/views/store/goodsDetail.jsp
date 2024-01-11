<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  	.prd_brand {
  		font-size: 16px;
  		line-hight: 24px;
  	}
  	.prd_name {
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
  	.cnt {
  		position: absolute;
  		bottom: 15px;
  		right: 22px;
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
  	.totalPrice {
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
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <div style="float:left; width:510px;">
  	<div>
  		<img src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0019/A00000019810902ko.jpg?l=ko"/>
  	</div>
  </div>
  <div style="float:right; width:450px;">
  	<div>
  		<p class="prd_brand"><a href="#">피지오겔&nbsp;<i class="ri-store-line"></i></a></p>
  		<p class="prd_name">[더블기획] 피지오겔 DMT 페이셜 크림 100ml+100ml 증정 기획</p>
  		<div class="price">
  			<span class="price-1"><strike>59,000</strike><span>원</span></span>
  			<span class="price-2"><strong>29,000</strong><span>원</span></span>
  		</div>
  		<div class="moreInfo">
  			<div style="display: table;">
  				<span style="display: table-cell; font-weight: 700;">배송정보</span>
  				<span style="width:1px; height:10px; border-right: 1px solid gray;"></span>
  				<div style="display: table-cell;"> 2,500원(20,000원 이상 무료배송)</div>
				</div>
  		</div>
  		<hr/>
      <div class="form-group">
        <form name="optionForm">
          <select size="1" class="form-control" id="prdOption">
            <option value="" disabled selected>상품옵션선택</option>
            <option value="0:기본품목_${productVO.mainPrice}">기본품목</option>
            <c:forEach var="vo" items="${optionVOS}">
              <option value="${vo.opIdx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}</option>
            </c:forEach>
          </select>
        </form>
      </div>
  		
  		<div class="cntBox">
  			<div>구매수량</div>
  			<div class="cnt">
  				<span class="cntOption">
	  				<button class="btnCalc minus" onclick="numCalc('m', this)">수량 1감소</button>
	  				<input type="text" id="numCalc" name="numCalc" value="1" class="tx_num" title="구매수량">
	  				<button class="btnCalc plus" onclick="numCalc('p', this)">수량 1증가</button>
  				</span>
  			</div>
  		</div>
  		
  		<div class="totalPrice">
  			<span style="float: left; font-size: 18px;">상품금액 합계</span>
  			<span style="float: right;"><span class="totPrc">28,900</span>원</span>
  		</div>
  		<div style="display: flex; justify-content: flex-end;">
  			<button class="btnCart" onclick="">장바구니</button>
  			<button class="btnBuy" onclick="">바로구매</button>
  		</div>
  	</div>
  	<hr/>
  	<div></div>
  </div>
</div>
<p><br/></p>
<script>
	'use strict';
	
	function numCalc(type, ths) {
		let inputNum = $(ths).parents("span").find("input[name='numCalc']");
		let cnt = Number(inputNum.val());
		
		 if(type == 'p') {
			 inputNum.val(Number(cnt + 1));
		 }
		 else {
			 if(cnt > 0) inputNum.val(Number(cnt - 1));
		 }
	}
	
	$("#prdOption").change(function() {
		let prdOption = $(this).val();
		let idx = prdOption.substring(0, prdOption.indexOf(":"));
		let optionName = prdOption.substring(prdOption.indexOf(":")+1, prdOption.indexOf("_"));
		let optionPrice = prdOption.substring(prdOption.indexOf("_")+1);
		let comma = numberWithCommas(optionPrice);
		
		if($('#layer'+idx).length == 0 && prdOption != "") {
			idxArray[idx] = idx;
			
			let str = '';
			str += '<div class="cntBox">';
			str += '<div class="layer row" id="layer"'+idx+'"><div class="col">'+optionName+'</div>';
			str += '<div class="cnt">';
			str += '<span class="cntOption">';
			str += '<button class="btnCalc minus" onclick="numCalc('m', this)">수량 1감소</button>';
			str += '<input type="text" id="numCalc" name="numCalc" value="1" class="tx_num" title="구매수량">';
			str += '<button class="btnCalc plus" onclick="numCalc('p', this)">수량 1증가</button>';
			str += '</span>';
			str += '<input type="button" class="btn btn-outline-danger btn-sm" onclick="remove('+idx+')" value="삭제"/>';
			str += '</div>';
			str += '</div>';
			
			
		}
			
	});
	
  // 천 단위마다 콤마를 표시해 주는 함수
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
  }
</script>
</body>
</html>