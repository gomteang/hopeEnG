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
$(document).ready(function(){        
    
});
    
/** 갤러리 - 목록 페이지 이동 */
function goGlaaList(){                
    location.href = "/glaa/glaa.do";
}

/** 갤러리 - 작성  */
function insertGlaa(){

	var formData = new FormData($('#gllyForm')[0])
	
    var gllySubject = $("#gllyNm").val();
    var gllyContent = $("#gllyCts").val();
        
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
    
    if(fileExt != "img" && fileExt != "jpg" && fileExt != "jpeg" && fileExt != "png" && fileExt != "gif"){
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
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                   		<tr>
                            <th>메인화면 표시 여부<span class="t_red">*</span></th>
                            <td>
                            <select id="imgPstn" class="form-control-small" name="imgPstn">
							<option value="T">상단 표시</option>
							<option value="B">하단 표시</option>
							<option value="N" selected>미표시</option>
							</select>
							</td>
                        </tr>
                        <tr>
                            <th>제목<span class="t_red">*</span></th>
                            <td><input class="form-control" id="gllyNm" name="gllyNm" value="" class="tbox01"/></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea class="form-control" id="gllyCts" name="gllyCts" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th>메인 문구<span class="t_red"></span></th>
                            <td><textarea class="form-control" id="mainComment" name="mainComment" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th>추가 문구<span class="t_red"><span></th>
                            <td><textarea class="form-control" id="subComment" name="subComment" cols="30" rows="10" class="textarea01"></textarea></td>
                        </tr>
                        <tr>
                            <th scope="row">첨부파일</th>
                            <td><input multiple="multiple" type="file" accept="image/*" id="files[0]" onchange="checkFile(this)" name="files[0]" value="" >img, gif, png, jpg, jpeg 파일만 가능합니다.</td>
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