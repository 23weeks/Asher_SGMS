<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>일정 추가</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	// select box의 변경을 감지하여 일 옵션 업데이트
	document.getElementById("year").addEventListener("change", function () {
		var year = parseInt(this.value, 10);
		var month = parseInt(document.getElementById("month").value, 10);
		populateDayOptions(year, month);
	});

	document.getElementById("month").addEventListener("change", function () {
		var year = parseInt(document.getElementById("year").value, 10);
		var month = parseInt(this.value, 10);
		populateDayOptions(year, month);
	});

	// 초기화 함수 호출
	initializeDateSelector();
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

//SELECT BOX - option 추가
function populateOptions(selectId, start, end) {
	var currentDate = new Date();
	var currentYear = currentDate.getFullYear();
	var currentMonth = currentDate.getMonth() + 1;
	var currentDay = currentDate.getDate();
	
	var select = document.getElementById(selectId);
	
	for (var i = start; i <= end; i++) {
		var option = document.createElement("option");
		var value = i < 10 ? "0" + i : "" + i; // 한 자리수인 경우 앞에 0 추가
		option.value = value;
		option.text = i + (selectId === "month" ? "월" : "일");
		select.add(option);
	}
	
}

//현재 날짜를 가져오는 함수
function getCurrentDate() {
	var currentDate = new Date();
	return {
	year: currentDate.getFullYear(),
	month: currentDate.getMonth() + 1,
	day: currentDate.getDate()
	};
}

// 년도 옵션을 동적으로 생성하는 함수
function populateYearOptions() {
	var currentYear = getCurrentDate().year;
	var select = document.getElementById("year");

	for (var i = currentYear; i <= currentYear + 1; i++) {
		var option = document.createElement("option");
		option.value = i;
		option.text = i + "년";
		select.add(option);
	}
}

// 월 옵션을 동적으로 생성하는 함수
function populateMonthOptions() {
	var select = document.getElementById("month");

	for (var i = 1; i <= 12; i++) {
		var option = document.createElement("option");
		option.value = i < 10 ? "0" + i : "" + i;
		option.text = i + "월";
		select.add(option);
	}
}

// 일 옵션을 동적으로 생성하는 함수
function populateDayOptions(year, month) {
	var select = document.getElementById("day");
	select.innerHTML = ""; // 일자를 다시 설정하기 전에 기존 옵션을 제거

	var currentDate = getCurrentDate();
	var daysInMonth = new Date(year, month, 0).getDate();

	for (var i = 1; i <= daysInMonth; i++) {
		//현재 날짜 이전 날짜는 제외
		if (year < currentDate.year || (year === currentDate.year && month < currentDate.month) || (year === currentDate.year && month === currentDate.month && i < currentDate.day)) {
			continue;
		}
		
		var option = document.createElement("option");
		option.value = i < 10 ? "0" + i : "" + i;
		option.text = i + "일";
		select.add(option);
	}
}

// 초기화 함수
function initializeDateSelector() {
	var currentDate = getCurrentDate();
	var yearSelect = document.getElementById("year");
	var monthSelect = document.getElementById("month");
	var daySelect = document.getElementById("day");

	// 년도, 월, 일 옵션 초기화
	populateYearOptions();
	populateMonthOptions();
	populateDayOptions(currentDate.year, currentDate.month);

	// 현재 날짜로 초기화
	yearSelect.value = currentDate.year;
	monthSelect.value = currentDate.month < 10 ? "0" + currentDate.month : "" + currentDate.month;
	daySelect.value = currentDate.day < 10 ? "0" + currentDate.day : "" + currentDate.day;
}

//일정 추가
function addSchd() {
	var grp_id = '${param.grp_id}';
	var std_yyyymm = $('#year').val() + $('#month').val() + $('#day').val();
	
	if(confirm("일정을 추가하시겠습니까?")){
		$.ajax({
			url : "<c:url value='/addSchd.ajax'/>",
			type : "post",
			async : true,
			data : {
				"grp_id"		: grp_id,
				"std_yyyymm"	: std_yyyymm
			},
			dataType : "json",
			success : function(data) {
				var errMsg = data.errMsg;
				console.log(errMsg);
				
				if(errMsg == ""){
					alert("일정 추가가 완료되었습니다.");
					//상세정보 재조회
					opener.parent.selectStdGrpInfo();
					window.self.close();
				}else{
					alert(errMsg);
				}
			},
			error : function(request, status, error) {
			}
		});	
	}
}

</script>
<style>
	.main-content select {
		width: 150px;
		height: 30px;
		font-size: 16px;
		text-align: left;
		font-weight: bold;
	}
	
	.addBtn a:hover {
		font-size: 15px;
	}
</style>
</head>
<body>
	<div class="main-content" style="margin-top: 0px;">
		<div style="background-color: #f0f0f0; height: 30px; padding: 10px">
			<select id="year">
			</select>
			<select id="month">
			</select>
			<select id="day">
			</select>
		</div>
		<div class="addBtn" style="text-align: center; margin-top: 50px; font-size: 15px; font-weight: bold">
			<a id="addSchdBtn" onclick="addSchd()">일정 추가</a>
		</div>
	</div>
	
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
