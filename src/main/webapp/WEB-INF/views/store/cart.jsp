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
  		width: 80px;
  	}
  	form {position: relative; margin-bottom: 60px;}
  	.table td {vertical-align: middle;}
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
  	.btn {border-radius: 2px;}
  	input[type=checkbox] {accent-color: black;}
  </style>
  <script>
  	'use strict';
  	
    function totalPriceCalc() {
	    let totalPrice = 0;
	    let minIdx = parseInt(document.getElementById("minIdx").value);
	    let maxIdx = parseInt(document.getElementById("maxIdx").value);
	    for(let i=minIdx; i<=maxIdx; i++) {
	      if($("#opTotalPrice"+i).length != 0 && document.getElementById("cIdx"+i).checked) { 
	    	  totalPrice = totalPrice + parseInt(document.getElementById("opTotalPrice"+i).value); 
	      }
	    }
	    myform.totalPrice.value = totalPrice;
	    document.getElementById("totalPrice").value = numberWithCommas(totalPrice);
	    
	    let delivCharge = 2500;
      if(totalPrice >= 50000 || totalPrice == 0) delivCharge = 0;
  	  myform.delivCharge.value = delivCharge;
      document.getElementById("delivCharge").value = numberWithCommas(delivCharge);
      
      let payPrice = delivCharge + totalPrice;
      document.getElementById("payPrice").value = payPrice;
      document.getElementById("lastPrice").value = numberWithCommas(payPrice);
    }
    
    function eachProdCheck() {
	    let minIdx = parseInt(document.getElementById("minIdx").value);
	    let maxIdx = parseInt(document.getElementById("maxIdx").value);
      let emptyCnt = 0;
      
      for(let i=minIdx; i<=maxIdx; i++) {
        if($("#cIdx"+i).length != 0 && document.getElementById("cIdx"+i).checked == false){
          emptyCnt++;
          break;
        }
      }
      if(emptyCnt != 0) {
        document.getElementById("allCheck").checked = false;
      } 
      else {
        document.getElementById("allCheck").checked = true;
      }
      totalPriceCalc();
    }
  	
  	function allProdCheck() {
	    let minIdx = parseInt(document.getElementById("minIdx").value);
	    let maxIdx = parseInt(document.getElementById("maxIdx").value);
  		
			if(document.getElementById("allCheck").checked) {
				for(let i=minIdx; i<=maxIdx; i++) {
					if($("#cIdx"+i).length != 0) {
						document.getElementById("cIdx"+i).checked = true;
					}
				}
			}
			else {
				for(let i=minIdx; i<=maxIdx; i++) {
					if($("#cIdx"+i).length != 0) {
						document.getElementById("cIdx"+i).checked = false;
					}
				}
			}
			totalPriceCalc();
		}
  	
    function cartDelete(cIdx) {
      let ans = confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
      if(!ans) return false;
      
      $.ajax({
        type : "post",
        url  : "${ctp}/store/cartDelete",
        data : {cIdx : cIdx},
        success : function() {
          location.reload();
        },
        error : function() {
        	alert("전송 오류");
        }
      });
    }
    
    function order() {
    	let minIdx = parseInt(document.getElementById("minIdx").value);
      let maxIdx = parseInt(document.getElementById("maxIdx").value);
      
      for(let i=minIdx; i<=maxIdx; i++){
        if($("#cIdx"+i).length != 0 && document.getElementById("cIdx"+i).checked){	// 해당 상품이 존재하면서, 체크가 되어 있다면
          document.getElementById("checkedProduct"+i).value="1";		// 선택한 상품은 'checkItem고유번호'의 값을 1로 셋한다.
        }
      }

      //document.myform.delivCharge.value = document.getElementById("delivCharge").value;		// 배송비
      
      if(document.getElementById("lastPrice").value == 0) {
        alert("주문할 상품을 선택해 주세요.");
        return false;
      } 
      else {
    	  let myform = $("#myform");
				myform.attr("action", "${ctp}/store/order");
        document.myform.submit();
      }
    }
    
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  	
  </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
	  <h2 class="text-center">장바구니</h2>
		<br/>
		<form name="myform" id="myform" method="post">
			<table class="table text-center tbl" style="margin: auto; width:90%">
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck" onclick="allProdCheck()" class="m-2"/></th>
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
				      <td><input type="checkbox" name="cIdxChecked" id="cIdx${cartVO.CIdx}" value="${cartVO.CIdx}" onClick="eachProdCheck()" /></td>
							<td align="left" class="tblImgCell"><a href="${ctp}/store/goodsDetail?prodIdx=${cartVO.prodIdx}"><img src="${ctp}/store/product/${cartVO.prodFSName}" width="120px"/></a></td>
				      <td align="left">
				        <p class="contFont">
				          <span style="color:orange;font-weight:bold;"><a href="${ctp}/store/goodsDetail?prodIdx=${cartVO.prodIdx}">${cartVO.prodName}</a></span>
				        </p>
				        <p style="font-size:12px">${cartVO.opName}</p>
				      </td>
				      <td>
				        <div class="text-center">
					        <fmt:formatNumber value="${cartVO.opPrice}" pattern='#,###원'/>
				        </div>
				      </td>
				      <td>${cartVO.quantity}</td>
				      <td>
				        <div class="text-center">
					        <fmt:formatNumber value="${cartVO.opTotalPrice}" pattern='#,###원'/>
					        <input type="hidden" id="opTotalPrice${cartVO.CIdx}" value="${cartVO.opTotalPrice}"/>
				        </div>
				      </td>
				      <td>
				        <button type="button" onClick="cartDelete(${cartVO.CIdx})" class="btn btn-dark btn-sm m-1" style="border:0px;">삭제</button>
				        <input type="hidden" name="checkedProduct" value="0" id="checkedProduct${cartVO.CIdx}"/>	<!-- 구매체크가 되지 않은 품목은 '0'으로, 체크된것은 '1'로 처리하고자 한다. -->
				        <input type="hidden" name="CIdx" value="${cartVO.CIdx}"/>
				        <input type="hidden" name="prodFSName" value="${cartVO.prodFSName}"/>
				        <input type="hidden" name="prodPrice" value="${cartVO.prodPrice}"/>
				        <input type="hidden" name="opName" value="${cartVO.opName}"/>
				        <input type="hidden" name="opPrice" value="${cartVO.opPrice}"/>
				        <input type="hidden" name="quantity" value="${cartVO.quantity}"/>
				        <input type="hidden" name="opTotalPrice" value="${cartVO.opTotalPrice}"/>
				        <input type="hidden" name="mid" value="${sMid}"/>
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
	    <input type="hidden" name="delivCharge"/>
		  <input type="hidden" name="totalPrice"/>
		  <input type="hidden" name="payPrice" id="payPrice"/>
		</form>
		
		<p><br/></p>
		<table class="table table-bordered tbl2" style="margin:auto">
			<thead>
			<tr>
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>결제예정금액</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><em><input type="text" id="totalPrice" value="0" class="totInputBox" readonly/></em>원<i class="ri-add-circle-fill"></i></td>
				<td><em><input type="text" id="delivCharge" value="0" class="totInputBox" readonly/></em>원</td>
				<td id="totPr"><em><input type="text" id="lastPrice" value="0" class="totInputBox" readonly/></em>원</td>
			</tr>
			</tbody>
		</table>
		
		<p><br/></p>
		<div class="text-center">
		  <button class="btn btn-dark" onClick="order()">선택상품주문</button> &nbsp;
		  <button class="btn btn-dark" onClick="location.href='${ctp}/store/goodsList';">쇼핑계속하기</button>
		</div>
	</div>
</body>
</html>