<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>회원 정보 수정</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	/* enterKey action */
	$('#main').keypress(function(event) {
		if (event.which === 13) {
			signUp();
		}
	});
	
	//비밀번호(hidden) 값 저장
	selectUsrInfo();
});

//ori_usr_pwd hidden값 저장
function selectUsrInfo() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
		
	$.ajax({
		url : "<c:url value='/selectUsrInfo.ajax'/>",
		type : "post",
		async : true,
		data : {
				"usr_id"		: usr_id
		},
		dataType : "json",
		success : function(data) {
			var result = data.result;
			
			$('#ori_usr_pwd').val(result.usr_pwd);
		},
		error : function(request, status, error) {
		}
	});
}

//회원가입
function updateInfo() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
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
	
	if(confirm("회원 정보를 수정하시겠습니까?")){
		if($('#ori_usr_pwd').val() == usr_pwd){
			alert("기존과 동일한 비밀번호는 사용이 불가합니다.");
		}else {
			if(validationCheck()){
				$.ajax({
					url : "<c:url value='/updateInfo.ajax'/>",
					type : "post",
					async : true,
					data : {
							"usr_id"		: usr_id,
							"usr_pwd"		: usr_pwd,
							"usr_brth"		: usr_brth,
							"usr_phone"		: replace_usr_phone,
							"usr_addr"		: usr_addr
					},
					dataType : "json",
					success : function() {
						alert("회원 정보 수정이 완료되었습니다.");
						window.self.close();
					},
					error : function(request, status, error) {
					}
				});
			}
		}
	}
	
}

/* 닫기 */
function popUpClose() {
	window.self.close();
}

//벨리데이션 확인
function validationCheck() {
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;		//usr_pwd 유효성검사(영문, 숫자, 특수문자)
	var birthdateRegex = /^\d{6}$/;															//usr_brth 유효성검사(숫자 6자리)
	var phoneRegex = /^01[0-9]-\d{4}-\d{4}$/;												//usr_phone 유효성검사
	var usr_pwd = $('#usr_pwd').val();
	var usr_brth = $('#usr_brth').val();
	var usr_phone = $('#usr_phone').val();
	
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
<input id="ori_usr_pwd" type="hidden" value=""></input>
	<div class="main-content" style="margin-top: 150px">
		<div style="text-align: center">
			<h1>회원 정보 수정</h1>
		</div>
		<div>
			<table id="main" style="margin: 20px auto">
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
			<a onclick="popUpClose()">닫기</a>
			<a onclick="updateInfo()" style="margin-left: 100px">회원 정보 수정</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
