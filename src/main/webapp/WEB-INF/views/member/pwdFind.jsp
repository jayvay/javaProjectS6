<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pwdFind.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	body {padding-top: 250px;}
  	hr {border: 1px solid #343a40; margin-bottom: 40px;}
		h3 {
			font-weight: bold;
			text-align: center; 
			margin-bottom: 30px; 
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
  	}
  </style>
	<script>
	  'use strict';
	
	  function pwdFind() {
	    let mid = $("#mid").val();
	    let name = $("#name").val();
	    let email1 = $("#email1").val();
	    let email2 = $("#email2").val();
	    let email = email1 + "@" + email2;
	
	    if(mid == "" || name == "" || email1 == "") {
	      alert("확인할 회원정보를 입력해주세요.");
	      $("#mid").focus();
	      return false;
	    }
	
	    let query = {
	    		mid : mid,
	    		name : name,
	    		email : email
	    }
	    
	    $.ajax({
	      type : "post",
	      url : "${ctp}/member/pwdFind",
	      data : query,
	      success : function(res) {
	        if(res != "1") {
	          $("#res").html("입력하신 정보로 가입된 회원 아이디는 존재하지 않습니다.");
	        }
	        else {
	          $("#res").html("입력하신 이메일로 임시 비밀번호를 전송했습니다.<br/>임시 비밀번호로 로그인 후 비밀번호를 변경해 주세요.");
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
		<div class="row txtBox">
			<div class="col">
				<h3>비밀번호 찾기</h3><hr/>
		    <div class="row">
		      <div class="col m-2"><input type="text" name="mid" id="mid" placeholder="아이디" class="form-control"/></div>
		    </div>
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
		      <div class="col btn m-2"><button type="button" class="btn btn-dark" onclick="pwdFind()">확인</button></div>
		    </div>
		    <div class="row">
		    	<div class="col">
		    		<div class="res"></div>
		    	</div>
		    </div>
	    </div>
		</div>
	</div>
	<p><br/></p>
</body>
</html>