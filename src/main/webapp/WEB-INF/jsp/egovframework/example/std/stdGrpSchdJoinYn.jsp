<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>참석 여부 확인</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	selectStdUsrList();
});

/* 닫기 */
function popUpClose() {
	window.self.close();
}

/* 그룹 유저 목록 */
function selectStdUsrList() {
	var grp_id = '${param.grp_id}';
	
	$.ajax({
		url : "<c:url value='/selectStdUsrList.ajax'/>",
		type : "post",
		async : false,
		data : {
			"grp_id"	: grp_id
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
				row.append($('<td class="usr_id" style="text-align: left;">').html(result[i].usr_id));
				
				//각 라디오 버튼에 고유한 id 부여
				var radioBtnName = 'joinYn_' + i;
				row.append($('<td style="text-align: center">').html('<input type="radio" id="' + radioBtnName + '_Y" name="joinYn_'+i+'" value="Y"></input>'));
				row.append($('<td style="text-align: center">').html('<input type="radio" id="' + radioBtnName + '_N" name="joinYn_'+i+'" value="N"></input>'));
				row.append($('<td style="text-align: center">').html('<a onclick="submit(\'' + radioBtnName + '\')">저장</a>'));
				
				resultTblBody.append(row);
			}
		},
		error : function(request, status, error) {
			
		}
	});	
}

/* 저장 */
function submit(radioBtnName) {
	var grp_id = '${param.grp_id}';
	var std_yyyymmdd = '${param.std_yyyymmdd}';
	var selectedValue = $('#' + radioBtnName + '_Y:checked').val() || $('#' + radioBtnName + '_N:checked').val();
	
	/* grp_id 가져오기 */
	var table = document.getElementById('resultTbl');
	var rowList = table.rows;
	
	for(i=1; i<rowList.length; i++){
		var row = rowList[i];
		var aTagInSecondTd = row.cells[3].querySelector('a');
		
		if(aTagInSecondTd) {
			aTagInSecondTd.onclick = function() {
				
				var usr_id = this.closest('tr').cells[0].innerHTML;
				console.log(selectedValue);
				console.log(usr_id);
				
				//결과 저장
				insertStdResult(grp_id, usr_id, std_yyyymmdd, selectedValue);
			};
		}
	}
	/* JSON 형식으로 서버에 request할 때 ERROR 발생 -> ERROR 잡기가 어려워 일단 각 tr의 데이터를 하나씩 저장하는 방식으로 대체
	추후 JSON 형식의 데이터로 넘겨 한번에 처리할 예정 */
	/*
	var rows = document.querySelectorAll('tbody tr');
	
	//tr데이터 수집
	var formDataList = [];
	rows.forEach(function(row, index) {
		var usrIdElement = row.querySelector('.usr_id');
		var usr_id = usrIdElement ? usrIdElement.textContent.trim() : '';
		
		var joinYnValue = row.querySelector('input[name^="joinYn"]:checked');
		
		var formData = {
			grp_id: grp_id,
			std_yyyymm: std_yyyymm,
			usr_id: usr_id,
			join_yn: joinYnValue.value
		}
		formDataList.push(formData);
	});
	
	console.log(JSON.stringify(formDataList));
	
	submit2(formDataList);
	 */
}

/* 저장 */
function insertStdResult(grp_id, usr_id, std_yyyymmdd, selectedValue) {
	
	$.ajax({
		url : "<c:url value='/insertStdSchdYn.ajax'/>",
		type : "post",
		async : false,
		data : {
			"grp_id"		: grp_id,
			"usr_id"		: usr_id,
			"std_yyyymmdd"	: std_yyyymmdd,
			"join_yn"		: selectedValue
		},
		dataType : "json",
		success : function(data) {
			var errMsg = data.errMsg;
			if(errMsg == ""){
				alert("저장되었습니다.");
				selectStdUsrList();
			}else {
				alert(errMsg);
			}
		},
		error : function(request, status, error) {
			
		}
	});	
}
/* 
function submit2(formDataList) {
	//서버로 데이터 보내기
	var data = JSON.stringify(formDataList);
	
	if(confirm("데이터를 저장하시겠습니까?")){
		$.ajax({
			url : "<c:url value='/insertStdSchdYn.ajax'/>",
			type : "post",
			async : false,
			data : data,
			contentType : "application/json",
			success : function() {
				alert("데이터가 저장되었습니다.");
			},
			error : function(request, status, error) {
				console.log('AJAX 요청 중 에러 발생:', status, error);
			}
		});	
	}
}
 */
</script>
<style>
	.main-content thead tr th {
		font-family: Arial, sans-serif;
		font-size: 16px;
		padding: 4px;
	}
	
	.submitBtn a:hover {
		font-size: 15px;
		font-family: Arial, sans-serif;
	}
</style>
</head>

<body>
	<div class="main-content" style="margin-top: 0px;">
		<div style="background-color: #f0f0f0; height: 350px; padding: 10px">
			<table id="resultTbl">
				<thead>
					<tr>
						<th style="width: 300px">유저ID</th>
						<th style="width: 50px; text-align: center">참석</th>
						<th style="width: 50px; text-align: center">불참</th>
						<th style="width: 50px; text-align: center"></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="submitBtn" style="text-align: center; margin-top: 50px; font-size: 15px; font-weight: bold">
			<a onclick="popUpClose()">닫기</a>
			<!-- <a style="margin-left: 20px" id="submitBtn" onclick="submit()">저장</a> 				추후에 JSON 에러 수정 후 주석 해제-->
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
