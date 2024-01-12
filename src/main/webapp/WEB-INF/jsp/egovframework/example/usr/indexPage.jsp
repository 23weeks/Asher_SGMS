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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	//test();
});

function test() {
	$.ajax({
		url : "<c:url value='/test.ajax'/>",
		type : "post",
		async : true,
		data : {
				"usr_id" : ""},
		contentType : "application/json",
		success : function(data) {
			var result = data.resultList;
			$('#usr_id').val(result[0].usr_id);
			$('#usr_name').val(result[0].usr_name);
		},
		error : function(request, status, error) {
		}
	});
}
</script>
</head>

<body>
	<h2>helloooooooooooooooooooo</h2>
	
	<table style="border: solid;">
		<tr>
			<td id="usr_id">test</td>
		</tr>
		<tr>
			<td id="usr_name">test</td>
		</tr>
	</table>
	<a onclick="test()">Test</a>
</body>
</html>
