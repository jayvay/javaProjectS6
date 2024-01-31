<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>paymentResult.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <style>
  	body {padding-top: 180px;}
  	h2, h5 {text-align: center;}
  	.btn {border-radius: 2px;}
  	.table td {vertical-align: middle;}
  	.table tr {border-bottom: 1px solid gray;}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br></p>
<div class="container">
  <h2>주문이 완료되었습니다</h2>
  <h5><c:set var="orderIdx" value="${sOrderVOS[0].orderIdx}" />주문번호 : ${orderIdx}</h5>
  <hr/>
  <table class="table table-borderless tbl">
    <tr style="text-align:center;background-color:#ccc;">
      <th colspan="4">주문상품</th>
    </tr>
    <c:forEach var="orderVO" items="${sOrderVOS}">
      <tr>
        <td style="text-align:center;">
          <img src="${ctp}/store/product/${orderVO.prodFSName}" width="120px"/>
        </td>
        <td align="left">
	        <p><br/>상품명 : <span style="font-weight:bold;">${orderVO.prodName}</span><br/></p>
	        <p>옵션 : ${orderVO.opName}</p>
	        <p>수량 : ${orderVO.quantity} 개</p>
	      </td>
        <td style="text-align:center;">
          <p>총 상품금액 : <fmt:formatNumber value="${orderVO.opTotalPrice}"/>원</p>
        </td>
        <td style="text-align:center;">결제완료</td>
      </tr>
    </c:forEach>
  </table>
  <hr/>
  <div class="text-center">
  	<c:set var="payPrice" value="${sOrderVOS[0].payPrice}"/>
    총 결제금액 (배송비 포함) : <fmt:formatNumber value="${payPrice}"/> 원
  </div>
  <hr/>
  <p class="text-center">
    <a href="${ctp}/store/goodsList" class="btn btn-dark">계속쇼핑하기</a> &nbsp;
    <a href="${ctp}/store/myOrder" class="btn btn-dark">구매내역보기</a>
  </p>
</div>
<br/>
</body>
</html>