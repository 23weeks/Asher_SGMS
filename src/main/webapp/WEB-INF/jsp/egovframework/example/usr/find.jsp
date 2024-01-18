<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>아이디/비밀번호 찾기</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

/* 아이디 찾기 */
function findId() {
	window.location.href = "<c:url value='/findId.do'/>";
}

/* 비밀번호 찾기 */
function findPwd() {
	window.location.href = "<c:url value='/findPwd.do'/>";
}

</script>
</head>
<body>
	<div class="main-content" style="margin-top: 230px">
		<div style="text-align: center; margin-bottom: 20px">
			<h1>SGMS</h1>	
		</div>
		<div style="text-align: center; margin-bottom: 20px">
			<a style="width: 70px; font-size: 14px; margin-left: 5px" onclick="findId()">아이디 찾기</a><br/>
		</div>
		<div style="text-align: center">
			<a style="width: 70px; font-size: 14px; margin-left: 5px" onclick="findPwd()">비밀번호 찾기</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
