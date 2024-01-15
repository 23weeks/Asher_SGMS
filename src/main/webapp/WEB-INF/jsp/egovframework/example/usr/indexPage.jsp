<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>SGMS</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

function signUp() {
	window.location.href = "<c:url value='/signUp.do'/>";
}

$(document).ready(function() {
	//test();
});
/* 
function test() {
	$.ajax({
		url : "<c:url value='/test.ajax'/>",
		type : "post",
		async : true,
		data : {
				"usr_id"	: "",
				"usr_name"	: ""
		},
		dataType : "json",
		success : function(data) {
			var result = data.resultList;
			console.log(result);
			$('#usr_id').val(result[0].usr_id);
			$('#usr_name').val(result[0].usr_name);
		},
		error : function(request, status, error) {
		}
	});
}
 */

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
	<h1>Study Group Management System</h1>
	<br/>
		<table>
			<tr>
				<th style="text-align: left">
					아이디
				</th>
				<td>
					<input id="usr_id" style="width: 290px"></input>
				</td>
			</tr>
			<tr>
				<th style="text-align: left">
					비밀번호
				</th>
				<td>
					<input  id="usr_name" style="width: 290px"></input>
				</td>
			</tr>
		</table>
		<br/>
		<div style="display: flex">
			<a onclick="signUp()" style="padding-right: 100px">회원가입</a>
			<a onclick="login()"  style="padding-right: 100px">로그인</a>
			<a onclick="find()">ID/비밀번호 찾기</a>
		</div>
	</div>
	
	
	
</body>
</html>
