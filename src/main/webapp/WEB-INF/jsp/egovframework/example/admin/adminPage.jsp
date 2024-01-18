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
<style >
	.leftDiv {
		width: 14%;
		float: left;
		margin-left: 50px;
		text-align: right;
		flex-direction: column;
		padding: 10px;
		background-color: #f5f5f5;
	}
	
	.rightDiv {
		width: 80%;
		float: right;
		background-color: #f5f5f5;
		height: 720px;
		padding: 10px;
	}
	
	.leftDiv div {
		margin: 0 0 15px 0;
		box-sizing: border-box;
	}
	
	.leftDiv button {
		font-family: Roboto;
		font-size:20px;
		color:black;
		text-decoration:none;
		border: 1px solid #333;
		width: 100%;
		height: 60px;
		font-weight: bold;
	}
	
	.leftDiv button:hover {
		cursor: pointer;		 /* 마우스 모양을 손가락으로 변경 */
		background-color: #f0f0f0;
	}
</style>
<%@include file ="../semantic/header.jsp" %>
</head>
<body>
	<div class="main-content">
		<div class="leftDiv">
			<div>
				<button type="button">회원관리</button>
			</div>
			<div>
				<button type="button">스터디 목록 관리</button>
			</div>
			<div>
				<button type="button">통계 조회</button>
			</div>
		</div>
		<div class="rightDiv">
			<table>
				<tr>
					<th>1</th>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
