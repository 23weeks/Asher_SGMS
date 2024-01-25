<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>스터디 그룹 상세정보</title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	selectStdGrpInfo();
});

/* 닫기 */
function popUpClose() {
	window.self.close();
}

/* 비밀번호 찾기 */
function findPwd() {
	//window.location.href = "<c:url value='/findPwd.do'/>";
}

/* 스터디 상세 조회 */
function selectStdGrpInfo() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
	var grp_id = '${param.grp_id}';
	
	$.ajax({
		url : "<c:url value='/stdGrpInfo.ajax'/>",
		type : "post",
		async : true,
		data : {
			"usr_id"	: usr_id,
			"grp_id"	: grp_id
		},
		dataType : "json",
		success : function(data) {
			var result = data.result;
			var result_schd = data.result_schd;
			var stdUsrCheck = data.stdUsrCheck;
			var std_schd = $('#std_schd');
			console.log(data);
			
			$('#grp_name').html(result.grp_name);
			$('#dsc').html(result.dsc);
			
			//일정
			if(result_schd != null && result_schd.length != 0){
				for(var i=0; i<result_schd.length; i++){
					var std_year = result_schd[i].std_yyyymm.substring(0,4);
					var std_month = result_schd[i].std_yyyymm.substring(4,6);
					var std_day = result_schd[i].std_yyyymm.substring(6,8);
					
					std_schd.append($('<h2 style="font-size: 20px; padding-bottom: 10px">').html(std_year + ' - ' + std_month + ' - ' + std_day));
				}
			}else{
				std_schd.append($('<h2 style="text-align: left;">').html("일정이 없습니다."));
			}
			
			//그룹원 체크
			if(stdUsrCheck == 1) {
				$('#grpReqBtn').css({"display" : "none"});
			}
			//그룹마스터 체크
			if(result.grp_master != usr_id) {
				$('#addSchdBtn').css({"display" : "none"});
			}
		},
		error : function(request, status, error) {
		}
	});
}

function stdGrpSubReq() {
	var usr_id = '<%= (String) session.getAttribute("usr_id")%>';
	var grp_id = '${param.grp_id}';
	
	if(confirm('가입 신청 하시겠습니까?')){
		$.ajax({
			url : "<c:url value='/stdGrpSubReq.ajax'/>",
			type : "post",
			async : true,
			data : {
				"usr_id"	: usr_id,
				"grp_id"	: grp_id
			},
			dataType : "json",
			success : function(data) {
				var result = data.result;
				
				if(result == 1){
					alert('가입 신청 되었습니다.');
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
	<div class="main-content" style="margin-top: 20px; padding: 0 0 0 20px">
		<div id="main-content-title" style="height: 130px; background-color: #f0f0f0; width: 540px; padding: 5px; border: 1px solid; margin-bottom: 10px">
			<div style="margin-bottom: 20px">
				<h1 id="grp_name"></h1>	
			</div>
			<div style="margin-bottom: 20px; padding-left: 20px">
				<h2 id="dsc"></h2>
			</div>
		</div>
		
		<div id="main_content-body" style="height: 430px; background-color: #f0f0f0; width: 540px; padding: 5px; border: 1px solid; margin-bottom: 10px">
			<div style="margin-bottom: 20px">
				<h1>일정</h1>
			</div>
			<div id="std_schd" style="margin-bottom: 20px; padding-left: 20px">
			</div>
		</div>
		<div style="text-align: center">
			<a id="addSchdBtn" onclick="popUpClose()" style="padding-right: 70px">일정 추가</a>
			<a id="closeBtn" onclick="popUpClose()">닫기</a>
			<a id="grpReqBtn" onclick="stdGrpSubReq()" style="padding-left: 70px">가입 신청</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
