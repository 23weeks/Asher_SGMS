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

function logout() {
	if(confirm("로그아웃하시겠습니까?")){
		window.location.href = "<c:url value='/logout.do'/>";
	}
}
/* 
function sessionCheck() {
	$.ajax({
		url : "<c:url value='/sessionCheck.ajax'/>",
		type : "post",
		async : false,
		dataType : "json",
		success : function(data) {
			console.log(data);
			if(data == ''){
				alert("Session 정보가 없어 로그인페이지로 이동합니다.");
				location.href = "<c:url value='/login.do'/>";
			}
		},
		error : function(request, status, error) {
		}
	});
}

$(document).ready(function(){
	sessionCheck();
})
 */
</script>
</head>
<body>
	<div class="header">
		<div class="links" style="height: 30px; width: 100%; margin-top: 10px">
			<div style="width: 50%">
			</div>
			<div style="width: 50%">
				<a onclick="logout()" style="font-family:돋움; right: 50px; font-weight: bold;">로그아웃</a>
			</div>
		</div>
	</div>
	
</body>
</html>
