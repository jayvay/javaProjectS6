<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<style>
.nav {
	margin: 0px auto;
}
.w3-dropdown-content {
	color: #1f1f1f;
	padding:16px; 
	width:700px; 
	border:1px solid #99a1a8; 
	box-shadow:none;
}
</style>

<html>
<body>
	<div class="w3-bar w3-white w3-card justify-content-center nav">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">카테고리 <i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
      	<h6 style="margin:0 15px; padding:0px; text-align:justify;"><b>카테고리</b></h6><hr/>   
      	<div class="row">
      		<div class="col w3-padding-large" style="border-right:1px solid lightgray;">
			      <a href="${ctp}/store/goodsList?majorCatCode=A" class="w3-bar-item w3-button w3-padding-small"><b>스킨케어 ></b></a>
		        <ul style="list-style:none;">
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
		        </ul>
			      <a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small"><b>클렌징 ></b></a>
		        <ul style="list-style:none;">
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
		        </ul>
      		</div>
      		<div class="col w3-padding-large" style="border-right:1px solid lightgray;">
			      <a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small"><b>메이크업 ></b></a>
		        <ul style="list-style:none;">
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
		        </ul>
			      <a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small"><b>선케어 ></b></a>
		        <ul style="list-style:none;">
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
		        </ul>
      		</div>
      		<div class="col w3-padding-large">
			      <a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small"><b>헤어케어 ></b></a>
		        <ul style="list-style:none;">
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
		        </ul>
			      <a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small"><b>바디케어 ></b></a>
		        <ul style="list-style:none;">
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
			        <li><a href="${ctp}/user/userList" class="w3-bar-item w3-button w3-padding-small">UserList1</a></li>
		        </ul>
      		</div>
      	</div>
      </div>
    </div>
    <a href="${ctp}/admin/adminMain" class="w3-bar-item w3-button w3-padding-large">관리자</a>
    <a href="${ctp}/admin/admin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">관리자2</a>
    <a href="${ctp}/board/boardList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">BOARD</a>
    <a href="${ctp}/pds/pdsList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">PDS</a>
		<div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">STUDY2 <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/study/kakao/kakaomap" class="w3-bar-item w3-button">카카오맵</a>
        <a href="${ctp}/study/chart/chart" class="w3-bar-item w3-button">차트연습1</a>
        <a href="${ctp}/study/chart2/chart2" class="w3-bar-item w3-button">차트연습2</a>
        <a href="#" class="w3-bar-item w3-button">스케줄링(Quartz)</a>
        <a href="${ctp}/study/captcha/randomAlphaNumeric" class="w3-bar-item w3-button">랜덤알파뉴메릭</a>
        <a href="${ctp}/study/captcha/captcha" class="w3-bar-item w3-button">캡차연습</a>
        <a href="${ctp}/study/qrCode/qrCode" class="w3-bar-item w3-button">QR코드연습</a>
        <a href="${ctp}/study/thumbnail/thumbnailForm" class="w3-bar-item w3-button">썸네일연습</a>
        <a href="${ctp}/study/crawling/jsoup" class="w3-bar-item w3-button">크롤링(jsoup)</a>
        <a href="${ctp}/study/crawling/selenium" class="w3-bar-item w3-button">크롤링(selenium)</a>
        <a href="${ctp}/study/transaction/transaction" class="w3-bar-item w3-button">트랜잭션연습</a>
        <a href="${ctp}/errorPage/errorMain" class="w3-bar-item w3-button">Error연습</a>
      </div>
    </div>
    <div class="w3-dropdown-hover">
	    <button class="w3-padding-large w3-button" title="More">MyPage <i class="fa fa-caret-down"></i></button>     
	    <div class="w3-dropdown-content w3-bar-block w3-card-4">
	      <a href="${ctp}/user/userList" class="w3-bar-item w3-button">일정관리</a>
	      <a href="${ctp}/user2/user2List" class="w3-bar-item w3-button">회원리스트</a>
	      <a href="${ctp}/member/memberPwdCheck/p" class="w3-bar-item w3-button">비밀번호변경</a>
	      <a href="${ctp}/member/memberUpdate" class="w3-bar-item w3-button">회원정보수정</a>
	      <a href="javascript:memberDelete()" class="w3-bar-item w3-button">회원탈퇴</a>
	      <c:if test="${sLevel == 0}">
	      	<a href="${ctp}/admin/adminMain" class="w3-bar-item w3-button">관리자</a>
	      </c:if>
    	</div>
  	</div>
		<a href="${ctp}/member/logout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
		<a href="${ctp}/member/kakaoLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">카카오Logout</a>
		<!-- offCanvas -->
		<a href="#" class="w3-bar-item w3-button" onclick="openOffCanvas()">추가</a>
		<div class="w3-sidebar w3-bar-block w3-card w3-animate-right" style="display:none; right:0; width: 600px;" id="offCanvas">
			<header style="height:100px;">
	    	<div onclick="closeOffCanvas()" style="margin-left: 3%">쇼핑백<span style="float: right; margin-right: 5%">X</span></div>
			</header>
			<div style="margin-left: 3%; font-weight: lighter;">쇼핑백이 비어 있습니다<br/>7만원 이상 구매 시 무료 배송/제외가 적용됩니다</div>
			<hr/>  
			<footer class="b-footer">
				<button class="w3-button w3-block w3-black" onclick="#"><div class="w3-2" style="color: white;" >계속 쇼핑하기</div></button>
			</footer>
		</div>
		<!-- offCanvas end -->
  </div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">GUEST</a>
	  <a href="${ctp}/board/boardList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">BOARD</a>
	  <a href="${ctp}/pds/pdsList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">PDS</a>
	  <div class="w3-dropdown-hover">
	    <button class="w3-padding-large w3-button" title="More">STUDY1 <i class="fa fa-caret-down"></i></button>     
	    <div class="w3-dropdown-content w3-bar-block w3-card-4">
	      <a href="${ctp}/user/userList" class="w3-bar-item w3-button">UserList1</a>
	      <a href="${ctp}/user2/user2List" class="w3-bar-item w3-button">UserList2</a>
	      <a href="${ctp}/study/ajax/ajaxForm" class="w3-bar-item w3-button">AjaxTest</a>
	      <a href="${ctp}/study/uuid/uidForm" class="w3-bar-item w3-button">랜덤(UUID)</a>
	      <a href="${ctp}/study/password/sha256" class="w3-bar-item w3-button">암호화(SHA256)</a>
	      <a href="${ctp}/study/password/aria" class="w3-bar-item w3-button">암호화(Aria)</a>
	      <a href="${ctp}/study/password/bCryptPassword" class="w3-bar-item w3-button">암호화(Security)</a>
	      <a href="${ctp}/study/mail/mailForm" class="w3-bar-item w3-button">메일연습</a>
	      <a href="${ctp}/study/fileUpload/fileUpload" class="w3-bar-item w3-button">파일업로드</a>
	    </div>
	  </div>
	  <div class="w3-dropdown-hover">
	    <button class="w3-padding-large w3-button" title="More">STUDY2 <i class="fa fa-caret-down"></i></button>     
	    <div class="w3-dropdown-content w3-bar-block w3-card-4">
	      <a href="${ctp}/user/userList" class="w3-bar-item w3-button">test1</a>
	      <a href="${ctp}/user2/user2List" class="w3-bar-item w3-button">test2</a>
	      <a href="#" class="w3-bar-item w3-button">test3</a>
	    </div>
	  </div>
	  	<a href="${ctp}/member/login" class="w3-bar-item w3-button w3-padding-large">Login</a>
	  	<a href="${ctp}/member/join" class="w3-bar-item w3-button w3-padding-large">Join</a>
			<a href="${ctp}/member/logout" class="w3-bar-item w3-button w3-padding-large">Logout</a>
</div>
<script>

function openOffCanvas() {
  document.getElementById("offCanvas").style.display = "block";
}

function closeOffCanvas() {
	  document.getElementById("offCanvas").style.display = "none";
	}
</script>
</body>
</html>