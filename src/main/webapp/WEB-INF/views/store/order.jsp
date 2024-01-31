<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>order.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
  	body {padding-top: 180px;}
  	.tblImgCell {
			text-align: center;  		
			width:200px;
			background-position: center;
  	}
  	.table td {vertical-align: middle;}
  	th {
  		background-color: #eee;
  	}
  </style>
  <script>
  	'use strict';
  	
  	$(document).ready(function(){
      $(".nav-tabs a").click(function(){
        $(this).tab('show');
      });
      $('.nav-tabs a').on('shown.bs.tab', function(event){
        var x = $(event.target).text();         // active tab
        var y = $(event.relatedTarget).text();  // previous tab
      });
    });
  	
  	
    function order() {
      var paymentCard = document.getElementById("paymentCard").value;
      var paymentBank = document.getElementById("paymentBank").value;
      var payBankName = document.getElementById("payBankName").value;
      
      var tel1 = myform.tel1.value;
      var tel2 = myform.tel2.value;
      var tel3 = myform.tel3.value;
      var tel = tel1 + "-" + tel2 + "-"+ tel3;
      myform.buyer_tel.value = tel;
      
      var postcode = myform.postcode.value;
      var roadAddress = myform.roadAddress.value;
      var detailAddress = myform.detailAddress.value;
      var extraAddress = myform.extraAddress.value;
      var addr = roadAddress + "/" + detailAddress + "/" + extraAddress;
      myform.buyer_postcode.value = postcode;
      myform.buyer_addr.value = addr;
      
      if(paymentCard == "") {
        alert("카드사를 선택하세요.");
        return false;
      }
      else if(paymentBank != "" && payBankName == "") {
        alert("입금할 은행과 입금자명을 입력하세요.");
        return false;
      }
      
      var ans = confirm("결제하시겠습니까?");
      if(ans) {
        if(paymentCard != "") {
          document.getElementById("payment").value = "C" + paymentCard;
        }
        else {
          document.getElementById("payment").value = "B" + paymentBank + "/" + payBankName;
        }
        
        myform.action = "${ctp}/store/payment";
        myform.submit();
      }
    }
  </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<form name="myform" method="post" class="was-validated">
			<h2><b>주문/결제</b></h2>
			<p><br/></p>
			<table class="table table-bordered text-center">
				<tr>
					<th>주문아이디</th>
					<td>${sMid}</td>
					<th>주문날짜</th>
					<td>
						<c:set var="ymd" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</table>
			<p><br/></p>
			<h4>배송지정보</h4>
			<table class="table text-center">
				<tr><td colspan="2" class="p-0 m-0"></td></tr>
				<tr>
					<th>배송방법</th>
					<td>
						<input type="radio" name="addressRadio" value="0" checked> 새로입력 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="addressRadio" value="1"> 회원정보와 동일
					</td>
				</tr>
				<tr>
					<th><label for="name">받는분</label></th>
					<td>
						<div class="form-group">
	            <input type="text" name="buyer_name" id="buyer_name" placeholder="받는 사람의 이름을 입력해 주세요" class="form-control" required />
		        </div>
					</td>
				</tr>
				<tr>
					<th><label for="tel">휴대폰</label><br/></th>
					<td>
						<div class="form-group">
	        		<div class="input-group mb-3">
	        			<div class="input-group-prepend">
			            <select name="tel1" class="custom-select" style="width:200px;">
			              <option value="010" selected>010</option>
			              <option value="02">02</option>
			              <option value="031">031</option>
			              <option value="032">032</option>
			              <option value="033">033</option>
			              <option value="041">041</option>
			              <option value="042">042</option>
			              <option value="043">043</option>
			              <option value="044">044</option>
			              <option value="051">051</option>
			              <option value="052">052</option>
			              <option value="053">053</option>
			              <option value="054">054</option>
			              <option value="055">055</option>
			              <option value="061">061</option>
			              <option value="062">062</option>
			              <option value="063">063</option>
			              <option value="064">064</option>
			            </select>&nbsp;-&nbsp;
				        </div>
				        <input type="text" name="tel2" size=4 maxlength=4 placeholder="3 또는 4자리 숫자" class="form-control" required/>&nbsp;&nbsp;-&nbsp;&nbsp;
				        <input type="text" name="tel3" size=4 maxlength=4 placeholder="3 또는 4자리 숫자" class="form-control" required/>
				   	  </div>
		        </div>
					</td>
				</tr>
				<tr>
					<th><label for="address">주소</label></th>
					<td>
						<div class="form-group">
				      <div class="input-group mb-1">
				        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control" required/>
				        <div class="input-group-append">
				          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-dark">
				        </div>
				      </div>
				      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1" required>
				      <div class="input-group mb-1">
				        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control" required> &nbsp;&nbsp;
				        <div class="input-group-append">
				          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
				        </div>
				      </div>
				    </div>
					</td>
				</tr>
				<tr>
					<th>배송메세지</th>
					<td>
						<div class="form-group">
	            <input type="text" name="delivMsg" id="delivMsg" placeholder="배송시 요청사항을 입력해 주세요" class="form-control" />
		        </div>
		      </td>
				</tr>
				<tr><td colspan="2" class="p-0 m-0"></td></tr>
			</table>
			<p><br/></p>
			<h4>배송상품</h4>
			<table class="table text-center">
				<thead>
				<tr>
					<th colspan="2">상품명</th>
					<th>판매가</th>
					<th>수량</th>
					<th>구매가</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="orderVO" items="${sOrderVOS}">
						<tr>
							<td align="left" class="tblImgCell"><img src="${ctp}/store/product/${orderVO.prodFSName}" width="120px"/></td>
				      <td align="left">
				        <p class="contFont"><br/>
				          <span style="font-weight:bold;">${orderVO.prodName}</span><br/>
				        </p>
				        <p style="font-size:12px">옵션 | ${orderVO.opName}</p>
				      </td>
				      <td><span><fmt:formatNumber value="${orderVO.opPrice}" pattern='#,###원'/></span></td>
				      <td><span>${orderVO.quantity}</span></td>
				      <td><span><fmt:formatNumber value="${orderVO.opTotalPrice}" pattern='#,###원'/></span></td>
						</tr>
					</c:forEach>
				</tbody>
				<tr><td colspan="6" class="p-0 m-0"></td></tr>
			</table>
			<p><br/></p>
			<h4>결제정보</h4>
			<table class="table table-bordered tbl4">
				<thead>
				<tr>
					<th>총 상품금액</th>
					<th>배송비</th>
					<th>최종 결제금액</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<c:set var="totalPrice" value="${sOrderVOS[0].totalPrice}"/>
					<c:set var="delivCharge" value="${sOrderVOS[0].delivCharge}"/>
					<c:set var="payPrice" value="${sOrderVOS[0].payPrice}"/>
					<td><em><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></em> 원 <i class="ri-add-circle-fill"></i></td>
					<td>
						<em><fmt:formatNumber value="${delivCharge}" pattern="#,###"/></em> 원 <i class="ri-add-circle-fill"></i>
					</td>
					<td id="totPr">
						<em><fmt:formatNumber value="${payPrice}" pattern="#,###"/></em> 원
					</td>
				</tr>
				</tbody>
				<tfoot>
				<tr>
					<td>
						<dl>
							<dt>할인</dt>
							<dd><fmt:formatNumber value="0" pattern="#,###"/> 원</dd>
						</dl>
					</td>
					<td></td>
					<td></td>
				</tr>
				</tfoot>
			</table>
			<p><br/></p>
			<h4>결제수단</h4>
	    <!-- Nav tabs -->
	    <ul class="nav nav-tabs" role="tablist">
	      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#card">신용카드</a></li>
	      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#bank">무통장입금</a></li>
	    </ul>
	
	    <!-- Tab panes -->
	    <div class="tab-content">
	      <div id="card" class="container tab-pane active"><br>
	        <table class="table">
		        <tr>
			        <th>카드종류</th>
			        <td>
			          <select name="paymentCard" id="paymentCard" class="custom-select" required>
			            <option value="" selected>카드를 선택해 주세요</option>
		              <option value="kakao">카카오뱅크</option>
		              <option value="sinhan">신한카드</option>
		              <option value="kb">국민카드</option>
		              <option value="nh">농협카드</option>
		              <option value="woori">우리카드</option>
		              <option value="sam">삼성카드</option>
		              <option value="hyun">현대카드</option>
		              <option value="lotte">롯데카드</option>
			          </select>
			        </td>
		        </tr>
	        </table>
	      </div>
	      <div id="bank" class="container tab-pane fade"><br>
	      	<table class="table">
		        <tr>
			        <th>입금은행</th>
			        <td>
			          <select name="paymentBank" id="paymentBank" class="custom-select" required>
		              <option value="">은행을 선택해 주세요</option>
			            <option value="국민은행">국민은행(111-111-111)</option>
			            <option value="신한은행">신한은행(222-222-222)</option>
			            <option value="우리은행">우리은행(333-333-333)</option>
			            <option value="농협">농협(444-444-444)</option>
			            <option value="신협">신협(555-555-555)</option>
			          </select>
			        </td>
		        </tr>
		        <tr>
		        	<th>입금자명</th>
		        	<td><input type="text" name="payBankName" id="payBankName" class="form-control" required/></td></tr>
	        </table>
	      </div>
	    </div>
	    <hr/>
	    <div align="center">
	      <button type="button" class="btn btn-dark" onClick="order()">결제하기</button> &nbsp;
	      <button type="button" class="btn btn-dark" onClick="location.href='${ctp}/store/goodsList';">계속 쇼핑하기</button>
	    </div>
		  <input type="hidden" name="mid" value="${sMid}"/>
		  <input type="hidden" name="payment" id="payment"/>
			<%-- <input type="hidden" name="orderVOS" value="${orderVOS}"/>
		  <input type="hidden" name="orderIdx" value="${orderIdx}"/> --%>
		  <input type="hidden" name="payPrice" value="${payPrice}"/>
		  <input type="hidden" name="prodName" value="${sOrderVOS[0].prodName}"/>
		  <input type="hidden" name="buyer_tel"/>
		  <input type="hidden" name="buyer_postcode"/>
		  <input type="hidden" name="buyer_addr"/>
		  
		</form>
	</div>
</body>
</html>