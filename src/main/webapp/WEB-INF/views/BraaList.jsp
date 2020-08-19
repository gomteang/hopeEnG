<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 게시판</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		
		ajaxComm("/braa/Braa1000_select.do","",braaSelectCallback);
		
		$("#searchBtn").click(function(){
			var url = "/braa/Braa1000_select.do";
			var searchArr = new Object();
			searchArr[$("#select").val()] = $("#searchText").val();

			ajaxComm(url, searchArr, braaSelectCallback);			
		})
		
		$("#write").click(function(){
			//window.location.href = "<c:url value='/braa/Braa1000_write.do'/>";
			window.location.href = "Braa1000_write.do";
		})
	})

	function braaSelectCallback(result){
		$("#braaTable").empty();
		var braaAppend = "<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>처리상태</th><th>공개여부</th></tr>";
		var stus = "";
		var click = "";
		
		$.each(result.braaList,function(index,item){
			
			switch(item.bordStus){
		    	case "S" :
		    		stus = "대기중";
		    		break;
		    	case "P" :
		    		stus = "처리중";
		    		break;
		    	case "C" :
		    		stus = "완료";
		    		break;
	   		};
	   		
		    braaAppend += "<tr><td>"+item.bordNo+"</td><td><a href='javascript:bordWrite(\""+item.bordNo+"\",\""+item.bordRelease+"\");'>"+item.bordNm+"</a>"
		    		   +"</td><td>"+item.userNm+"</td><td>"+item.modyDate+"</td><td>"+item.bordCnt+"</td><td>"+stus
		    		   +"</td><td>"+item.bordRelease+"</td></tr>";

		});
		
		$("#braaTable").append(braaAppend);
	}
	
	function bordWrite(bordNum, bordRelease){		
		//비밀번호 입력
		/* if(bordRelease == "N"){ //비공개
			window.open("${pageContext.request.contextPath}/confirm.jsp","","scrollbars=no,status=no,resizable=no,width=300,height=150");
		} */
		window.location.href = "Braa1000_detailSelect.do?bordNum="+bordNum;
	}
	
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
	<div style="width:80%;padding:0 300px 0 300px;">
		<div>
			<select id="select">
				<option value="bordNm">제목</option>
				<option value="userNm">이름</option>
			</select>
			<input type="text" id="searchText"/>
			<button id="searchBtn">검색</button>
		</div>
		<div>
			<table id="braaTable" width="500" cellpadding="7" cellspacing="0" border="1">
			</table>
		</div>
		<div>
			<button id="write">작성하기</button>
		</div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>