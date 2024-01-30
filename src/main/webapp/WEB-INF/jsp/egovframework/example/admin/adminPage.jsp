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
	//초기 화면 설정
	selectUsrList();
})

/* 회원 관리 */
function selectUsrList() {
	$('#usrListBtn').css({'background-color' : '#f0f0f0'});
	$('#stdGrpListBtn').css({'background-color' : '#ffffff'});
	
	$.ajax({
		url : "<c:url value='/selectUsrList.ajax'/>",
		type : "post",
		async : true,
		data : {"":""},
		dataType : "json",
		success : function(data) {
			var result = data.resultList;
			
			//table display 설정
			$('#resultTbl1').css('display', '');
			$('#resultTbl2').css('display', 'none');
			//tbody 초기화
			var resultTblBody = $('#resultTbl1 tbody');
			resultTblBody.html('');
			
			//데이터 루프
			for(var i=0; i<result.length; i++){
				//전화번호
				var usr_phone1 = result[i].usr_phone.substring(0,3);
				var usr_phone2 = result[i].usr_phone.substring(3,7);
				var usr_phone3 = result[i].usr_phone.substring(7,11);
				//등급
				var usr_levl = "";
				if(result[i].usr_levl == '1'){
					usr_levl = "관리자";
				}else {
					usr_levl = "일반회원";
				}
				//usr_id
				var usr_id = result[i].usr_id;
				
				var row = $('<tr>');
				row.append($('<td id="usr_id_' + i + '" style="text-align: left;">').html(result[i].usr_id));
				row.append($('<td style="text-align: left;">').html(result[i].usr_name));
				row.append($('<td>').html(result[i].usr_brth));
				row.append($('<td>').html(usr_phone1 + '-' + usr_phone2 + '-' + usr_phone3));
				row.append($('<td style="text-align: left;">').html(result[i].usr_addr));
				row.append($('<td>').html(usr_levl));
				row.append($('<td>').html(result[i].cre_date));
				row.append($('<td>').html('<a id="deleteBtn1_'+ i + '" onclick="deleteUsr()">삭제</a>'));
				
				resultTblBody.append(row);
			}
			
		},
		error : function(request, status, error) {
		}
	});
}

/* 회원 삭제 */
function deleteUsr() {
	var table = document.getElementById('resultTbl1');
	var rowList = table.rows;
	
	for(i=1; i<rowList.length; i++){
		var row = rowList[i];
		var aTagInSecondTd = row.cells[7].querySelector('a');
		
		if(aTagInSecondTd) {
			aTagInSecondTd.onclick = function() {
				
				var usr_id = this.closest('tr').cells[0].innerHTML;
				
				deleteData(usr_id);
			};
		}
	}
}

/* 회원 정보 삭제 */
function deleteData(usr_id) {
	if(confirm("[ " + usr_id + " ] 회원을 삭제하시겠습니까?")){
		$.ajax({
			url : "<c:url value='/deleteUsr.ajax'/>",
			type : "post",
			async : true,
			data : {
					"usr_id"	:	usr_id
			},
			dataType : "json",
			success : function() {
				alert("회원 삭제가 완료됐습니다.");
				
				//tbody 초기화
				var resultTblBody = $('#resultTbl1 tbody');
				resultTblBody.html('');
				
				//유저 목록 조회
				selectUsrList();
			},
			error : function(request, status, error) {
			}
		});
	}
}

/* 스터디 목록 관리 */
function selectStdGrpList() {
	$('#usrListBtn').css({'background-color' : '#ffffff'});
	$('#stdGrpListBtn').css({'background-color' : '#f0f0f0'});
	
	$.ajax({
		url : "<c:url value='/selectStdGrpList.ajax'/>",
		type : "post",
		async : true,
		data : {"":""},
		dataType : "json",
		success : function(data) {
			var result = data.resultList;
			
			//table display 설정
			$('#resultTbl1').css('display', 'none');
			$('#resultTbl2').css('display', '');
			//tbody 초기화
			var resultTblBody = $('#resultTbl2 tbody');
			resultTblBody.html('');
			
			//데이터 루프
			for(var i=0; i<result.length; i++){
				var row = $('<tr>');
				row.append($('<td style="text-align: left; display:none;">').html(result[i].grp_id));
				row.append($('<td style="text-align: left;">').html(result[i].grp_name));
				row.append($('<td style="text-align: left;">').html(result[i].grp_master));
				row.append($('<td>').html(result[i].grp_type));
				row.append($('<td style="text-align: left;">').html(result[i].dsc));
				row.append($('<td>').html(result[i].cre_date));
				row.append($('<td>').html('<a id="deleteBtn2_'+ i + '" onclick="deleteStdGrp()">삭제</a>'));
				
				resultTblBody.append(row);
			}
		},
		error : function(request, status, error) {
		}
	});
}

/* 스터디 그룹 삭제 */
function deleteStdGrp() {
	var table = document.getElementById('resultTbl2');
	var rowList = table.rows;
	
	for(i=1; i<rowList.length; i++){
		var row = rowList[i];
		var aTagInSecondTd = row.cells[6].querySelector('a');
		
		if(aTagInSecondTd) {
			aTagInSecondTd.onclick = function() {
				
				var grp_id = this.closest('tr').cells[0].innerHTML;
				
				alert(grp_id);
			};
		}
	}
}

/* 스터디 그룹 정보 삭제 */
function deleteStdGrpData(grp_id) {
	if(confirm("[ " + grp_id + " ] 그룹을 삭제하시겠습니까?")){
		$.ajax({
			url : "<c:url value='/deleteStdGrp.ajax'/>",
			type : "post",
			async : true,
			data : {
					"grp_id"	:	grp_id
			},
			dataType : "json",
			success : function() {
				alert("스터디 그룹 삭제가 완료됐습니다.");
				
				//tbody 초기화
				var resultTblBody = $('#resultTbl2 tbody');
				resultTblBody.html('');
				
				//그룹 목록 조회
				selectStdGrpList();
			},
			error : function(request, status, error) {
			}
		});
	}
}
/* ID/비밀번호 찾기 */
function find() {
	var Url = "<c:url value='/find.do'/>";
	
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

/* 통계 조회 */
function selectAttRate() {
	var Url = "<c:url value='/selectGrpAttRate.do'/>";
	
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
		height: 720px;
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
</style>
<%@include file ="../semantic/header.jsp" %>
</head>
<body>
	<div class="main-content">
		<div class="leftDiv">
			<div>
				<button id="usrListBtn" type="button" onclick="selectUsrList()">회원관리</button>
			</div>
			<div>
				<button id="stdGrpListBtn" type="button" onclick="selectStdGrpList()">스터디 목록 관리</button>
			</div>
			<div>
				<button id="selectAttRateBtn" type="button" onclick="selectAttRate()">통계 조회</button>
			</div>
		</div>
		<div class="rightDiv">
			<table id="resultTbl1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th style="width: 100px">생년월일</th>
						<th>전화번호</th>
						<th style="width: 300px">주소</th>
						<th style="width: 100px">등급</th>
						<th>생성일자</th>
						<th style="width: 50px"></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<table id="resultTbl2" style="display: none;">
				<thead>
					<tr>
						<th style="width: 250px">그룹명</th>
						<th>그룹마스터</th>
						<th style="width: 120px">그룹 타입</th>
						<th style="width: 570px">설명</th>
						<th>생성일자</th>
						<th style="width: 50px"></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
