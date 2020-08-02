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
<form action="/glaa/Glaa1000_insert.do" method="POST">
<table>
  <tr>
   <td>
   <table width="500" cellpadding="7" cellspacing="0" border="1">
    <tr>
    	<td align="center" width="120">이름</td>
    	<td><input type="text" name="userNm"></td>
    	<td align="center" width="120">비밀번호</td>
    	<td><input type="text" name="userPw"></td>
    </tr>
     <tr>
    	<td align="center" width="120">이메일</td>
    	<td><input type="text" name="userEmail"></td>
    	<td align="center" width="120">휴대전화</td>
    	<td><input type="text" name="userPhone"></td>
    </tr>
    <tr>
    	<td align="center">제목</td>
    	<td colspan="3"><input type="text" name="braaNm"></td>
    </tr>
    <tr>
    	<td align="center">상태</td>
    	<td><input type="text" name="braaStus" value="S"></td>
    </tr>
<!--     <tr>
    	<td align="center">첨부파일</td>
    	<td><input type="text" name="title"></td> 첨부파일 지정 
    </tr> -->
    <tr>
      <td align="center" height="100" >내용</td>
      <td height="150" colspan="3">
       <textarea name="braaCts"></textarea>
      </td>
     </tr>   
    </table>
   </td>
  </tr>
 </table>
 <input type=reset value="초기화">
 <input type=submit value="등록">
 <input type=button value="목록">
    <input type="file", name="uploadfile" placeholder="파일 선택" /><br/>
    <input type="submit" value="업로드">
</form>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>