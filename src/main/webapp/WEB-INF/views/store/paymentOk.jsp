<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>paymentOk.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<style>
  	body {padding-top: 180px;}
  </style>
	<script>
		// IMP.init('imp21064327');
		var IMP = window.IMP; 
    IMP.init("imp05878652");
		
		IMP.request_pay({
		    pg : 'html5_inicis.INIpayTest',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${paymentVO.prodName}',
		    amount : '${paymentVO.payPrice}',
		    buyer_name : '${paymentVO.buyer_name}',
		    buyer_tel : '${paymentVO.buyer_tel}',
		    buyer_addr : '${paymentVO.buyer_addr}',
		    buyer_postcode : '${paymentVO.buyer_postcode}'
		}, function(rsp) {
			  var paySw = 'no';
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '\n고유ID : ' + rsp.imp_uid;
		        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		        msg += '\n결제 금액 : ' + rsp.paid_amount;
		        msg += '\n카드 승인번호 : ' + rsp.apply_num;
		        paySw = 'ok';
		    } else {
		        var msg = '결제에 실패하였습니다.<br/>';
		        msg += '에러 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    if(paySw == 'no') {
			    alert("다시 주문구매창으로 이동합니다.");
		    	location.href='${ctp}/store/cart';
		    }
		    else {
					var temp = "";
					temp += '?name=${paymentVO.prodName}';
					temp += '&payPrice=${paymentVO.payPrice}';
					temp += '&buyer_name=${paymentVO.buyer_name}';
					temp += '&buyer_tel=${paymentVO.buyer_tel}';
					temp += '&buyer_addr=${paymentVO.buyer_addr}';
					temp += '&buyer_postcode=${paymentVO.buyer_postcode}';
					temp += '&imp_uid=' + rsp.imp_uid;
					temp += '&merchant_uid=' + rsp.merchant_uid;
					temp += '&paid_amount=' + rsp.paid_amount;
					temp += '&apply_num=' + rsp.apply_num;

					alert("temp:"+ temp);
					location.href='${ctp}/store/paymentResult'+temp;
		    }
		});
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br></p>
<div class="container">
	<hr/>
	<div style="text-align:center;">
	  <h3>현재 결제 진행 중입니다.</h3>
	  <p><img src="${ctp}/images/payment.gif" width="200px"/></p>
  </div>
  <hr/>
</div>
<br/>
</body>
</html>