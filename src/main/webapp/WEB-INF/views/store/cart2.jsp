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
			  <c:forEach var="cartVO" items="${cartVOS}">
			    <tr align="center">
			      <td><input type="checkbox" name="idxChecked" id="idx${cartVO.cIdx}" value="${cartVO.cIdx}" onClick="onCheck()" /></td>
			      <td><a href="${ctp}/store/goodsDetail?idx=${cartVO.prdIdx}"><img src="${ctp}/store/product/${cartVO.prdThumbnail}" width="150px"/></a></td>
			      <td align="left">
			        <p class="contFont"><br/>
			          모델명 : <span style="color:orange;font-weight:bold;"><a href="${ctp}/store/goodsDetail?idx=${cartVO.prdIdx}">${cartVO.prdName}</a></span><br/>
			          <span class="container pl-5 ml-4"><b><fmt:formatNumber value="${cartVO.prdPrice}"/>원</b></span>
			        </p><br/>
			        <%-- 
			        <c:set var="optionNames" value="${fn:split(cartVO.optionName,',')}"/>
			        <c:set var="optionPrices" value="${fn:split(cartVO.optionPrice,',')}"/>
			        <c:set var="optionNums" value="${fn:split(cartVO.optionNum,',')}"/>
			         --%>
			        <p style="font-size:12px">
			          <%-- 
			          <c:if test="${fn:length(optionNames) > 1}">(기타품목 ${fn:length(optionNames)-1}개 포함)</c:if><br/>
			          <c:forEach var="i" begin="0" end="${fn:length(optionNames)-1}">
			            &nbsp;&nbsp;ㆍ${optionNames[i]} / <fmt:formatNumber value="${optionPrices[i]}"/>원 / ${optionNums[i]}개<br/>
			          </c:forEach> 
			           --%>
			          [옵션 : ${cartVO.opName}]
			        </p>
			      </td>
			      <td>
			        <div class="text-center">
				        <b>총 : <fmt:formatNumber value="${cartVO.totalPrice}" pattern='#,###원'/></b><br/><br/>
				        <span style="color:#270;font-size:12px" class="buyFont">주문일자 : ${fn:substring(cartVO.cartDate,0,10)}</span>
				        <input type="hidden" id="totalPrice${cartVO.cIdx}" value="${cartVO.totalPrice}"/>
			        </div>
			      </td>
			      <td>
			        <button type="button" onClick="cartDelete(${cartVO.cIdx})" class="btn btn-danger btn-sm m-1" style="border:0px;">구매취소</button>
			        <input type="hidden" name="checkItem" value="0" id="checkItem${cartVO.cIdx}"/>	<!-- 구매체크가 되지 않은 품목은 '0'으로, 체크된것은 '1'로 처리하고자 한다. -->
			        <input type="hidden" name="cIdx" value="${cartVO.cIdx }"/>
			        <input type="hidden" name="thumbImg" value="${cartVO.thumbImg}"/>
			        <input type="hidden" name="prdName" value="${cartVO.prdName}"/>
			        <input type="hidden" name="mainPrice" value="${cartVO.mainPrice}"/>
			        <input type="hidden" name="optionName" value="${optionNames}"/>
			        <input type="hidden" name="optionPrice" value="${optionPrices}"/>
			        <input type="hidden" name="optionNum" value="${optionNums}"/>
			        <input type="hidden" name="totalPrice" value="${cartVO.totalPrice}"/>
			        <input type="hidden" name="mid" value="${sMid}"/>
			      </td>
			    </tr>
			  </c:forEach>
			</table>
		  <c:set var="minIdx" value="${cartVOS[0].cIdx}"/>						<!-- 구매한 첫번째 상품의 idx -->
		  <c:set var="maxSize" value="${fn:length(cartVOS)-1}"/>		
		  <c:set var="maxIdx" value="${cartVOS[maxSize].cIdx}"/>			<!-- 구매한 마지막 상품의 idx -->
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