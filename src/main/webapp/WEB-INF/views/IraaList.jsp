<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사소개</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		
	})

	
	function ajaxComm(url, data, callback){
		$.ajax({
			url:url,
			type:"get",
			data:data,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:callback,
			error:function(xhr, status, error){
				console.log(xhr+"\n"+status+"\n"+error);
			}
		});
	}
	
</script>
<div class="inner">
	<div style="font-size:55px;padding:4%;text-align:center;">
		희망이앤지
	</div>
	<div>
		<div style="width: 30%;float: left;text-align: center; border-right:1px solid #7a7676;">
			회사 인원	
		</div>
		<div style="width: 30%; float:left;text-align: center;border-right: 1px solid #7a7676;">
			고객사 수
		</div>
		<div style="width: 30%;float: left;text-align: center;">
			보유 시스템
		</div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>