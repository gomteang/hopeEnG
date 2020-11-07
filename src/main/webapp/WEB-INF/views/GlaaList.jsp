<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 게시판</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<%
		String name;
		name = (String)session.getAttribute("name");
	%>
<script>
	var pageNum = 1;
	var cntPerPage = 6;
	var searchArr = new Object();
	
	$(document).ready(function(){ 
		searchArr["pageNum"] = pageNum;
		searchArr["cntPerPage"] = cntPerPage;
		searchArr["fileType"] = "I";
		ajaxComm("/glaa/Glaa1000_select.do",searchArr,glaaSelectCallback);
		
		$("#btn_gllyImg").click(function(){
			searchArr["fileType"] = "I";
			ajaxComm("/glaa/Glaa1000_select.do",searchArr,glaaSelectCallback);
		});
	
		$("#btn_gllyVideo").click(function(){
			searchArr["fileType"] = "V";
			ajaxComm("/glaa/Glaa1000_select.do",searchArr,glaaSelectCallback);
		});
		
		$("#searchBtn").click(function(){
			var url = "/glaa/Glaa1000_select.do";
			var searchArr = new Object();
			
			searchArr["pageNum"] = 1;
			searchArr["cntPerPage"] = cntPerPage;
			searchArr[$("#select").val()] = $("#searchText").val();

			ajaxComm(url, searchArr, glaaSelectCallback);			
		})
		$("#write").click(function(){
			window.location.href = "/glaa/uploadForm.do";
		})
		
	})

	function gllyDetail(gllyNo){
		location.href="/glaa/Glaa1000_moveDetailPage.do?gllyNo="+gllyNo;
	}

	function glaaSelectCallback(result){
		$("#totalCnt").empty();
		$("#gallyList").empty();
		
		$("#totalCnt").append("총 "+result.paging.total+" 게시글");
		
		var glaaAppend = "";
		var stus = "";
		var click = "";
		
		$.each(result.glaaList,function(index,item){
			var src = "";
			if(item.fileType == "I"){
				src = "<img src=\"<spring:url value='/glly/"+item.fileNmKey+"'/>\"/>";
			}else if (item.fileType == "V"){
				src = "<video width=\"100%\" height=\"100%\" src=\"<spring:url value='/glly/"+item.fileNmKey+"'/>\"/>";
			}
			glaaAppend 
			   		+= "<li class='gallyLi'>"
					+"<a href='javascript:gllyDetail(\""+item.gllyNo+"\");'>"
					+"<div class='minidimm'>"
					+ src
					+"</div>"
					+"<p class='txtWrap'>"
					+"<span class='tit'>"+item.gllyNm+"</span>"
					+"<span class='pdate'>"+item.regiDate+"</span>"
					+"<span class='sub'>"+item.gllyCts+"</span>"
					+"</p>"
					+"</a>"
					+"<a href='javascript:gllyDetail(\""+item.gllyNo+"\");' class='mask' style='display:none;'></a>"
					+"</li>"

		});
			
		$(".gallyList").append(glaaAppend);
		
		$('.gallyLi > a').mouseenter(function(){
			$(this).parent().find('.mask').show();
		});
		$('.gallyLi > a').mouseleave(function(){
			$(this).parent().find('.mask').hide();
		});
		
		//페이징 처리
		var paging ="";
		$("#paging").empty();
		
		$("#paging").append("<ul>");
		if(result.paging.startPage > 1){
			$("#paging > ul").prepend("<li><a class='move prev' href='javascript:movePage("+((result.paging.startPage-1)*result.paging.cntPerPage)+")'>이전</a></li>");
			$("#paging > ul").prepend("<li><a class='move first' href='javascript:movePage(1)'>처음</a></li>");
		}
		for(var i=((result.paging.startPage-1)*result.paging.cntPerPage)+1; i<=result.paging.endPage; i++){
			paging += "<li><a href='javascript:movePage("+i+")'>"+i+"</a></li>";
			pageNum = i;
		}
		$("#paging ul").append(paging);
		if(result.paging.endPage < result.paging.lastPage){
			$("#paging > ul").append("<li><a class='move next' href='javascript:movePage("+(result.paging.endPage+1)+")'>다음</a></li>");
			$("#paging > ul").append("<li><a class='move end' href='javascript:movePage("+(result.paging.lastPage)+")'>끝</a></li>");
		}
		$("#paging").append("</ul>");
		
	}
	function movePage(num){
		searchArr["pageNum"] = num;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/glaa/Glaa1000_select.do",searchArr,glaaSelectCallback);
	}

	
	function bordWrite(bordNum, bordRelease){		
		window.location.href = "Glaa1000_detailSelect.do?bordNum="+bordNum;
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
	$(document).ajaxStart(function(){
		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	})
	$(document).ajaxStop(function(){
		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	});
</script>



<div class="inner">
<h2 class="" > 갤러리</h2>

	<button id="btn_gllyImg" type="button" class="">사진</button>
	<button id="btn_gllyVideo" type="button" class="">영상</button>

	<div style="margin-bottom:15px;">
		<select id="select" class="form-control" style="width:100px;float:left;">
			<option value="glNm">제목</option>
			<option value="glCts">내용</option>
		</select>
		<input class="form-control-mid" type="text" id="searchText" style="float:left;margin-left:5px;"/>
		<button id="searchBtn" style="margin-left:10px;">검색</button>
		<div>
		<%if(name != null){ %>
		<button id="write" style="float:right;margin-right:4%;">작성하기</button>
		<%} %>
	</div>
	</div>
	<div>
		<!-- <table class="table" id="glaaTable" width="500" cellpadding="7" cellspacing="0" border="1">
		</table> -->
		<section>
			<ul id = "gallyList" class="gallyList">
			</ul>
		</section>
	</div>
	<div id="paging" class="paging">
	</div>
	<div class="clear-space"></div>
	
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>