<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>cart.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 180px;}
  	
  	input[type=text] {
  		border: 0px;
  		outline: none;
  		background-color: transparent;
  		width: 100px;
  	}
  	form {position: relative; margin-bottom: 60px;}
  	th {
  		background-color: #eee;
  		border-bottom: 1px solid black;
  	}
  	.tblImgCell {
			text-align: center;  		
			width:120px;
			background-position: center;
			line-height:
  	}
  	.cartNone {
  		margin-top: 10px;
  		text-align: center;
  		position: absolute;
  		right: 55px;
  	}
  	input[type=checkbox] {accent-color: black;}
  </style>
  <script>
  	'use strict';
  	
  	function onCheck() {
			
		}
  	
  </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
	  <h2 class="text-center">장바구니</h2>
		<br/>
		<form name="myform" method="post">
			<table class="table text-center tbl" style="margin: auto; width:90%">
				<thead>
					<tr>
						<th><input type="checkbox" id="allcheck" onClick="allCheck()" class="m-2"/></th>
						<th colspan="2">상품정보</th>
						<th>판매가</th>
						<th>수량</th>
						<th>합계</th>
						<th>비고</th>
					</tr>
				</thead>  
			  <!-- 장바구니 목록출력 -->
			  <tbody>
				  <c:forEach var="cartVO" items="${cartVOS}">
				    <tr align="center">
				      <td><input type="checkbox" name="idxChecked" id="idx${cartVO.CIdx}" value="${cartVO.CIdx}" onClick="onCheck()" /></td>
							<td align="left" class="tblImgCell"><a href="${ctp}/store/goodsDetail?prodIdx=${cartVO.prodIdx}"><img src="${ctp}/store/product/${cartVO.prodFSName}" width="120px"/></a></td>
				      <td align="left">
				        <p class="contFont"><br/>
				          <span style="color:orange;font-weight:bold;"><a href="${ctp}/store/goodsDetail?prodIdx=${cartVO.prodIdx}">${cartVO.prodName}</a></span><br/>
				        </p><br/>
				        <p style="font-size:12px">${cartVO.opName}</p>
				      </td>
				      <td>
				        <div class="text-center">
					        <fmt:formatNumber value="${cartVO.opPrice}" pattern='#,###원'/><br/><br/>
				        </div>
				      </td>
				      <td>${cartVO.quantity}</td>
				      <td>
				        <div class="text-center">
					        <fmt:formatNumber value="${cartVO.opTotalPrice}" pattern='#,###원'/><br/><br/>
					        <input type="hidden" id="opTotalPrice${cartVO.CIdx}" value="${cartVO.opTotalPrice}"/>
				        </div>
				      </td>
				      <td>
				        <button type="button" onClick="cartDelete(${cartVO.CIdx})" class="btn btn-dark btn-sm m-1" style="border:0px;">삭제</button>
				       <%--  <input type="hidden" name="checkItem" value="0" id="checkItem${cartVO.CIdx}"/>	<!-- 구매체크가 되지 않은 품목은 '0'으로, 체크된것은 '1'로 처리하고자 한다. -->
				        <input type="hidden" name="CIdx" value="${cartVO.CIdx}"/>
				        <input type="hidden" name="thumbImg" value="${cartVO.prodFSName}"/>
				        <input type="hidden" name="mainPrice" value="${cartVO.prodPrice}"/>
				        <input type="hidden" name="optionName" value="${opName}"/>
				        <input type="hidden" name="optionPrice" value="${optionPrices}"/>
				        <input type="hidden" name="optionNum" value="${optionNums}"/>
				        <input type="hidden" name="totalPrice" value="${cartVO.totalPrice}"/>
				        <input type="hidden" name="mid" value="${sMid}"/> --%>
				      </td>
				    </tr>
				  </c:forEach>
			  </tbody>
			  <tfoot>
			  	<tr><td colspan="7" class="text-right">50,000원 이상 구매시 배송비 무료</td></tr>
			  </tfoot>
			</table>
			<button type="button" class="btn btn-dark btn-sm cartNone">장바구니 비우기</button>
			
		  <c:set var="minIdx" value="${cartVOS[0].CIdx}"/>						<!-- 구매한 첫번째 상품의 idx -->
		  <c:set var="maxSize" value="${fn:length(cartVOS)-1}"/>		
		  <c:set var="maxIdx" value="${cartVOS[maxSize].CIdx}"/>			<!-- 구매한 마지막 상품의 idx -->
		  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
		  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
		  <input type="hidden" name="orderTotalPrice" id="orderTotalPrice"/>
	    <input type="hidden" name="baesong"/>
		</form>
		
		<p><br/></p>
		<table class="table table-bordered tbl2" style="margin:auto">
			<thead>
			<tr>
				<th>총 상품금액</th>
				<th>총 추가금액</th>
				<th>최종 결제금액</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><em><input type="text" id="total" value="0" class="totSubBox" readonly/></em> <i class="ri-add-circle-fill"></i></td>
				<td><em><input type="text" id="baesong" value="0" class="totSubBox" readonly/></em> 원</td>
				<td id="totPr"><em><input type="text" id="lastPrice" value="0" class="totSubBox" readonly/></em></td>
			</tr>
			</tbody>
		</table>
		
		<p><br/></p>
		<div class="text-center">
		  <button class="btn btn-dark" onClick="order()">주문하기</button> &nbsp;
		  <button class="btn btn-dark" onClick="location.href='${ctp}/store/goodsList';">쇼핑 계속하기</button>
		</div>
	</div>
</body>
</html>