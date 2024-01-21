<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>goodsList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 180px;}
  </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
	  <h2 class="text-center">장바구니</h2>
		<br/>
		<form name="myform" method="post">
			<table class="table-bordered text-center" style="margin: auto; width:90%">
			  <tr class="table-dark text-dark">
			    <th><input type="checkbox" id="allcheck" onClick="allCheck()" class="m-2"/></th>
			    <th colspan="2">상품</th>
			    <th colspan="2">총상품금액</th>
			  </tr>
			    
			  <!-- 장바구니 목록출력 -->
			  <c:forEach var="listVO" items="${cartListVOS}">
			    <tr align="center">
			      <td><input type="checkbox" name="idxChecked" id="idx${listVO.idx}" value="${listVO.idx}" onClick="onCheck()" /></td>
			      <td><a href="${ctp}/dbShop/dbProductContent?idx=${listVO.productIdx}"><img src="${ctp}/dbShop/product/${listVO.thumbImg}" width="150px"/></a></td>
			      <td align="left">
			        <p class="contFont"><br/>
			          모델명 : <span style="color:orange;font-weight:bold;"><a href="${ctp}/dbShop/dbShopContent?idx=${listVO.productIdx}">${listVO.productName}</a></span><br/>
			          <span class="container pl-5 ml-4"><b><fmt:formatNumber value="${listVO.mainPrice}"/>원</b></span>
			        </p><br/>
			        <c:set var="optionNames" value="${fn:split(listVO.optionName,',')}"/>
			        <c:set var="optionPrices" value="${fn:split(listVO.optionPrice,',')}"/>
			        <c:set var="optionNums" value="${fn:split(listVO.optionNum,',')}"/>
			        <p style="font-size:12px">
			          - 주문 내역
			          <c:if test="${fn:length(optionNames) > 1}">(기타품목 ${fn:length(optionNames)-1}개 포함)</c:if><br/>
			          <c:forEach var="i" begin="0" end="${fn:length(optionNames)-1}">
			            &nbsp;&nbsp;ㆍ${optionNames[i]} / <fmt:formatNumber value="${optionPrices[i]}"/>원 / ${optionNums[i]}개<br/>
			          </c:forEach> 
			        </p>
			      </td>
			      <td>
			        <div class="text-center">
				        <b>총 : <fmt:formatNumber value="${listVO.totalPrice}" pattern='#,###원'/></b><br/><br/>
				        <span style="color:#270;font-size:12px" class="buyFont">주문일자 : ${fn:substring(listVO.cartDate,0,10)}</span>
				        <input type="hidden" id="totalPrice${listVO.idx}" value="${listVO.totalPrice}"/>
			        </div>
			      </td>
			      <td>
			        <button type="button" onClick="cartDelete(${listVO.idx})" class="btn btn-danger btn-sm m-1" style="border:0px;">구매취소</button>
			        <input type="hidden" name="checkItem" value="0" id="checkItem${listVO.idx}"/>	<!-- 구매체크가 되지 않은 품목은 '0'으로, 체크된것은 '1'로 처리하고자 한다. -->
			        <input type="hidden" name="idx" value="${listVO.idx }"/>
			        <input type="hidden" name="thumbImg" value="${listVO.thumbImg}"/>
			        <input type="hidden" name="productName" value="${listVO.productName}"/>
			        <input type="hidden" name="mainPrice" value="${listVO.mainPrice}"/>
			        <input type="hidden" name="optionName" value="${optionNames}"/>
			        <input type="hidden" name="optionPrice" value="${optionPrices}"/>
			        <input type="hidden" name="optionNum" value="${optionNums}"/>
			        <input type="hidden" name="totalPrice" value="${listVO.totalPrice}"/>
			        <input type="hidden" name="mid" value="${sMid}"/>
			      </td>
			    </tr>
			  </c:forEach>
			</table>
		  <c:set var="minIdx" value="${cartListVOS[0].idx}"/>						<!-- 구매한 첫번째 상품의 idx -->
		  <c:set var="maxSize" value="${fn:length(cartListVOS)-1}"/>		
		  <c:set var="maxIdx" value="${cartListVOS[maxSize].idx}"/>			<!-- 구매한 마지막 상품의 idx -->
		  <input type="hidden" id="minIdx" name="minIdx" value="${minIdx}"/>
		  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
		  <input type="hidden" name="orderTotalPrice" id="orderTotalPrice"/>
	    <input type="hidden" name="baesong"/>
		</form>
	  <p class="text-center">
	    <b>실제 주문총금액</b>(구매하실 상품에 체크해 주세요. 총주문금액이 산출됩니다.)<br/>
	    5만원 이상 구매하시면 배송비가 면제됩니다.
	  </p>
		<table class="table-borderless text-center" style="margin:auto">
		  <tr>
		    <th>구매상품금액</th>
		    <th></th>
		    <th>배송비</th>
		    <th></th>
		    <th>총주문금액</th>
		  </tr>
		  <tr>
		    <td><input type="text" id="total" value="0" class="totSubBox" readonly/></td>
		    <td>+</td>
		    <td><input type="text" id="baesong" value="0" class="totSubBox" readonly/></td>
		    <td>=</td>
		    <td><input type="text" id="lastPrice" value="0" class="totSubBox" readonly/></td>
		  </tr>
		</table>
		<br/>
		<div class="text-center">
		  <button class="btn btn-primary" onClick="order()">주문하기</button> &nbsp;
		  <button class="btn btn-info" onClick="location.href='${ctp}/dbShop/dbProductList';">계속 쇼핑하기</button>
		</div>
	</div>
</body>
</html>