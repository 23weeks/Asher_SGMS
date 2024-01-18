<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>아이디 찾기</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	/* enterKey action */
	$('#main').keypress(function(event) {
		if (event.which === 13) {
			submit();
		}
	});
});

/* 뒤로 가기 */
function back() {
	window.location.href = "<c:url value='/find.do'/>";
}

/* 벨리데이션 확인 */
function validationCheck() {
	var birthdateRegex = /^\d{6}$/;															//usr_brth 유효성검사(숫자 6자리)
	var phoneRegex = /^01[0-9]-\d{4}-\d{4}$/;												//usr_phone 유효성검사
	var usr_brth = $('#usr_brth').val();
	var usr_phone = $('#usr_phone').val();
	
	//이름
	if($('#usr_name').val() == ""){
		alert("이름을 입력해주세요.");
		$('#usr_name').focus();
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
	return true;
}

/* 확인 */
function submit() {
	var usr_name = $('#usr_name').val();
	var usr_brth = $('#usr_brth').val();
	var usr_phone = $('#usr_phone').val();
	var replace_usr_phone = "";
	if(usr_phone.includes('-')){
		replace_usr_phone = usr_phone.replace(/-/g, '');
	}else{
		replace_usr_phone = usr_phone;
	}
	
	if(validationCheck()){
		$.ajax({
			url : "<c:url value='/findId.ajax'/>",
			type : "post",
			async : true,
			data : {
					"usr_name"		: usr_name,
					"usr_brth"		: usr_brth,
					"usr_phone"		: replace_usr_phone
			},
			dataType : "json",
			success : function(data) {
				var result = data.result;
				console.log(result);
				if(data.errMsg == ""){
					$('#result').html('<h2 style="text-align: center; margin-bottom: 20px">ID : [ ' + result.usr_id + '] 입니다.</h2>');
					$('#submitBtn').css('display', 'none');
					$('#findPwdBtn').css('display', '');
				}else {
					$('#result').html('<h2 style="text-align: center; margin-bottom: 20px">' + data.errMsg + '</h2>');
					$('#submitBtn').css('display', 'none');
				}
			},
			error : function(request, status, error) {
			}
		});
	}
}

/* 비밀번호 찾기 */
function findPwd() {
	window.location.href = "<c:url value='/findPwd.do'/>";
}
</script>
</head>
<body>
	<div class="main-content" style="margin-top: 150px">
		<div style="text-align: center; margin-bottom: 20px">
			<h1>SGMS</h1>	
		</div>
		<div id="result" style="text-align: center">
			<h2>회원가입 시 정보를 입력해주세요.</h2>
			<table id="main" style="margin: 20px auto">
				<tr>
					<th style="text-align: center">
						이름
					</th>
					<td>
						<input id="usr_name" style="width: 270px"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: center">
						생년월일
					</th>
					<td>
						<input  id="usr_brth" style="width: 270px" type="text"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">휴대폰번호</th>
					<td>
						<input id="usr_phone" style="width: 270px" type="tel" placeholder="010-1234-5678" required></input>
					</td>
				</tr>
			</table>
		</div>
		<div style="text-align: center">
			<a id="backBtn" onclick="back()">뒤로가기</a>
			<a id="submitBtn" onclick="submit()" style="margin-left: 70px">확인</a>
			<a id="findPwdBtn" onclick="findPwd()" style="margin-left: 70px; display: none;">비밀번호 찾기</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
