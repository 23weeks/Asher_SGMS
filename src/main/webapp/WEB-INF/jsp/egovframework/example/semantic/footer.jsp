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

</script>
<style>
	body {
		margin: 0;
		font-family: Arial, sans-serif;
		min-height: 100vh; /* 최소 높이를 화면 높이와 같게 설정 */
		display: flex;
		flex-direction: column;
	}
	
	a:hover {
		font-size:12px;
		font-family:"돋움";
		color:#339999;
		text-decoration:none;
		cursor: pointer;		 /* 마우스 모양을 손가락으로 변경 */
	}
		
	.header {
		background-color: #333;
		color: white;
		padding: 15px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.footer {
		background-color: #333;
		color: white;
		padding: 10px;
		text-align: center;
		margin-top: auto; /* 중요: 자동으로 나머지 공간을 차지하게 함 */
	}
	
	.links a {
		color: white;
		text-decoration: none;
		font-size: 12px;
	}
	
	th, td {
		border: 1px solid #ddd;
		padding: 8px;
		text-align: left;
	}
	
	.main-content {
		flex: 1;
		padding: 20px;
		margin-top: 20px; /* 상단 여백 추가 */
		align-items: center; /* 중앙 정렬을 위해 추가 */
	}
</style>
</head>
<body>
	<div class="footer">
		<h2 align="center">SAMPLE PROJECT BY STC</h2>
	</div>
</body>
</html>
