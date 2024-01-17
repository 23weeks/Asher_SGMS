<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원가입</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

//중복체크(default: false)
var dupCheck = false;

//ID 중복체크
function idDupCheck() {
	var usr_id = $('#usr_id').val();
	
	//아이디 validation
	if(usr_id == "" || usr_id.length < 5){
		alert("아이디는 5글자 이상입니다.");
		$('#usr_id').focus();
	}else{
		$.ajax({
			url : "<c:url value='/dupCheck.ajax'/>",
			type : "post",
			async : false,
			data : {
					"usr_id"	: usr_id
			},
			dataType : "json",
			success : function(data) {
				var result = data.result;
				alert(result);
				if(data.dupCheck == 0){
					dupCheck = true;
				}else {
					dupCheck = false;
				}
			},
			error : function(request, status, error) {
			}
		});
	}
}

//회원가입
function signUp() {
	var usr_id = $('#usr_id').val();
	var usr_name = $('#usr_name').val();
	var usr_pwd = $('#usr_pwd').val();
	var usr_brth = $('#usr_brth').val();
	var usr_phone = $('#usr_phone').val();
	var replace_usr_phone = "";
	if(usr_phone.includes('-')){
		replace_usr_phone = usr_phone.replace(/-/g, '');
	}else{
		replace_usr_phone = usr_phone;
	}
	var usr_addr = $('#usr_addr').val();
	
	if(validationCheck()){
		if(dupCheck == true){
			$.ajax({
				url : "<c:url value='/signUp.ajax'/>",
				type : "post",
				async : true,
				data : {
						"usr_id"		: usr_id,
						"usr_name"		: usr_name,
						"usr_pwd"		: usr_pwd,
						"usr_brth"		: usr_brth,
						"usr_phone"		: replace_usr_phone,
						"usr_addr"		: usr_addr
				},
				dataType : "json",
				success : function(data) {
					alert("회원가입이 완료되었습니다.\n로그인페이지로 이동합니다.");
					window.location.href = "<c:url value='/login.do'/>";
				},
				error : function(request, status, error) {
				}
			});
		}else {
			alert("중복체크를 해주세요.");
		}
	}
}

//취소 버튼
function cancel() {
	window.location.href = "<c:url value='/login.do'/>";
}

//벨리데이션 확인
function validationCheck() {
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;		//usr_pwd 유효성검사(영문, 숫자, 특수문자)
	var birthdateRegex = /^\d{6}$/;															//usr_brth 유효성검사(숫자 6자리)
	var phoneRegex = /^01[0-9]-\d{4}-\d{4}$/;												//usr_phone 유효성검사
	var usr_pwd = $('#usr_pwd').val();
	var usr_brth = $('#usr_brth').val();
	var usr_phone = $('#usr_phone').val();
	
	//이름
	if($('#usr_name').val() == ""){
		alert("이름을 입력해주세요.");
		$('#usr_name').focus();
		return false;
	}
	//비밀번호
	if(!passwordRegex.test(usr_pwd)){
		alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8글자 이상이어야 합니다.");
		$('#usr_pwd').focus();
		return false;
	}
	//비밀번호확인
	if($('#usr_pwd').val() != $('#usr_pwd_chk').val()){
		alert("비밀번호와 비밀번호확인이 일치되야합니다.");
		$('#usr_pwd_chk').focus();
		return false;
	}
	//생년월일
	if(!birthdateRegex.test(usr_brth)){
		alert("생년월일은 숫자 6자리여야 합니다.");
		$('#usr_brth').focus();
		return false;
	}
	//전화번호
	if(!phoneRegex.test(usr_phone)){
		alert("휴대폰 번호는 '010-1234-5678'의 형식을 따라야 합니다.");
		$('#usr_phone').focus();
		return false;
	}
	//주소
	if($('#usr_addr').val() == ""){
		alert("주소를 입력해주세요.");
		$('#usr_addr').focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<div class="main-content" style="margin-top: 150px">
		<div style="text-align: center">
			<h1>회원가입</h1>
		</div>
		<div>
			<table style="margin: 20px auto">
				<tr>
					<th style="text-align: left">아이디</th>
					<td>
						<input id="usr_id" style="width: 200px; padding-right: 20px"></input>
						<a style="width: 70px; background-color: rgb(200, 200, 200); font-size: 14px; margin-left: 5px" onclick="idDupCheck()">중복확인</a>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">성명</th>
					<td>
						<input  id="usr_name" style="width: 290px"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">비밀번호</th>
					<td>
						<input  id="usr_pwd" style="width: 290px" type="password"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">비밀번호 확인</th>
					<td>
						<input  id="usr_pwd_chk" style="width: 290px" type="password"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">생년월일</th>
					<td>
						<input  id="usr_brth" style="width: 290px"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">휴대폰번호</th>
					<td>
						<input id="usr_phone" style="width: 290px" type="tel" placeholder="010-1234-5678" required></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">주소</th>
					<td>
						<input  id="usr_addr" style="width: 290px"></input>
					</td>
				</tr>
			</table>
		</div>	
		<div style="text-align: center; padding-top: 20px">
			<a onclick="cancel()">취소</a>
			<a onclick="signUp()" style="margin-left: 100px">회원가입</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
