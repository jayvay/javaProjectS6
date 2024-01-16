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
		h4 {
			font-weight: bold;
		}
		.inputCheck {
			font-size: 8pt;
			color: red;
		}
  </style>
  <script>
  	'use strict';
  	
  	let idCheckSw = 0;
  	let pwdCheckSw = 0;
  	
  	function fCheck() {
			let submitFlag = 0;
			
			//let regMid = /^[a-z0-9_]{4,15}$/; 영어/숫자/언더바 조합의 4~15자리
			let regMid = let regMid = /^(?=.*[a-z])[a-z0-9_]{4,15}$/; // 영어/숫자/언더바 조합의 4~15자리
			let regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/; // 영어/숫자/특수문자 각 최소 1자 이상 조합의 6~15자리
			let regName = /^[a-zA-Z가-힣]{2,20}$/; //영어 한글로 이루어진 2~20자
			let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
			
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value.trim();
    	let pwdConfirm = myform.pwdConfirm.value.trim();
    	let name = myform.name.value.trim();
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	let agree1 = document.getElementById("agree1").checked;
    	let agree2 = document.getElementById("agree2").checked;	//agree 하나로 묶으려고 함!!!240116_2326
			
    	let postcode = myform.postcode.value + " ";
    	let roadAddress = myform.roadAddress.value + " ";
    	let detailAddress = myform.detailAddress.value + " ";
    	let extraAddress = myform.extraAddress.value + " ";
  		
  		if(!regMid.test(mid)) {
  			alert("아이디를 형식에 맞게 입력해주세요.");
  			myform.mid.focus();
  			return false;
  		}
  		else if(!regPwd.test(pwd)) {
  			alert("비밀번호를 형식에 맞게 입력해주세요.");
  			myform.pwd.focus();
  			return false;
  		}
  		else if(pwd != pwdConfirm) {
  			alert("비밀번호가 일치하지 않습니다.");
  			myform.pwd.focus();
  			return false;
  		}
  		else if(!regName.test(name)) {
  			alert("이름을 형식에 맞게 입력해주세요.");
  			myform.name.focus();
  			return false;
  		}
  		else if(postcode.trim() == "" || roadAddress.trim() == "") {
	  		alert("주소를 입력해주세요.");
	  		myform.postcode.focus();
	  		return false;
	  	}
  		else if(!regTel.test(tel)) {
  			alert("전화번호 형식에 맞게 입력해주세요. 예)010-1234-5678");
  			myform.tel2.focus();
  			return false;
  		}
  		else if(!regEmail.test(email)) {
  			alert("이메일 형식에 맞게 입력해주세요.");
  			myform.email.focus();
  			return false;
  		}
  		else if(agree1 == false || agree2 == false) {
				alert("필수 이용 약관에 모두 동의해주세요.");  			
				return false;
  		}
  		else submitFlag = 1;
  		
  		if(submitFlag == 1 && idCheckSw == 1 && pwdCheckSw == 1) {
  			myform.email.value = email;
    		myform.tel.value = tel;
  			myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
    		
	    	myform.submit();
  		}
		}
  	
  	function idCheck() {
  		/* let regMid = /^[a-z0-9_]{4,15}$/; */
  		let regMid = /^(?=.*[a-z])[a-z0-9_]{4,15}$/;
			let mid = myform.mid.value;
			if(!regMid.test(mid)) {
				$("#midRegCheck").html('<font color="red">아이디를 형식에 맞게 입력해주세요.</font>');
				idCheckSw = 0;
			}
			else {
				$.ajax({
					type : "post",
					url : "${ctp}/member/join/idOverlapCheck",
					data : {mid : mid},
					success : function(res) {
						if(res == "1") {
							$("#midRegCheck").html('<font color="red">이미 사용중인 아이디 입니다.</font>');
							idCheckSw = 0;
						}
						else {
							$("#midRegCheck").html('<font color="green">사용 가능한 아이디 입니다.</font>');
							idCheckSw = 1;
						}
					},
					error : function() {
						alert("전송오류!")
					}					
				});
			}
		}
  	
  	function pwdCheck() {
			let regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
			let pwd = myform.pwd.value;
			let pwdConfirm = myform.pwdConfirm.value.trim();
			if(!regPwd.test(pwd)) {
				$("#pwdRegCheck").html('<font color="red">비밀번호를 형식에 맞게 입력해주세요.</font>');
			}
			else {
				$("#pwdRegCheck").html('');
				
				if(pwdConfirm === "") {
			    document.getElementById("pwdConfirmRegCheck").innerHTML="비밀번호를 다시 입력해주세요.";
			    pwdCheckSw = 0;
			  }
			  else if(pwd !== pwdConfirm) {
			    document.getElementById("pwdConfirmRegCheck").innerHTML="비밀번호가 일치하지 않습니다.";
			    pwdCheckSw = 0;
			  }
			  else {
		  	  document.getElementById("pwdRegCheck").innerHTML="";
		  	  document.getElementById("pwdConfirmRegCheck").innerHTML="";
		  	  pwdCheckSw = 1;
	  	  }
			}
		}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<h1 class="text-center m-5">올리브영 회원가입</h1>
