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
        <title>(주)희망이엔지</title>
        <link rel="icon" type="image/x-icon" href="/image/img/logos/HMeng_icon.png" />
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
    
    
    
    <body id="page-top">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script>
    $(function(){
    	//$('#Progress_Loading').hide();
    });
    </script>
	    <div id="Progress_Loading" class="Progress_Loading"><!-- 로딩바 -->
			<img src="/image/img/loading_progress.gif" alt="로딩중입니다..."/>
			<div class="loadingTxt"style="">
				화면 로딩 중입니다.
			</div>
		</div>
     
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="/"><img src="/image/img/logos/logo_white.png" style="width:60px;height:60px;" alt="" />(주)희망이엔지</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/">메인으로</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/iraa/iraa.do">회사소개</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/glaa/glaa.do">갤러리</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/braa/braa.do">문의 게시판</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!-- Masthead-->
    </body>
</html>
