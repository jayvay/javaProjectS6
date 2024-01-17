<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>idFind.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 250px;}
  	
		h3 {
			font-weight: bold;
			text-align: center; 
			margin-bottom: 50px; 
		}
  	
  	input[type=text], .sel {
  		border-radius: 0px;
  		height: 56px;
  	}
  	.btn {
  		width: 100%;
  		height: 60px;
  		border-radius: 0px;
  		text-align: center;
  	}
  	.txtBox {
  		width: 50%;
  		margin: 0 auto;
  		display: flex;
      align-items: stretch;
  	}
  	.tbl {
  		background-color: #f6f6f6;
  		text-align: center;
  	}
  </style>
	<script>
	  'use strict';
	
	  function idFind() {
	    let name = $("#name").val();
	    let email1 = $("#email1").val();
	    let email2 = $("#email2").val();
	    let email = email1 + "@" + email2;
	
	    if(name == "" || email1 == "") {
	      alert("확인할 회원정보를 입력해주세요.");
	      $("#name").focus();
	      return false;
	    }
			
	    let query = {
	    		name : name,
	    		email : email
	    }
	    
	    $.ajax({
	      type : "post",
	      url : "${ctp}/member/idFind",
	      data : query,
	      success : function(res) {
	    	  let mids = res.split("/");
        	let str = ""
        	str += '<table class="table table-borderless tbl">';
        	str += '<tr><td><h5>검색 결과</h5><span style="font-size:10pt;">회원님의 아이디는 </span></td></tr>';
        	str += '<tr>';
	        if(res == "0") {
	        	str += '<td style="padding-bottom:30px;">입력하신 정보로 가입된 회원 아이디가 존재하지 않습니다.</td>';
	        	str += '</tr>';
	        	str += '</table>';
	          $("#res").html(str);
	        }
	        else {
	        	str += '<td>';
	        	for(let i=0; i<mids.length; i++) {
	    				let tempMid = mids[i].substring(0,2);
	    				for(let j=1; j<mids[i].length-1; j++) tempMid += "*";
		    			str += tempMid + '<br/>';
    				}
	        	str += '</td></tr>';
	        	str += '</table>';
	          $("#res").html(str);
	        }
	      },
	      error : function() {
	        alert("전송 오류");
	      }
	    });
	  }
	
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<p><br/></p>
	<div class="container">
		<h3>아이디 찾기</h3>
		<div class="row txtBox">
			<div class="col">
		    <div class="row">
		      <div class="col m-2"><input type="text" name="name" id="name" placeholder="이름" class="form-control"/></div>
		    </div>
		    <div class="row">
		      <div class="input-group col m-2">
		        <input type="text" name="email1" id="email1" placeholder="이메일" required class="form-control"/>
		        <span class="input-group-text">@</span>
		        <div class="input-group-append">	
		          <select name="email2" id="email2" class="custom-select sel">
		            <option value="naver.com" selected>naver.com</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="daum.net">daum.net</option>
		            <option value="hanmail.net">hanmail.net</option>
		            <option value="hotmail.com">hotmail.com</option>
		            <option value="nate.com">nate.com</option>
		          </select>
		        </div>
		      </div>
		  	</div>
		    <div class="row">
		      <div class="col btn m-2"><button type="button" class="btn btn-dark" onclick="idFind()">확인</button></div>
		    </div>
		    <div class="row">
			    <div class="col m-2" id="res">
			    	<br/>
			    	<table class="table table-borderless tbl">
			    		<tr><td><h5>검색 결과</h5><span style="font-size:10pt;">회원님의 아이디는 </span></td></tr>
			    		<tr>
			    			<td><div id="res"></div></td>
			    		</tr>
			    	</table>
			    </div>
		    </div>
	    </div>
		</div>
	</div>
	<p><br/></p>
</body>
</html>