<hr style="margin:0px auto; width:1140px; border:solid 0.5px black;" />
<div class="container">
	<div class="joinInput">
  	<form name="myform" method="post">
  		<table class="table table-borderless">
  			<tr><td><h4 style="margin-top:20px; margin-bottom:0px; color:gray;">기본정보</h4></td></tr>
  			<tr><td colspan="2"><div style="border-bottom:1px solid lightgray;"></div></td></tr>
  			<tr>
			  	<th><label for="mid">아이디</label></th>
					<td>
						<input type="text" name="mid" id="mid" placeholder="영문 소문자/숫자 조합 4~16자" required autofocus onkeyup="idCheck()" class="form-control"/>
						<div id="midRegCheck" class="inputCheck"></div>
					</td>
  			</tr>
  			<tr>
			  	<th><label for="pwd">비밀번호</label></th>
					<td>
						<input type="password" name="pwd" id="pwd" placeholder="영문/숫자/특수문자 각 최소 1자 이상 조합 6~15자" onkeyup="pwdCheck()" required class="form-control"/>
						<div id="pwdRegCheck" class="inputCheck"></div>
					</td>
  			</tr>
  			<tr>
			  	<th><label for="pwdConfirm">비밀번호 확인</label></th>
					<td>
						<input type="password" name="pwdConfirm" id="pwdConfirm" placeholder="비밀번호를 다시 입력해주세요" onkeyup="pwdCheck()" required class="form-control"/>
						<div id="pwdConfirmRegCheck" class="inputCheck"></div>
					</td>
  			</tr>
  			<tr>
			  	<th><label for="name">이름</label></th>
					<td><input type="text" name="name" id="name" placeholder="한글/영문 2~20자" required class="form-control"/></td>
  			</tr>
  			<tr>
			  	<th><label for="address">주소</label></th>
					<td>
						<div class="input-group mb-1">
			        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
			        <div class="input-group-append">
			          <!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary"> -->
			          <button style="z-index: auto; border-radius:0px;" onclick="sample6_execDaumPostcode()" class="btn btn-dark">우편번호 찾기</button>
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
			  	<th><label for="tel">휴대폰번호</label></th>
					<td>
						<div class="input-group">
			        <div class="input-group-prepend">
		            <select name="tel1" class="custom-select sel">
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
			        <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>&nbsp;-&nbsp;
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
  			<tr><td colspan="2"><div style="border-bottom:1px solid lightgray;"></div></td></tr>
  			<tr>
  				<td colspan="2"><h4 style="color:gray;">이용약관</h4></td>
  			</tr>
  			<tr>
  				<td colspan="2">
  					<div class="form-check mb-3">
  						<label class="form-check-label">
								<input type="checkbox" id="agreeAll" class="form-check-input agreeAll"/>
								전체동의
  						</label>
  					</div>
  					<div class="form-check">
  						<label for="agree1" class="form-check-label">
								<input type="checkbox" id="agree1" name="agree1" value="1" class="form-check-input agree"/>[필수] 이용약관 동의
  						</label>
  					</div>
  					<textarea class="form-control" rows="7" readonly>
제1조(목적)
이 약관은 (주)마녀공장 (전자거래 사업자, 이하 “회사”)이 운영하는 (주)마녀공장 공식몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 공식몰과 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.
※ 「PC 통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」


제2조(정의)
① "몰"이란 회사가 재화 또는 용역(이하 “재화 등”)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 공식몰을 운영하는 사업자의 의미로도 사용합니다.
② "이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ “서비스”란 회사가 인터넷 웹사이트 또는 모바일 앱 내에서 제4조에서 정한 내용의 업무를 통하여 이용자에게 제공하는 인터넷 관련 유•무형의 행위 등을 말합니다.
④ ‘회원’이라 함은 "몰"에 개인 정보를 제공하여 회원 등록을 한 자로서, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
⑤ ‘간편 회원’이라 함은 별도 ‘회원’에 가입하지 않고 기존 가입된 ‘네이버’, ‘카카오’의 기본 정보 연동을 통해 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
⑥ ‘비회원’이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.


