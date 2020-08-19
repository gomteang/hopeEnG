<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성하기</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
var flag = false;
var num = "${braa.bordNo}";
if("${braa}" != ""){ // 상세보기 일 때 
	flag = true;
}
$(document).ready(function(){
	if(flag){
		$("#checkInfo").prop("checked",true);
		$("#bordRelease").attr("disabled",true);
		$("#pwdDiv").remove();
		$("#write").remove();
		$("#reset").remove();
	}else{
		$("#braaUpdate").remove();
	}

	$("#braaList").click(function(){
		window.location.href = "braa.do";
	})
	
	$("#bordRelease").change(function(){
		if($("#bordRelease").val() == "Y"){
			$("#userPw").attr("disabled",true);
		}else{
			$("#userPw").removeAttr("disabled"); 
		}
	})
})

function submitVal(val){
	var action = "";
	if(val == "insert"){
		var alertFlag = true;
		var guideTxt = ""
		var obj = "";
		
		if($("#checkInfo").is(":checked") == false){
			guideTxt = "개인정보 수집 및 이용 동의에 체크해주세요.";
			obj = $("#checkInfo");
		}else if($("#userNm").val() == undefined || $("#userNm").val() == ""){
			guideTxt = "이름을 입력해주세요.";
			obj = $("#userNm");
		}else if($("#userPw").attr("disabled") == undefined
				&& ($("#userPw").val() == undefined || $("#userPw").val() == "")){
				guideTxt = "비밀번호를 입력해주세요.";
				obj = $("#userPw");
		}else if($("#userEmail").val() == undefined || $("#userEmail").val() == ""){
			guideTxt = "이메일을 입력해주세요.";
			obj = $("#userEmail");
		}else if($("#userPhone").val() == undefined || $("#userPhone").val() == ""){
			guideTxt = "연락처를 입력해주세요.";
			obj = $("#userPhone");
		}else if($("#bordNm").val() == undefined || $("#bordNm").val() == ""){
			guideTxt = "제목을 입력해주세요.";
			obj = $("#bordNm");
		}else if($("#bordCts").val() == undefined || $("#bordCts").val() == ""){
			guideTxt = "내용을 입력해주세요.";
			obj = $("#bordCts");
		}else{
			alertFlag = false;
		}
		
		if(alertFlag){
			alert(guideTxt);
			obj.focus();
			return;
		}
		action = "/braa/Braa1000_insert.do";
	}else{ //update
		$("#bordNo").val(num);
		action = "/braa/Braa1000_update.do"
	}
	$("#bordWriteForm").attr("action", action).submit();
}
</script>
<div class="inner">
	<form name="bordWriteForm" id="bordWriteForm" method="POST">
	<input type="hidden" name="bordNo" id="bordNo" value=0>
	<div>
		<label for="agree">개인정보 수집 및 이용 동의</label>
		<div>
			블라블라_상민님이 내용 채울실 것
		</div>
	</div>
	<div>
	<input type="checkbox" id="checkInfo">
	<label for="">개인정보 수집 및 이용에 동의합니다.</label>
	</div>
	<div>
		<label for="name">공개여부</label>
		<p/>
		<select id="bordRelease" name="bordRelease">
			<option value="Y">공개</option>
			<option value="N" selected>비공개</option>
		</select>
	</div>
	<div>
		<label for="name">이름</label>
		<p/>
		<input type="text" id="userNm" name="userNm" value="${braa.userNm}">
	</div>
	<div id="pwdDiv">
		<label for="pwd">비밀번호</label>
		<p/>
		<input type="password" id="userPw" name="userPw">
	</div>
	<div>
		<label for="email">이메일</label>
		<p/>
		<input type="text" id="userEmail" name="userEmail" value="${braa.userEmail}">
	</div>
	<div>
		<label for="tel">연락처</label>
		<p/>
		<input type="text" id="userPhone" name="userPhone" value="${braa.userPhone}">
	</div>
	<div>
		<label for="title">제목</label>
		<p/>
		<input type="text" id="bordNm" name="bordNm" value="${braa.bordNm}">
	</div>
	<div>
		<label for="content">내용</label>
		<p/>
		<textarea id="bordCts" name="bordCts">${braa.bordCts}</textarea>
	</div>
	<button type="reset" id="reset">초기화</button>
	<button type="button" id="write" onclick="submitVal('insert')">등록</button>
	<button type="button" id="braaList">목록</button>
	<button type="button" id="braaUpdate" onclick="submitVal('braaUpdate')">수정</button>
	</form>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>