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

//ID 중복체크
function idDupCheck() {
	var usr_id = $('#usr_id').val();
	
	//아이디 validation
	if(usr_id == "" || usr_id.length < 5){
		alert("아이디는 5글자 이상입니다.");
		$('#usr_id').focus();
	}else{
		getSessionValue();
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

</script>
</head>
<body>
	<div class="main-content" style="margin-top: 230px">
		<div style="text-align: center; margin-bottom: 20px">
			<h1>SGMS</h1>	
		</div>
		<div style="text-align: center; margin-bottom: 20px">
			<a style="width: 70px; font-size: 14px; margin-left: 5px" onclick="">아이디 찾기</a><br/>
		</div>
		<div style="text-align: center">
			<a style="width: 70px; font-size: 14px; margin-left: 5px" onclick="">비밀번호 찾기</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
