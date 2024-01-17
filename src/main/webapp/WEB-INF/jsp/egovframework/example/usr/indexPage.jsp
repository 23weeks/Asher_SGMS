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

<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

/* 회원가입 */
function signUp() {
	window.location.href = "<c:url value='/signUp.do'/>";
}

/* 로그인 */
function login() {
	var usr_id = $('#usr_id').val();
	var usr_pwd = $('#usr_pwd').val();
	
	if(usr_id == "") {
		alert("아이디를 입력해주세요.");
	}else if(usr_pwd == "") {
		alert("비밀번호를 입력해주세요.");
	}else {
		$.ajax({
			url : "<c:url value='/login.ajax'/>",
			type : "post",
			async : true,
			data : {
					"usr_id"	: usr_id,
					"usr_pwd"	: usr_pwd
			},
			dataType : "json",
			success : function(data) {
				var result = data.result;
				if(data.errMsg != ""){
					alert(data.errMsg);
				}else if(result.levl == '1') {
					alert('관리자페이지 이동');
					//window.location.href = "<c:url value='/signUp.do'/>";
				}else {
					alert('일반회원페이지 이동');
					//window.location.href = "<c:url value='/signUp.do'/>";
				}
			},
			error : function(request, status, error) {
			}
		});
	}
}

/* ID/비밀번호 찾기 */
function find() {
	var Url = "<c:url value='/find.do'/>";
	
	// 팝업 창의 초기 크기 설정
	var popupWidth = 600;
	var popupHeight = 800;

	// 현재 화면 크기 가져오기
	var screenWidth = window.screen.width;
	var screenHeight = window.screen.height;

	// 팝업 창의 위치 계산
	var leftPosition = (screenWidth - popupWidth) / 2;
	var topPosition = (screenHeight - popupHeight) / 2;

	// 팝업 창 열기
	var popupWindow = window.open(Url, "_blank", "width=" + popupWidth + ",height=" + popupHeight + ",left=" + leftPosition + ",top=" + topPosition);
	  
	// 화면 가운데로 이동
	popupWindow.moveTo(leftPosition, topPosition);
}
</script>
</head>

<body>
	<div class="main-content" style="text-align: center">
		<div style="margin-top: 250px">
			<h1>Study Group Management System</h1>
		</div>
		<div>
			<table style="margin: 20px auto">
				<tr>
					<th style="text-align: center">
						아이디
					</th>
					<td>
						<input id="usr_id" style="width: 290px"></input>
					</td>
				</tr>
				<tr>
					<th style="text-align: center">
						비밀번호
					</th>
					<td>
						<input  id="usr_pwd" style="width: 290px" type="password"></input>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<a onclick="signUp()" style="padding-right: 100px">회원가입</a>
			<a onclick="login()"  style="padding-right: 100px">로그인</a>
			<a onclick="find()">아이디/비밀번호 찾기</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
