<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>스터디 그룹 생성</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function() {
	/* enterKey action */
	$('#main').keypress(function(event) {
		if (event.which === 13) {
			
			addStdGrp();
		}
	});
});

//중복체크(default: false)
var grpNamedupCheck = false;

//스터디명 중복체크
function nameDupCheck() {
	var grp_name = $('#grp_name').val();
	
	if(grp_name == ""){
		alert("스터디명을 입력해주세요.");
	}else {
		$.ajax({
			url : "<c:url value='/grpNamedupCheck.ajax'/>",
			type : "post",
			async : true,
			data : {
					"grp_name"	: grp_name
			},
			dataType : "json",
			success : function(data) {
				var result = data.result;
				alert(result);
				if(data.grpNamedupCheck == 0){
					grpNamedupCheck = true;
				}else {
					grpNamedupCheck = false;
				}
			},
			error : function(request, status, error) {
			}
		});
	}
}

//스터디 생성
function addStdGrp() {
	var grp_master = '<%= (String) session.getAttribute("usr_id")%>';
	var grp_name = $('#grp_name').val();
	var grp_type = $('#grp_type').val();
	var dsc = $('#dsc').val();
	var grp_id;
	
	if(grpNamedupCheck){
		if(confirm('스터디 그룹을 생성하시겠습니까?')){
			$.ajax({
				url : "<c:url value='/addStdGrp.ajax'/>",
				type : "post",
				async : false,
				data : {
						"grp_name"		: grp_name,
						"grp_master"	: grp_master,
						"grp_type"		: grp_type,
						"dsc"			: dsc
				},
				dataType : "json",
				success : function(data) {
					//grp_id 가져오기
					var result = data.result;
					var grp_id = result.grp_id;
					
					//스터디 그룹 인원 추가
					$.ajax({
						url : "<c:url value='/addStdUsr.ajax'/>",
						type : "post",
						async : false,
						data : {
								"grp_id"	: grp_id,
								"usr_id"	: grp_master	//session에서 가져온 usr_id의 값
						},
						dataType : "json",
						success : function() {
							alert("스터디 그룹이 생성되었습니다.");
							//스터디 목록 재조회
							opener.parent.selectMyStdGrpList();
							window.self.close();
						},
						error : function(request, status, error) {
						}
					});
				},
				error : function(request, status, error) {
				}
			});
		}
	}else {
		alert("중복확인을 해주세요.");
	}
}

/* 닫기 */
function popUpClose() {
	window.self.close();
}
</script>
</head>
<body>
	<div class="main-content" style="margin-top: 150px">
		<div style="text-align: center">
			<h1>스터디 그룹 생성</h1>
		</div>
		<div>
			<table id="main" style="margin: 20px auto">
				<tr>
					<th style="text-align: left">스터디명</th>
					<td>
						<input id="grp_name" style="width: 200px; padding-right: 20px"></input>
						<a style="width: 70px; background-color: rgb(200, 200, 200); font-size: 14px; margin-left: 5px" onclick="nameDupCheck()">중복확인</a>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">그룹 타입</th>
					<td>
						<select id="grp_type" style="width: max-content; padding-right: 20px">
							<option value="QQ">부동산</option>
							<option value="WW">자격증</option>
							<option value="EE">공시</option>
						</select>
					</td>
				</tr>
				<tr>
					<th style="text-align: left">설명</th>
					<td>
						<textarea id="dsc" rows="10" cols="40"></textarea>
					</td>
				</tr>
			</table>
		</div>	
		<div style="text-align: center; padding-top: 20px">
			<a onclick="popUpClose()">닫기</a>
			<a onclick="addStdGrp()" style="margin-left: 100px">생성</a>
		</div>
	</div>
</body>
<%@include file ="../semantic/footer.jsp" %>
</html>
