<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>가입 신청 목록</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	selectStdSubReqList();
});

/* 닫기 */
function popUpClose() {
	window.self.close();
}

/* 신청 목록 조회 */
function selectStdSubReqList() {
	var grp_id = '${param.grp_id}';
	
	$.ajax({
		url : "<c:url value='/selectStdSubReqList.ajax'/>",
		type : "post",
		async : true,
		data : {
			"grp_id"	: grp_id
		},
		dataType : "json",
		success : function(data) {
			var result = data.resultList;
			console.log(result);
			
			var resultTblBody = $('#resultTbl tbody');
			resultTblBody.html('');
			
			//데이터 루프
			for(var i=0; i<result.length; i++){
				var row = $('<tr>');
				row.append($('<td style="text-align: left; padding-left: 10px;">').html(result[i].usr_id));
				row.append($('<td>').html(result[i].req_date));
				row.append($('<td>').html('<a onclick="getUsrId()">수락</a>'));
				
				resultTblBody.append(row);
			}
		},
		error : function(request, status, error) {
		}
	});	
}

/* usr_id 가져오기 */
function getUsrId() {
	var table = document.getElementById('resultTbl');
	var rowList = table.rows;
	
	for(i=1; i<rowList.length; i++){
		var row = rowList[i];
		var aTagInSecondTd = row.cells[2].querySelector('a');
		
		if(aTagInSecondTd) {
			aTagInSecondTd.onclick = function() {
				
				var usr_id = this.closest('tr').cells[0].innerHTML;
				
				//스터디 그룹 인원 추가
				acptSubReq(usr_id);
			};
		}
	}
}

/* 스터디 그룹 인원 추가 */
function acptSubReq(usr_id) {
	var grp_id = '${param.grp_id}';
	
	if(confirm("수락하시겠습니까?")){
		$.ajax({
			url : "<c:url value='/addStdUsr.ajax'/>",
			type : "post",
			async : true,
			data : {
				"grp_id"	: grp_id,
				"usr_id"	: usr_id
			},
			dataType : "json",
			success : function(data) {
				alert("스터디 인원 등록이 완료되었습니다.");
				//스터디 가입 신청 목록 재조회
				selectStdSubReqList();
			},
			error : function(request, status, error) {
			}
		});
	}
}
</script>
<style>
	.main-content thead tr th {
		width: 150px;
		font-size: 15px;
		text-align: center;
		font-weight: bold;
		padding: 2px;
	}
	
	.main-content tbody tr td {
		font-size: 12px;
		text-align: center;
		font-weight: bold;
		padding: 2px;
		height: 24px;
	}
</style>
</head>
<body>
	<div class="main-content" style="margin-top: 20px; padding: 0 0 0 20px; height: 400px">
		<div id="main_content-body" style="height: 400px; background-color: #f0f0f0; width: 480px; padding: 5px; border: 1px solid; margin-bottom: 10px">
			<table id="resultTbl">
				<thead>
					<tr>
						<th style="width: 250px">신청자ID</th>
						<th>신청일자</th>
						<th style="width: 50px"></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div style="text-align: center">
			<a id="closeBtn" onclick="popUpClose()">닫기</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
