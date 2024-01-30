<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>출석률 조회</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	selectAttRate();
});

/* 닫기 */
function popUpClose() {
	window.self.close();
}

/* 스터디 상세 조회 */
function selectAttRate() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
	
	$.ajax({
		url : "<c:url value='/selectAttRate.ajax'/>",
		type : "post",
		async : false,
		data : {
			"usr_id"	: usr_id
		},
		dataType : "json",
		success : function(data) {
			var result = data.resultList;
			
			//tbody 초기화
			var resultTblBody = $('#resultTbl tbody');
			resultTblBody.html('');
			
			//데이터 루프
			for(var i=0; i<result.length; i++){
				var row = $('<tr>');
				
				row.append($('<td style="display: none;">').html(result[i].grp_id));
				row.append($('<td>').html(result[i].grp_name));
				row.append($('<td style="text-align:center;">').html(result[i].stat_month.substring(0,4) + "년 " + result[i].stat_month.substring(4,6) + "월"));
				row.append($('<td style="text-align:center;">').html(result[i].att_rate + '%'));
				
				resultTblBody.append(row);
			}
		},
		error : function(request, status, error) {
		}
	});
}

</script>
<style>
	.main-content thead tr th {
		font-family: Arial, sans-serif;
		font-size: 20px;
	}
	
	.main-content tbody tr td {
		font-family: Arial, sans-serif;
		font-size: 16px;
	}
	.joinYnBtn:hover {
		font-family: Arial, sans-serif;
		font-size: 16px;
	}
</style>
</head>
<body>
	<div class="main-content" style="margin-top: 20px; padding: 0 0 0 20px">
		<div id="main_content-body" style="height: 430px; background-color: #f0f0f0; width: 540px; padding: 5px; border: 1px solid; margin-bottom: 50px">
			<div id="std_schd" style="margin-bottom: 20px;">
				<table id="resultTbl">
					<thead>
						<tr>
							<th style="width: 300px; text-align: left">스터디명</th>
							<th style="width: 100px; text-align: center">기준년월</th>
							<th style="width: 100px; text-align: center">출석률</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div style="text-align: center">
			<a id="closeBtn" onclick="popUpClose()">닫기</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
