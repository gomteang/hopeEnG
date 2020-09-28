<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성하기</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
var flag = false;
var pwFlag = false;
var updMode = true; //수정모드
var num = "${braa.bordNo}";

var originBordStus = "";

if("${braa}" != ""){ // 상세보기 일 때 
	flag = true;
}

$(document).ready(function(){
	if(flag){ //상세보기
		$("#checkInfo").prop("checked",true);
		$("#bordRelease").val("${braa.bordRelease}");
		
		$("#bordRelease").attr("disabled",true);
		$("#userNm").attr("disabled",true); 
		$("#userEmail").attr("disabled",true);
		$("#userPhone").attr("disabled",true);
		$("#bordNm").attr("disabled",true);
		$("#bordCts").attr("disabled",true);
		
		$("#pwdDiv").remove();
		$("#write").remove();
		$("#reset").remove();
		$("#infoCheck").remove();
		$("#pwdCheckDiv").remove();
		if($("#userPw").next().length > 0){
			$("#userPw").next().remove();	
		}
		
		originBordCts = $("#bordStus").val();
		

		
	}else{
		$("#bordRelease").val("N");
		$("#braaUpdate").remove();
		$("#braaDelete").remove();
	}

	$("#braaList").click(function(){
		var msg = ""
		if(!compareContxt()){
			msg = "수정사항이 있습니다. "
		}
		if(confirm(msg+"목록으로 돌아가시겠습니까?")){
			window.location.href = "braa.do";
		}else{
			return;
		}
	})
	

	
})

function compareContxt(){
	var contxtFlag = true;
	
	if(originBordStus != $("#bordStus").val()){
		contxtFlag = false;
	}
	return contxtFlag;
}


function btnClickAction(val){
	var msg = "";
	if(val == "insert"){ // 입력모드
		insertValidCheck(); // 입력값 밸리드 체크
		msg = "등록";
		
	}else{ // 수정모드
		if(updMode){ //수정가능 모드
			if(val == "update"){
				if(compareContxt()){
					alert("수정된게 없습니다.");
					return;
				}
				$("#bordNo").val(num);
				msg = "수정";
			}else{ // delete 
				if(compareContxt()){
					msg = "삭제";
				}else{
					msg = "수정사항이 있습니다. 그래도 삭제";
				}
				$("#bordNo").val(num);
			}
		}else{ // 수정불가 모드  비번 입력해야함
			//수정모드로 들어가기 위한 비번 입력창
			window.open("Braa1000_confirmPasswdWindow.do?bordNum="+num,"","scrollbars=no,status=no,resizable=no,width=300,height=150");
			return;
		}
	}
	if(!confirm(msg+"하시겠습니까?")){
		return;
	}
	$("#bordWriteForm").attr("action", "/braa/Braa1000_"+val+".do").submit();
}

function checkAfterAction(num){
	console.log("열기");
	updMode = true;
	$("#braaDelete").css('display','block');
	$("input, textarea").prop("readonly", false);
}
</script>

<div class="inner">
<h2 class="" > 관리자 온라인 문의</h2>
<form name="bordWriteForm" id="bordWriteForm" method="POST">
<input type="hidden" name="bordNo" id="bordNo" value=0>
<div id="infoCheck">
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
	</div>
<div>
	<label for="name">공개여부</label>
	<p/>
	<select id="bordRelease" name="bordRelease" class="form-control-small">
		<option value="Y">공개</option>
		<option value="N">비공개</option>
	</select>
</div>
<div>
	<label for="name">이름</label>
	<p/>
	<input type="text" class="form-control-small" id="userNm" name="userNm" value="${braa.userNm}">
</div>
<div id="pwdDiv">
	<label for="pwd">비밀번호</label>
	<p/>
	<input type="password" class="form-control-mid" id="userPw" name="userPw">
	<span>비밀번호 분실 시 찾을 수 없습니다.</span>
</div>
<div id="pwdCheckDiv">
	<label for="pwdCheck">비밀번호 확인</label>
	<p/>
	<input type="password" class="form-control-mid" id="userPwCheck" name="userPwCheck">
	<span id="pwCheckMsg"></span>
</div>
<div id="email">
	<label for="email">이메일</label>
	<p/>
	<input type="text" class="form-control-mid" id="userEmail" name="userEmail" value="${braa.userEmail}">
</div>
<div id="tel">
	<label for="tel">연락처</label>
	<p/>
	<input type="text" class="form-control-mid" id="userPhone" name="userPhone" value="${braa.userPhone}">
</div>
<div>
	<label for="title">제목</label>
	<p/>
	<input type="text" class="form-control" id="bordNm" name="bordNm" value="${braa.bordNm}">
</div>
<div>
	<p/>
	<label for="content">내용</label>
	<textarea id="bordCts" class="form-control" name="bordCts" style="resize: none;" placeholder="2000자 이내로 작성해주세요.">${braa.bordCts}</textarea>
</div>

	<%
		String name;
		name = (String)session.getAttribute("name");
	%>
<div class="btn-group-toggle" style="height:50px;">
	<label for="status">처리 상태</label>
	<label for="bordStus_rdy" class="btn_radio_label">대기중</label><input class="btn_radio" type="radio" id="bordStus_rdy" name="bordStus" value="S" ${ braa.bordStus eq 'S' ? "checked" : ""}>
	<label for="bordStus_ing" class="btn_radio_label">처리중</label><input class="btn_radio" type="radio" id="bordStus_ing" name="bordStus" value="P" ${ braa.bordStus eq 'P' ? "checked" : ""}>
	<label for="bordStus_end" class="btn_radio_label">완료</label><input class="btn_radio" type="radio" id="bordStus_end" name="bordStus" value="C" ${ braa.bordStus eq 'C' ? "checked" : ""}>
</div>
<button type="button" id="braaUpdate" onclick="btnClickAction('update')">수정</button>
</form>
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</body>
</html>