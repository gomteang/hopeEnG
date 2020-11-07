<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>갤러리수정</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<%    
    String gllyNo = request.getParameter("gllyNo");
%>

<c:set var="gllyNo" value="<%=gllyNo%>"/> <!-- 게시글 번호 -->
 

<script type="text/javascript">

	function pstnInit(gllyDist){
		
		var pstnOptions = new Array();
		pstnOptions[0] = new Array("미등록", "상단등록", "하단등록");
		pstnOptions[1] = new Array("미등록", "메인등록");
		
		var pstnValues = new Array();
		pstnValues[0] = new Array("N", "T", "B");
		pstnValues[1] = new Array("N", "V");
	
		var fileCheck = document.getElementById("files[0]").value;
		
		var pstnOption;
		var pstnValue;
		
		var pstnId = document.getElementById("imgPstn");
		var extId = document.getElementById("extText");
		
		if(gllyDist.value == "I" || gllyDist == "I"){
			pstnOption = pstnOptions[0];
			pstnValue = pstnValues[0];
			extId.innerHTML = "img, gif, png, jpg, jpeg 파일만 가능합니다.";
		}else if(gllyDist.value == "V" || gllyDist == "V"){
			pstnOption = pstnOptions[1];
			pstnValue = pstnValues[1];
			extId.innerHTML = "avi, mp4, wmv, mkv파일만 가능합니다.";	
		}
	
		pstnId.options.length = 0;
		
		for(x in pstnOption){
			var opt = document.createElement("option");
			opt.value = pstnValue[x];
			opt.innerHTML = pstnOption[x];
			pstnId.appendChild(opt);
		}
	}
    
    $(document).ready(function(){        
    	getGlaaDetail();        
    });
    
    /** 갤러리 - 목록 페이지 이동 */
    function goGlaaList(){                
        location.href = "/glaa/glaa.do";
    }
    
    
    /** 갤러리 - 상세 조회  */
    function getGlaaDetail(boardSeq){
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
    function getGlaaDetailCallback(obj){
        var str = "";
        if(obj != null){                                
            str += "<tr>";
            str += "<th>이미지</th>";
            if(obj.fileType =="I"){
            	str += "<td>"+ "<img src='/glly/"+obj.fileNmKey+"' width=\"100%\"/>" +"</td>";
            }else{
            	str += "<td>"+ "<video src='/glly/"+obj.fileNmKey+"' width=\"100%\"/>" +"</td>";
            }
            str += "</tr>";
            $("#gllyNm").val(obj.gllyNm);
            $("#gllyCts").val(obj.gllyCts);
            $("#imgPstn").val(obj.imgPstn);
            $("#mainComment").val(obj.mainComment);
            $("#subComment").val(obj.subComment);
        } else {
            alert("등록된 글이 존재하지 않습니다.");
            return;
        }        
        
         $("#tbody").append(str);
    }
    
    // 갤러리 수정
    function updateGlaaDetail(){
    	var obj = new Object();
    	obj.gllyNm = $("#gllyNm").val();
    	obj.gllyCts = $("#gllyCts").val();
    	obj.imgPstn = $("#imgPstn").val();
    	
    	if(obj.gllyNm == ""){
    		alert("제목을 입력해주세요.");
    		$("#gllyNm").focus();
    		return;
    	}
    	if(obj.gllyCts == ""){
    		alert("내용을 입력해주세요.");
    		$("#gllyCts").focus();
    		return;
    	}
    	//var jsonData = JSON.stringify(obj);
    	var yn = confirm("게시물을 수정하시겠습니까?");
    	if(yn){
    		$.ajax({
    			url			: "/glaa/Glaa1000_updateGlaa",
    			data		: $("#glaaVO").serialize(),//jsonData//
    			dataType	: "text",
    			cache		: false,
    			async 		: true,
    			type		: "POST",
    			success		: function(obj){
    				updateGlaaCallback(obj);
    				
    			},
    			error		: function(xhr, status, error){}
    		});
    	}
    }
    // 수정 콜백함수
    function updateGlaaCallback(obj){
    	if(obj != null){
    		if(obj == "SUCCESS"){
    			alert("게시글 수정을 성공하였습니다.");
    			location.href ="/glaa/glaa.do";
    		}else{
    			alert("게시글 수정을 실패하였습니다.");
    			return;
    		}
    	}
    }
</script>
</head>
<body>

    
<div id="wrap">
    <div id="container">
        <div class="inner">    
            <h2>게시글 상세</h2>
            <form id="glaaVO" name="glaaVO">        
                <table width="100%" class="table">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="*">
                    </colgroup>
						<tbody id="tbody">
							<tr>
								<th>메인화면 표시 여부<span class="t_red">*</span></th>
								<td><select id="imgPstn" name="imgPstn" class="form-control-small">
										<option value="T">상단 표시</option>
										<option value="B">하단 표시</option>
										<option value="N" selected>미표시</option>
								</select></td>
							</tr>
							<tr>
								<th>제목<span class="t_red">*</span></th>
								<td><input id="gllyNm" name="gllyNm" value=""
									class="form-control" /></td>
							</tr>

                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea class="form-control" id="gllyCts" name="gllyCts" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th>메인 문구<span class="t_red"></span></th>
                            <td><textarea class="form-control" id="comment" name="mainComment" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th>추가 문구<span class="t_red"></span></th>
                            <td><textarea class="form-control" id="subComment" name="subComment" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
						</tbody>
					</table>        
                <input type="hidden" id="glly_no"        name="gllyNo"   		value="${gllyNo}"/> <!-- 게시글 번호 -->
                <input type="hidden" id="search_type"    name="search_type"     value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
            </form>
            <div class="" style="margin-top:20px;margin-bottom:20px;">
                <button type="button" class="" onclick="javascript:goGlaaList();">목록으로</button>
                <button type="button" class="" onclick="javascript:updateGlaaDetail();">수정하기</button>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>