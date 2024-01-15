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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

//중복체크(default: false)
var dupCheck = false;

//ID 중복체크
function idDupCheck() {
	var usr_id = $('#usr_id').val();
	
	$.ajax({
		url : "<c:url value='/dupCheck.ajax'/>",
		type : "post",
		async : true,
		data : {
				"usr_id"	: usr_id
		},
		dataType : "json",
		success : function(data) {
			var result = data.result;
			alert(result);
			console.log(data)
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

//ID 중복체크
function signUp() {
	var usr_id = $('#usr_id').val();
	var usr_name = $('#usr_name').val();
	var usr_password = $('#usr_password').val();
	var usr_brth = $('#usr_brth').val();
	var usr_phone = $('#usr_phone').val();
	alert(usr_phone);
	var usr_addr = $('#usr_addr').val();
	
	$.ajax({
		url : "<c:url value='/signUp.ajax'/>",
		type : "post",
		async : true,
		data : {
				"usr_id"		: usr_id,
				"usr_name"		: usr_name,
				"usr_password"	: usr_password,
				"usr_brth"		: usr_brth,
				"usr_phone"		: usr_phone,
				"usr_addr"		: usr_addr
		},
		dataType : "json",
		success : function(data) {
			var result = data.result;
			alert(result);
			console.log(data)
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
</script>

<style>
	body {
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100vh;
		margin: 0;
	}
	
	.content {
		text-align: center;
	}
	
	th, td {
		border: 1px solid #ddd;
		padding: 8px;
		text-align: left;
	}
	
	a:hover {
		font-size:12px;
		font-family:"돋움";
		color:#339999;
		text-decoration:none;
		cursor: pointer;		 /* 마우스 모양을 손가락으로 변경 */
		}
</style>
</head>
<body>
	<div class="content">
	<h1>회원가입</h1>
	<br/>
		<table>
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
					<input  id="usr_password" style="width: 290px"></input>
				</td>
			</tr>
			<tr>
				<th style="text-align: left">비밀번호 확인</th>
				<td>
					<input  id="usr_password_chk" style="width: 290px"></input>
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
					<input  id="usr_phone" style="width: 290px" type="tel" placeholder="010-1234-5678" required></input>
				</td>
			</tr>
			<tr>
				<th style="text-align: left">주소</th>
				<td>
					<input  id="usr_addr" style="width: 290px"></input>
				</td>
			</tr>
		</table>
		<div style="text-align: center; padding-top: 50px">
			<a onclick="signUp()">회원가입</a>
		</div>
	</div>
	
	
	
</body>
</html>