제3조(약관등의 명시와 설명 및 개정)
① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호•모사전송 번호•전자우편 주소, 사업자등록번호, 통신판매업 신고번호, 개인 정보 보호 책임자 등을 이용자가 쉽게 알 수 있도록 "몰"의 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.
② "몰"은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회•배송책임•환불 조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결 화면 또는 팝업 화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ "몰"은 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용 촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ "몰"이 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 몰의 초기 화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정한 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ "몰"이 약관을 개정할 경우에는 그 개정 약관은 그 적용일자이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정 약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정 약관의 공지 기간 내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정 약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호 지침 및 관계법령 또는 상관례에 따릅니다.


제4조(서비스의 제공 및 변경)
① "몰"은 다음과 같은 서비스를 제공합니다.
1. 재화 등에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화의 배송
3. 구매계약 및 배송에 관련된 용역 제공
4. 기타 "몰"이 정하는 업무
② "몰"은 재화 등의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 등의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 등의 내용 및 제공 일자를 명시하여 현재의 재화 등의 내용을 게시한 곳에 즉시 공지합니다.
③ "몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 방법으로 즉시 통지합니다.
④ 전항의 경우 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.


제5조(서비스의 중단)
① "몰"은 컴퓨터 등 정보통신 설비의 보수 점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② "몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "몰"이 천재지변, 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다. 또한 이용자의 귀책사유로 인한 서비스 이용장애에 대하여는 "몰"이 책임을 지지 않습니다.
③ 사업 종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "몰"은 제8조에 정한 방법으로 이용자에게 통지한다.


제6조(회원가입)
① 이용자는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
1.가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "몰"의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.
2.등록 내용에 허위, 기재누락, 오기가 있는 경우’
3.사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
4. 만 14세 미만의 경우(법정대리인의 동의여부와 관계없이 가입이 제한됩니다.)
5.기타 회원으로 등록하는 것이 "몰"의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 회원가입시 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "몰"에 대하여 그 변경사항을 알려야 합니다. 이를 회사에 알리지 않음으로 인하여 발생하는 일체의 불이익에 대하여 몰은 책임지지 않습니다.


제7조(회원 탈퇴 및 자격 상실 등)
① 회원은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원 탈퇴를 처리합니다. 단, 회원과 회사 간에 몰 이용과 관련된 채권•채무관계가 남아 있는 경우에는 회사는 해당 채권•채무관계가 해소될 때까지 해당 회원의 탈퇴를 제한할 수 있습니다.
② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
1.가입 신청 시에 허위 내용을 등록한 경우
2."몰"을 이용하여 구입한 재화 등의 대금, 기타 "몰"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3.다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4.서비스 운영을 고의로 방해한 경우
5.정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스프로그램 등을 유포하는 경우
6.타인의 개인정보, 이용자 아이디(ID) 및 비밀번호를 부정하게 사용하는 경우
7.회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙없이 복제 또는 유통시키거나 사업적으로 이용하는 경우
8.기타 "몰"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
③ "몰"이 회원 자격을 제한•정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "몰"은 회원자격을 상실시킬 수 있습니다.
④ "몰"이 회원자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.


제8조(회원에 대한 통지)
① "몰"이 회원에 대한 통지를 하는 경우, 회원이 "몰"과 미리 약정하여 지정한 전자우편 주소 및 가입시 등록한 정보에 기명된 수단으로 할 수 있습니다.
② "몰"은 불특정 다수 회원에 대한 통지의 경우 1주일 이상 "몰" 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지를 합니다.


제9조(구매신청)
"몰"이용자는 "몰"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "몰"은 이용자가 구매 신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
1.재화 등의 검색 및 선택
2.성명, 주소, 전화번호, 전자우편 주소(또는 이동전화번호) 등의 입력
3.약관 내용, 청약철회권이 제한되는 서비스, 배송료•설치비 등의 비용 부담과 관련한 내용에 대한 확인
4.이 약관에 동의하고 위 3. 호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5.재화 등의 구매 신청 및 이에 관한 확인 또는 "몰"의 확인에 대한 동의
6.결제방법의 선택


제10조 (계약의 성립)
① "몰"은 제9조와 같은 구매 신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다.
1.신청 내용에 허위, 기재누락, 오기가 있는 경우
2.미성년자가 보호자의 승낙없이 구매하는 경우
3.기타 구매 신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우
② "몰"의 승낙이 제12조제1항의 수신확인 통지 형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ "몰"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매 가능 여부, 구매 신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.


