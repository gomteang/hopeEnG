<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>갤러리상세</title>
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<%    
    String gllyNo = request.getParameter("gllyNo");
%>

<c:set var="gllyNo" value="<%=gllyNo%>" />
<!-- 게시글 번호 -->


<style>
.carousel-inner>.carousel-item>img { /* width: 640px; height: 720px; */
	
}
</style>

<script type="text/javascript">
    
    $(document).ready(function(){        
    	getGlaaDetail();     
    	
    	
    });
    
    /** 갤러리 - 목록 페이지 이동 */
    function goGlaaList(){                
        location.href = "/glaa/glaa.do";
    }
    
    /** 갤러리 - 수정 페이지 이동 */
    function goGlaaUpdate(){
    	var gllyNo = $("#glly_no").val();
    	location.href = "/glaa/Glaa1000_moveUpdateGlaaPage?gllyNo=" + gllyNo;
    }
    
    /** 갤러리 - 상세 조회  */
    function getGlaaDetail(boardSeq){
        
        var gllyNo = $("#glly_no").val();
        if(gllyNo != ""){
            
            $.ajax({    
                
                url     : "/glaa/Glaa1000_getGlaaDetail",
                data    : {gllyNo : gllyNo},
              
                dataType: "JSON",
             
                cache   : false,
                async   : true,
                type    : "POST",    
                success : function(obj) {
                    getGlaaDetailCallback(obj);     
                    
                   
                },           
                error     : function(xhr, status, error) {}
                
             });
        } else {
            alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
        }            
    }
    
    /** 게시판 - 상세 조회  콜백 함수 */

	function getGlaaDetailCallback(obj) {

		var str = "";
		var stus = "";
		var click = "";
		var images = obj.glaaFileVO;
			
		if (obj != null) {
				for (var i = 0; i < images.length; i++) {
					if (i == 0) {
						str += "<div class='carousel-item active'>"
								+ "<img class=\"d-block w-100\""
						+ "src='/glly/"+images[i].fileNameKey+"' width=\"600\""
						+ ">"
								+ "</div>";
					} else {
						str += "<div class='carousel-item'>"
								+ "<img class=\"d-block w-100\""
						+ "src='/glly/"+images[i].fileNameKey+"' width=\"600\""
						+ ">"
								+ "</div>"
					}
	
				}
				var indi = "";
				for (var i = 1; i < images.length; i++) {
					indi += "<li data-target=\"#demo\" data-slide-to=\""+i+"\"></li>"
	
				}
		} else {
				alert("등록된 글이 존재하지 않습니다.");
				return;
		}
		$("#cbody").append(str);
		$("#indi").append(indi);

		getGlaaDetailCallback2(obj);

	}

	function getGlaaDetailCallback2(obj) {

		var str = "";

		if (obj != null) {
			str += "<tr>";
			str += "<th>제목</th>";
			str += "<td>" + obj.gllyNm + "</td>";
			str += "</tr>";
			str += "<tr>";
			str += "<th>작성일시</th>";
			str += "<td>" + obj.regiDate + "</td>";
			str += "</tr>";
			str += "<th>내용</th>";
			str += "<td colspan='3'>" + obj.gllyCts + "</td>";
			str += "</tr>";
			str += "<tr>";
			str += "<th>메인문구</th>";
			str += "<td colspan='3'>" + obj.mainComment + "</td>";
			str += "</tr>";
			str += "<tr>";
			str += "<th>추가문구</th>";
			str += "<td colspan='3'>" + obj.subComment + "</td>";
			str += "</tr>";

		} else {

			alert("등록된 글이 존재하지 않습니다.");
			return;
		}

		$("#tbody").append(str);
	}
	/** 게시판 - 삭제  */
	function goDeleteGlaa() {

		var gllyNo = $("#glly_no").val();
		var yn = confirm("게시글을 삭제하시겠습니까?");
		if (yn) {

			$.ajax({
				url : "/glaa/Glaa1000_delete.do",
				data : {
					gllyNo : gllyNo
				},
				dataType : "text",
				enctype : "multipart/form-data",
				cache : false,
				async : false,
				type : "POST",
				success : function(obj) {
					deleteGlaaCallback(obj);
				},
				error : function(xhr, status, error) {
				}

			});
		}
	}

	/** 게시판 - 삭제 콜백 함수 */
	function deleteGlaaCallback(obj) {
		if (obj != null) {

			if (obj == "SUCCESS") {
				alert("게시글 삭제를 성공하였습니다.");
				window.location.href = "glaa.do";
			} else {
				alert("게시글 삭제를 실패하였습니다.");
				return;
			}
		}
	}
</script>
</head>
<body>
	<%
	String name;
	name = (String)session.getAttribute("name");
%>

			<div class="inner">
				<h2>게시글 상세</h2>
				<form id="boardForm" name="boardForm">
					<table width="100%" class="table">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="*">
						</colgroup>
						<div id="demo" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner" id="cbody">
									<!-- 슬라이드 쇼 -->

									<!-- / 슬라이드 쇼 끝 -->
								
									<!-- 왼쪽 오른쪽 화살표 버튼 -->
									<a class="carousel-control-prev" href="#demo" data-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<!-- <span>Previous</span> -->
									</a> <a class="carousel-control-next" href="#demo"
										data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										 <!-- <span>Next</span>
										  -->
										 </a> 
									
									<!-- / 화살표 버튼 끝 -->
									<!-- 인디케이터 -->
									<ul class="carousel-indicators" id="indi">
										<li data-target="#demo" data-slide-to="0" class="active"></li>

									</ul>
									<!-- 인디케이터 끝 -->
								</div>
							</div>
						<tbody id="tbody">
						
						
						</tbody>
					</table>
					<input type="hidden" id="glly_no" name="glly_no" value="${gllyNo}" />
					<!-- 게시글 번호 -->
					<input type="hidden" id="search_type" name="search_type" value="S" />
					<!-- 조회 타입 - 상세(S)/수정(U) -->
				</form>
				<div class="" style="margin-top: 20px; margin-bottom: 20px;height:60px;">
					<button type="button" class="" onclick="javascript:goGlaaList();">목록으로</button>
					<%if(name != null){ %>
					<button type="button" class="" onclick="javascript:goGlaaUpdate();">수정하기</button>
					<button type="button" class="" onclick="javascript:goDeleteGlaa();">삭제하기</button>
					<%} %>
				</div>
			</div>
		<div>
		<span class="nxt_fix" style="display: none;"></span>
		</div>
	
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</html>