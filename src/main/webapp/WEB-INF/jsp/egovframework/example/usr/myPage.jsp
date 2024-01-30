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

$(document).ready(function() {
	/* 화면 로딩 시 본인이 속한 스터디 그룹이 조회되야 함. */
	selectMyStdGrpList();
})

/* 내가 속한 스터디 조회 */
function selectMyStdGrpList() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
	$('#MyStdGrpListBtn').css({'background-color' : '#f0f0f0'});
	$('#StdGrpListBtn').css({'background-color' : '#ffffff'});
	
	$.ajax({
		url : "<c:url value='/selectMyStdGrpList.ajax'/>",
		type : "post",
		async : true,
		data : {
			"usr_id"	:	usr_id
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
				row.append($('<td class="stdGrpInfo" style="text-align: left;">').html('<a onclick="getGrpId()">' + result[i].grp_name  + '</a>'));
				row.append($('<td style="text-align: left;">').html(result[i].grp_master));
				row.append($('<td>').html(result[i].grp_type));
				row.append($('<td style="text-align: left;">').html(result[i].dsc));
				row.append($('<td>').html(result[i].cre_date));
				
				resultTblBody.append(row);
			}
		},
		error : function(request, status, error) {
		}
	});
}

/* 스터디 목록 조회 */
function selectStdGrpList() {
	$('#MyStdGrpListBtn').css({'background-color' : '#ffffff'});
	$('#StdGrpListBtn').css({'background-color' : '#f0f0f0'});
	
	$.ajax({
		url : "<c:url value='/selectStdGrpList.ajax'/>",
		type : "post",
		async : true,
		data : {"":""},
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
				row.append($('<td class="stdGrpInfo" style="text-align: left;">').html('<a onclick="getGrpId()">' + result[i].grp_name + '</a>'));
				row.append($('<td style="text-align: left;">').html(result[i].grp_master));
				row.append($('<td>').html(result[i].grp_type));
				row.append($('<td style="text-align: left;">').html(result[i].dsc));
				row.append($('<td>').html(result[i].cre_date));
				
				resultTblBody.append(row);
			}
		},
		error : function(request, status, error) {
		}
	});
}

/* grp_id 가져오기 */
function getGrpId() {
	var table = document.getElementById('resultTbl');
	var rowList = table.rows;
	
	for(i=1; i<rowList.length; i++){
		var row = rowList[i];
		var aTagInSecondTd = row.cells[1].querySelector('a');
		
		if(aTagInSecondTd) {
			aTagInSecondTd.onclick = function() {
				
				var grp_id = this.closest('tr').cells[0].innerHTML;
				
				//스터디 상세 조회
				stdGrpInfo(grp_id);
			};
		}
	}
}

/* 스터디 상세 조회 */
function stdGrpInfo(grp_id) {
	var Url = "<c:url value='/stdGrpInfo.do'/>";
	
	//Get 방식 parameter 추가
	Url += "?grp_id=" + grp_id;
	
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

/* 회원 정보 수정 */
function UsrUpdate() {
	var Url = "<c:url value='/updateInfo.do'/>";
	
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

//출석률 조회
function selectAttRate() {
	var Url = "<c:url value='/selectAttRate.do'/>";
	
	// 팝업 창의 초기 크기 설정
	var popupWidth = 600;
	var popupHeight = 700;

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
/* 스터디 그룹 생성 */
function stdGrpMasterCheck() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
	
	$.ajax({
		url : "<c:url value='/stdGrpMasterCheck.ajax'/>",
		type : "post",
		async : true,
		data : {
			"usr_id"	:	usr_id
		},
		dataType : "json",
		success : function(data) {
			var errMsg = data.errMsg;
			
			if(errMsg != ""){
				alert(errMsg);
			}else{
				var Url = "<c:url value='/addStdGrp.do'/>";
				
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
		},
		error : function(request, status, error) {
		}
	});
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
		height: 600px;
		padding: 10px;
	}
	
	.bottomDiv {
		width: 80%;
		float: right;
		height: 110px;
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
	
	.rightDiv thead tr th {
		width: 200px;
		text-align: center;
		font-size: 14px;
	}
	
	.rightDiv tbody td {
		text-align: center;
		font-size: 12px;
	}
	
	.bottomDiv button:hover {
		cursor: pointer;		 /* 마우스 모양을 손가락으로 변경 */
		background-color: #f0f0f0;
	}
</style>
<%@include file ="../semantic/header.jsp" %>
</head>
<body>
<input id="grp_id" type="hidden" value=""/>
	<div class="main-content">
		<div class="leftDiv">
			<div>
				<button id="MyStdGrpListBtn" type="button" onclick="selectMyStdGrpList()">내가 속한 스터디 보기</button>
			</div>
			<div>
				<button id="StdGrpListBtn" type="button" onclick="selectStdGrpList()">전체 스터디 목록 조회</button>
			</div>
			<div>
				<button id="UsrUpdateBtn" type="button" onclick="UsrUpdate()">회원 정보 수정</button>
			</div>
			<div>
				<button id="selectAttRateBtn" type="button" onclick="selectAttRate()">출석률 조회</button>
			</div>
		</div>
		<div class="rightDiv">
			<table id="resultTbl">
				<thead>
					<tr>
						<th style="width: 250px">그룹명</th>
						<th>그룹마스터</th>
						<th style="width: 120px">그룹 타입</th>
						<th style="width: 620px">설명</th>
						<th>생성일자</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="bottomDiv" style="text-align: right">
			<button type="button" style="text-align: center; font-size: 20px; border: 1px solid; padding: 5px;" onclick="stdGrpMasterCheck()">스터디 그룹 생성</button>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