제11조(지급방법)
"몰"에서 구매한 재화 등에 대한 대금 지급 방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, "몰"은 이용자의 지급 방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1.폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
2.선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3.온라인 무통장입금
4.전자화폐에 의한 결제
5.수령 시 대금 지급
6.마일리지 등 "몰"이 지급한 포인트에 의한 결제
7."몰"과 계약을 맺었거나 "몰"이 인정한 상품권에 의한 결제
8.기타 전자적 지급 방법에 의한 대금 지급 등


제12조(수신확인 통지•구매 신청 변경 및 취소)
① "몰"은 이용자의 구매 신청이 있는 경우 이용자에게 수신확인 통지를 합니다.
② 수신확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매 신청 변경 및 취소를 요청할 수 있고 "몰"은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.


제13조(재화 등의 공급)
① "몰"은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문 제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "몰"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 "몰"은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
② "몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "몰"이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 "몰"이 고의•과실이 없음을 입증한 경우에는 그러하지 아니합니다.


제14조(환급)
"몰"은 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.


제15조(청약철회 등)
① "몰"과 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
② 이용자는 재화 등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
1.이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2.이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3.시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
4.같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
③ 제2항제2호 내지 제4호의 경우에 "몰"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시•광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.


제16조(청약철회 등의 효과)
① "몰"은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 "몰"이 이용자에게 재화 등의 환급을 지연한 때에는 그 지연 기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
② "몰"은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. "몰"은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시•광고 내용과 다르거나 계약 내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 "몰"이 부담합니다.
④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 "몰"은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
⑤ 단순 고객변심으로 인한 교환/반품의 경우 왕복 배송비는 이용자가 부담해야 합니다.
⑥ 피부 트러블로 인한 반품의 경우 배송비는 이용자 부담이며 상품 수령 후 30일 이내에 반품을 접수시켜 주어야 합니다. 단, 이용자가 피부과 진단서를 첨부하여 반품요청을 할 경우 회사가 재화의 반품에 따른 배송비를 부담하며(배송비 외 기타 제반 비용은 이용자가 부담합니다), 만일 화장품 자체의 하자와 피부트러블과의 상당한 인과관계가 인정되는 경우 또는 화장품 하자로 인한 피부 질환 치료 목적의 경우에는 이용자가 첨부한 피부과 진단서 발급비용과 배송비를 회사가 부담합니다.
⑦ 고객의 부재중이거나 수취인 주소 불명으로 인해 반송되어 다시 배송되는 경우 해당 배송비는 고객이 부담합니다.
⑧ 모든 반품 시, 고객은 판촉행위로 인한 경품 및 사은품을 반납하여야 하며, 고객이 사은품을 사용하였을 경우 회사는 해당 금액만큼 차감하여 지급할 수 있습니다. 다만, 회사의 책임이 있는 사유로 인한 반품의 경우에는 그렇지 않습니다.


제17조(개인정보보호)
① "회사"는 이용자의 개인정보에 대한 개인정보처리방침을 공개하고, 그에 따라 개인정보 정책을 운영하고 있으며 이용자는 자신의 개인정보처리와 관련한 자세한 내용을 "몰"의 개인정보처리방침을 통해 확인할 수 있습니다.
② "몰"이 이용자의 개인식별이 가능한 개인 정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
③ 제공된 개인 정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰이 집니다. 다만, 다음의 경우에는 예외로 합니다.
1.배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우
2.통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
3.재화등의 거래에 따른 대금정산을 위하여 필요한 경우
4.도용방지를 위하여 본인확인에 필요한 경우
5.법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
④ "몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보 보호책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
⑤ 이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
⑥ "몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등, "몰"이 고의 또는 과실이 없음을 입증하지 않으면 이용자의 손해에 대하여 모든 책임을 집니다.
⑦ "몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다. 단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.


제18조(“몰“의 의무)
① "몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화•용역을 제공하는데 최선을 다하여야 합니다.
② "몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
③ "몰"이 상품이나 용역에 대하여 「표시•광고의공정화에관한법률」 제3조 소정의 부당한 표시•광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
④ "몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.


제19조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다.
④ 회사는 회원이 제2항, 제3항을 위반하여 회원에게 발생한 손해에 대하여는 책임을 지지 않습니다.


제20조(이용자의 의무)
이용자는 다음 행위를 하여서는 안되며, 이용자가 다음 각호의 행위를 하는 경우 회사는 법령, 이 약관 및 회사의 정책 등에 따라 적절한 조치를 취할 수 있습니다.
1.신청 또는 변경 시 허위 내용의 등록
2.타인의 정보 도용
3."몰"에 게시된 정보의 변경
4."몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5."몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해
6."몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위


