<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Agency - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="/image/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slick.css">
  		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slick-theme.css">
    </head>
    
    <%
    	String id;
    	id = (String)session.getAttribute("name");
    %>
    
    <body id="page-top">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script>
    $(function(){
    	
    });
    
    </script>
     <c:set var="id" value="<%=id%>" />
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="/"><img src="/image/img/navbar-logo.svg" alt="" /></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                   		<c:if test="${ id ne null}">
                    		<li id="adminMenu" class="nav-item"><a class="nav-link js-scroll-trigger" href="/admin/logout.do">로그아웃</a></li>
                    	</c:if>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/">메인으로</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/iraa/iraa.do">회사소개</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/glaa/glaa.do">갤러리</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/braa/braa.do">문의 게시판</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Masthead-->
    </body>
</html>