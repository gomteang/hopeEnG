<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File upload using Commons FileUpload</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>


<body>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
var g_form = new Array();
g_form[0] = new Array('상단표시', '하단표시');
g_form[1] = new Array('메인표시');

function pstnInit(gllyDist){
	
	var pstnOptions = new Array();
	pstnOptions[0] = new Array("미등록", "상단등록", "하단등록");
	pstnOptions[1] = new Array("미등록", "메인등록");
	
	var pstnValues = new Array();
	pstnValues[0] = new Array("N", "T", "B");
	pstnValues[1] = new Array("N", "V");
	
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
});

window.onload = function(){
	pstnInit("I");
}

    
/** 갤러리 - 목록 페이지 이동 */
function goGlaaList(){                
    location.href = "/glaa/glaa.do";
}

/** 갤러리 - 작성  */
function insertGlaa(){

	var formData = new FormData($('#gllyForm')[0])
	
    var gllySubject = $("#gllyNm").val();
    var gllyContent = $("#gllyCts").val();
    var gllyDist    = $("#gllyDist").val();
    
    if (gllySubject == ""){            
        alert("제목을 입력해주세요.");
        $("#gllyNm").focus();
        return;
    }
    
    if (gllyContent == ""){            
        alert("내용을 입력해주세요.");
        $("#gllyCts").focus();
        return;
    }
    
    var fileCheck = document.getElementById("files[0]").value;
    if(!fileCheck){
    	alert("파일을 첨부해 주세요");
    	return;
    }
    
    var lastDot = fileCheck.lastIndexOf('.');
    var fileExt = fileCheck.substring(lastDot+1, fileCheck.length).toLowerCase();
    
    if(gllyDist == "I" && (fileExt != "img" && fileExt != "jpg" && fileExt != "jpeg" && fileExt != "png" && fileExt != "gif")){
    	alert("등록할 수 없는 파일 입니다.");
    	return;
    }else if(gllyDist == "V" && (fileExt != "avi" && fileExt != "mp4" && fileExt != "wmv" && fileExt != "mkv")){
    	alert("등록할 수 없는 파일 입니다.");
    	return;
    }
   
        
    var yn = confirm("게시글을 등록하시겠습니까?");        
    if(yn){
    	
         $.ajax({
            url   : "/glaa/Glaa1000_insert.do",
			data : formData,
			contentType : false,
			processData : false,
            enctype    : "multipart/form-data",
            cache   : false,
            async   : true,
            type    : "POST",                         
            success : function(obj) {
                insertGlaaCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
        });
        //$("#gllyForm").submit(); 

    }
 
}

/** 게시판 - 작성 콜백 함수 */
function insertGlaaCallback(obj){

    if(obj != null){        
              
        if(obj == "SUCCESS"){                
            alert("게시글 등록을 성공하였습니다.");                
            location.href = "/glaa/glaa.do";          
        } else {                
            alert("게시글 등록을 실패하였습니다.");    
            return;
        } 
    }
}
function checkFile(el){

	var file = el.files;

	var sum=0;
	for(i=0; i < file.length; i++){
		sum += file[i].size;
	}
	//alert(sum);
	if(sum > 3 * 1024 *1024){
		alert('3MB 이상 첨부할 수 없습니다.\n\n' + '현재파일 용량 : ' + (Math.round(sum / 1024 / 1024 * 100) / 100) + 'MB');
	}
	else return;

	el.outerHTML = el.outerHTML;
}

</script>

<div id="wrap">
    <div id="container">
        <div class="inner">       
            <h2>게시글 작성</h2>
            <form id="gllyForm" name="gllyForm" action="/glaa/Glaa1000_insert" enctype="multipart/form-data" method="post" onsubmit="return false;">
                <table width="100%" class="table02">
                <caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
                    <colgroup>
                        <col width="10%">
                        <col width="30%">
                        <col width="15%">
                        <col width="30%">
                    </colgroup>
                    <tbody id="tbody">
                   		<tr>
                   			<th>파일 종류</th>
                   			<td>
                   				<select id="gllyDist" class="form-control-small" name="gllyDist" onchange="pstnInit(this)">
									<option value="I">사진</option>
                   					<option value="V">영상</option>
                   				</select>
                   			</td>
                            <th>메인화면 등록 여부<span class="t_red"></span></th>
                            <td>
		                        <select id="imgPstn" class="form-control-small" name="imgPstn">
									<option value="N" selected>-</option>
								</select>
							</td>
                        </tr>
                        <tr >
                            <th>제목<span class="t_red">*</span></th>
                            <td colspan="3"><input class="form-control" id="gllyNm" name="gllyNm" value="" class="tbox01"/></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td colspan="3"><textarea class="form-control" id="gllyCts" name="gllyCts" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th>메인 문구<span class="t_red"></span></th>
                            <td colspan="3"><textarea class="form-control" id="mainComment" name="mainComment" cols="30" rows="3" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th>추가 문구<span class="t_red"><span></th>
                            <td colspan="3"><textarea class="form-control" id="subComment" name="subComment" cols="30" rows="5" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th scope="row">첨부파일</th>
                            <td colspan="1"><input multiple="multiple" type="file" accept="image/*" id="files[0]" onchange="checkFile(this)" name="files[0]" value="">
                            </td>
                            <td colspan="2"><p id="extText"></p></td>
                        </tr>
                       
					
                    </tbody>
                </table>
                <div class="" style="margin-top:20px;">
	                <button type="button" class="" onclick="javascript:goGlaaList();">목록으로</button>
	                <button type="button" class="" onclick="javascript:insertGlaa();">등록하기</button>
	            </div>
            </form>
            
        </div>
    </div>
</div>
</body>
</html>