제21조(마일리지 제도)
① 몰은 특정 재화 등을 구입하는 회원에게 운영정책에 따라 마일리지를 부여할 수 있습니다.
② 회원이 상품 구매나 이벤트 등을 통하여 "몰"로부터 무상 제공받은 마일리지의 경우 회사에서 정한 기한에 한해서 이용 가능합니다.
③ 마일리지는 100P 이상부터 사용 가능합니다. 마일리지 100P는 현금 100원과 같습니다. 마일리지 사용 시 마일리지는 자동 차감되며, 구매 시 사용한 마일리지의 경우 실 결제금액의 대상에 포함되지 않습니다.
④ 마일리지는 몰의 아이디 기준으로 적립/사용할 수 있으며, 타 아이디와 연동할 수 없습니다.
⑤ 마일리지 소멸 기준
1. 마일리지는 지급일로부터 1년동안 사용 가능합니다.
2. 마일리지는 선입선출을 원칙으로 사용되며 지정된 유효기간에 자동 소멸되고, 사용하지 않아 사라지는 마일리지에 대해서 고객은 보상을 받을 수 없습니다. "몰"은 마일리지 소멸일 이전에 고객에게 소멸 예정 사항을 공지하며 SMS, 이메일 서비스를 동의하지 않아 마일리지 소멸 공지를 받지 못한 고객은 이 사항에 관하여 보상받을 수 없습니다.
3. 회원탈퇴 및 휴면회원 (1년간 미로그인 시) 으로 전환된 경우 적립되어 있던 마일리지는 현금으로 반환되지 않고 즉시 소멸되며, 소멸된 마일리지는 복구가 불가능합니다.

제22조(연결"몰"과 피연결"몰" 간의 관계)
① 상위 "몰"과 하위 "몰"이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "몰"(웹 사이트)이라고 하고 후자를 피연결 "몰"(웹사이트)이라고 합니다.
②연결"몰"은 피연결"몰"이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결"몰"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.


제23조(저작권의 귀속 및 이용제한)
① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
② 이용자는 "몰"을 이용함으로써 얻은 정보 중 "몰"에게 지적재산권이 귀속된 정보를 "몰"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
③ "몰"은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.


제24조(분쟁해결)
① "몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치•운영합니다.
② "몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
③ "몰"과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.


제25조(재판권 및 준거법)
① "몰"과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
② "몰"과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
  					</textarea>
  					<br/>
  					<div class="form-check">
  						<label for="agree2" class="form-check-label">
								<input type="checkbox" id="agree2" name="agree2" value="1" class="form-check-input agree"/>[필수] 개인정보 수집 및 이용
  						</label>
  					</div>
  					<textarea class="form-control" rows="7" readonly>
고객님께서는 개인정보 수집 및 이용동의에 거부할 수 있습니다. 단 거부할 경우 회원가입이 불가능 합니다.

1. 개인정보 수집목적 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스

나. 회원 관리

회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달

2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보

3. 개인정보의 보유기간 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

가. 회사 내부 방침에 의한 정보 보유 사유

o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 회원탈퇴 후 5일까지

나. 관련 법령에 의한 정보보유 사유

o 계약 또는 청약철회 등에 관한 기록

-보존이유 : 전자상거래등에서의소비자보호에관한법률

-보존기간 : 5년

o 대금 결제 및 재화 등의 공급에 관한 기록

-보존이유: 전자상거래등에서의소비자보호에관한법률

-보존기간 : 5년

o 소비자 불만 또는 분쟁처리에 관한 기록

-보존이유 : 전자상거래등에서의소비자보호에관한법률

-보존기간 : 3년

o 로그 기록

-보존이유: 통신비밀보호법

-보존기간 : 1개월
  					</textarea>
  				</td>
				</tr>
  		</table>
  		<div id="btnJoin">
		    <button type="button" class="btn btnCss" onclick="location.href='memberLogin';">돌아가기</button>
				<button type="button" class="btn btnCss" onclick="fCheck()">회원가입</button>
		    <button type="reset" class="btn btnCss">다시작성</button>
  		</div>
	    <input type="hidden" name="email" />
	    <input type="hidden" name="tel" />
	    <input type="hidden" name="address" />
	  </form>
	</div>
</div>
<p><br/></p>
<script>
	$(function() {
		$('.agreeAll').click(function() {
			$('.agree').prop('checked', this.checked);
		})
	});
</script>
</body>
</html>