<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>join.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
  	body {padding-top: 180px;}
  	.container {
  		background-color: #eee;
  	}
  	.joinInput {
  		width: 700px;
  		margin: 0px auto;
  		padding: 30px;
		}
		input[type=text], .sel, input[type=password] {
			border: 1px solid yellowgreen;
			border-radius: 0px;
		}
		th {
			width: 150px;
		}
		#btnJoin {
			display: flex;
			justify-content: space-evenly;
			align-items: center;
		}
		.btnCss {
			color: #fff;
			background-color: #222;
			width: 100px;
			height: 50px;
			border-radius: 2px;
		}
		.btnCss:hover {
			color: #fff;
			opacity: 0.7;
			border: 0;
		}
		.accordion {
		  background-color: #eee;
		  color: #444;
		  cursor: pointer;
		  padding: 18px;
		  width: 100%;
		  border: none;
		  text-align: left;
		  outline: none;
		  font-size: 15px;
		  transition: 0.4s;
		}
		
		.active, .accordion:hover {
		  background-color: #ccc; 
		}
		
		.panel {
		  padding: 0 18px;
		  display: none;
		  background-color: white;
		  overflow: hidden;
		}
		h4 {
			font-weight: bold;
		}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<h1 class="text-center m-5">올리브영 회원가입</h1>
<hr style="margin:0px auto; width:1140px; border:solid 0.5px black;" />
<div class="container">
	<div class="joinInput">
  	<form name="myform" method="post">
  		<div class="row"><h4>기본정보</h4>
  			<div class="col">
		  		<table class="table table-borderless">
		  			<tr>
					  	<th><label for="mid">아이디</label></th>
							<td><input type="text" name="mid" id="mid" placeholder="(영문소문자/숫자 4~16자)" required autofocus class="form-control"/></td>
		  			</tr>
		  			<tr>
					  	<th><label for="pwd">비밀번호</label></th>
							<td><input type="password" name="pwd" id="pwd" placeholder="(영문대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)" required class="form-control"/></td>
		  			</tr>
		  			<tr>
					  	<th><label for="pwdConfirm">비밀번호 확인</label></th>
							<td><input type="password" name="pwdConfirm" id="pwdConfirm" required class="form-control"/></td>
		  			</tr>
		  			<tr>
					  	<th><label for="name">이름</label></th>
							<td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요" required class="form-control"/></td>
		  			</tr>
		  			<tr>
					  	<th><label for="address">주소</label></th>
							<td>
								<div class="input-group mb-1">
					        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
					        <div class="input-group-append">
					          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
					        </div>
					      </div>
					      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
					      <div class="input-group">
					        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
					        <div class="input-group-append">
					          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
					        </div>
					      </div>
							</td>
		  			</tr>
		  			<tr>
					  	<th><label for="tel">휴대전화</label></th>
							<td>
								<div class="input-group">
					        <div class="input-group-prepend">
				            <select name="tel1" class="custom-select sel">
				              <option value="010" selected>010</option>
				              <option value="02">서울</option>
				              <option value="031">경기</option>
				              <option value="032">인천</option>
				              <option value="041">충남</option>
				              <option value="042">대전</option>
				              <option value="043">충북</option>
				              <option value="051">부산</option>
				              <option value="052">울산</option>
				              <option value="061">전북</option>
				              <option value="062">광주</option>
				            </select>-
					        </div>
					        <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
					        <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
					      </div>
							</td>
		  			</tr>
		  			<tr>
					  	<th><label for="email1">이메일</label></th>
							<td>
								<div class="input-group">
									<input type="text" name="email1" id="email1" placeholder="이메일을 입력해주세요" required class="form-control"/>
				          <div class="input-group-append">	
				            <select name="email2" class="custom-select sel">
				              <option value="naver.com" selected>naver.com</option>
				              <option value="hanmail.net">hanmail.net</option>
				              <option value="gmail.com">gmail.com</option>
				              <option value="hotmail.com">hotmail.com</option>
				              <option value="nate.com">nate.com</option>
				            </select>
				          </div>
			          </div>
							</td>
		  			</tr>
		  		</table>
	  		</div>
	  	</div>
  		<div class="row"><h4>이용약관</h4>
  			<div class="col">
	  			<button class="accordion">Section 1</button>
					<div class="panel">
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
  			</div>
  		</div>
  		<div id="btnJoin">
		    <button type="button" class="btn btnCss" onclick="location.href='memberLogin';">돌아가기</button>
				<button type="button" class="btn btnCss" onclick="fCheck()">회원가입</button>
		    <button type="reset" class="btn btnCss">다시작성</button>
  		</div>
	  </form>
	</div>
</div>
<p><br/></p>
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
</body>
</html>