<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
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
  		<%@ include file="/WEB-INF/views/comm/header.jsp" %>
  		<style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {
        width: 100%;
        /* margin: 100px auto; */
    }

    .slick-slide {
      /* margin: 0px 20px; */
    }

    .slick-slide img {
      width: 100%;
    }

    /* .slick-prev:before,
    .slick-next:before {
      color: black;
    } */


    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    
    .slick-active {
      opacity: .5;
    }

    .slick-current {
      opacity: 1;
    }
  </style>
  		
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
     <script src="${pageContext.request.contextPath}/js/slick.js" type="text/javascript" charset="utf-8"></script>
     <script type="text/javascript">
     	$(function(){
			
			ajaxComm("/Home1000_select.do","",homeSelectCallback,errorCallbackfn);
			
     	});
     	
     	function errorCallbackfn(){
     			var appendDiv = ""
    			
    			appendDiv = "<div class='container' style=\'background:url("+"../image/img/main/main_bg1.jpg"+") no-repeat center; height:640px;  background-size:100%; max-width:none;background-size: cover;\'>";
				appendDiv += "<div class='masthead-subheading'>For Number One!</div>";
				appendDiv += "<div class='masthead-heading text-uppercase'>최고의 품질과 서비스<br><br> 끊임없는 신기술 역량함양으로 고객만족 실현</div>";
				appendDiv += "<a class='btn btn-primary btn-xl text-uppercase js-scroll-trigger' href='/braa/braa.do'>문의하기</a>";
				appendDiv += "</div>";
				
				//임시 Top 설정
				$(".slider").append(appendDiv);
				$(".slider").append(appendDiv);	
				
				//임시이미지
    			$("#gally01").append("<img class='img-main-gallery' src='/image/img/portfolio/02-thumbnail.jpg' alt='' />");
    			$("#gally02").append("<img class='img-main-gallery' src='/image/img/portfolio/03-thumbnail.jpg' alt='' />");
				
    			makeSlick();
     	}
     	
     	function makeSlick(){
     		$(".lazy").slick({
		   		lazyLoad: 'ondemand', // ondemand progressive anticipated
		        infinite: true,
		        arrows : true,
		        slidesToShow : 1,
		        fade: true,
		        slidesToScroll: 1,
		        speed: 1500,
		        dots: true,
		        prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'>Next</button>"		// 다음 화살표 모양 설정
		       });
     	}
     	
     	
     	function homeSelectCallback(result){
    		var stus = "";
    		var click = "";
    		//이미지 Top
    		if(result.HomeTopList.length >0){
    			
    			for(var i in result.HomeTopList){
    				var appendDiv = ""
    				
    				appendDiv = "<div class='container' style='background:url("+"/glly/"+result.HomeTopList[i].filePath+") no-repeat center; height:640px;  background-size:100%; max-width:none;background-size: cover;'>";
    				appendDiv += "<div class='masthead-subheading'>"+result.HomeTopList[i].mainComment+"</div>";
    				appendDiv += "<div class='masthead-heading text-uppercase'>"+result.HomeTopList[i].subComment+"</div>";
    				appendDiv += "<a class='btn btn-primary btn-xl text-uppercase js-scroll-trigger' href='/braa/braa.do'>문의하기</a>";
    				appendDiv += "</div>";
    				
    				$(".slider").append(appendDiv);
    			}
    			
    			makeSlick();
    		}
    		else{
    			var appendDiv = ""
    			
    			appendDiv = "<div class='container' style='background:url("+"../image/img/main/main_bg1.jpg"+") no-repeat center; height:640px;  background-size:100%; max-width:none;background-size: cover;'>";
				appendDiv += "<div class='masthead-subheading'>For Number One!</div>";
				appendDiv += "<div class='masthead-heading text-uppercase'>최고의 품질과 서비스<br><br> 끊임없는 신기술 역량함양으로 고객만족 실현</div>";
				appendDiv += "<a class='btn btn-primary btn-xl text-uppercase js-scroll-trigger' href='/braa/braa.do'>문의하기</a>";
				appendDiv += "</div>";
				
				$(".slider").append(appendDiv);
				$(".slider").append(appendDiv);
				
				makeSlick();
    		}
    		//이미지 bottom
    		if(result.HomeBottmList.length >0){
	    		for(var i=0; i<result.HomeBottmList.length;i++){
	    			if(i>2) break;
	    			$("#gally0"+(i+1)).append("<img class='img-main-gallery' src=\'/glly/"+result.HomeBottmList[i].filePath+"'/>");
	    			$("#gally0"+(i+1)).siblings().children().eq(0).text(result.HomeBottmList[i].mainComment);
    				$("#gally0"+(i+1)).siblings().children().eq(1).text(result.HomeBottmList[i].subComment);
	    		}
	    		
	    		for(var i=1;i<=2;i++){
	    			if($("#gally0"+i+">img").length == "0"){
	    				$("#gally0"+i).append("<img class='img-main-gallery' src='/image/img/portfolio/02-thumbnail.jpg' alt='' />");
	    			}
	 
	    		}
    		}
    		else{
    			$("#gally01").append("<img class='img-main-gallery' src='/image/img/portfolio/02-thumbnail.jpg' alt='' />");
    			$("#gally02").append("<img class='img-main-gallery' src='/image/img/portfolio/03-thumbnail.jpg' alt='' />");
    		}
    		
    		return;
    	}
     	
     	function ajaxComm(url, data, callback,errorCallback){
    		$.ajax({
    			url:url,
    			type:"get",
    			data:data,
    			dataType:"json",
    			contentType:"application/json; charset=UTF-8",
    			success:callback,
    			error:errorCallback
    		});
    	}
    	$(document).ajaxStart(function(){
    		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
    	})
    	$(document).ajaxStop(function(){
    		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
    	});
     	
   	 </script>
    </head>
    <body id="page-top">
    
     
        <!-- Navigation-->
        <!-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="/image/img/navbar-logo.svg" alt="" /></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">서비스</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">포트폴리오</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">소개</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">팀</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">연락</a></li>
                    </ul>
                </div>
            </div>
        </nav> -->
        <!-- Masthead-->
        <header class="masthead">
        <section class="lazy slider" data-sizes="50vw">
        	
            </section>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase" data-speed="10">(주)희망이엔지 소개</h2>
                    <h3 class="section-subheading text-muted">자동제어 및 전기공사를 이끄는 기업 ㈜희망ENG는 일류기업으로 성장하기 위해 최고의 품질과 서비스를 제공하기 위해 최선을 다하고 있으며,<br>끊임없는 노력으로 신기술 역량함양으로  고객의 만족을 실현하기 위해 노력하고 있습니다.
                    </h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-user fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">정직함</h4>
                        <p class="text-muted">사람을 위한, 사람을 <br>향한 기술을 연구하고 개발합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">팀워크</h4>
                        <p class="text-muted">개개인의 능력뿐만 아니라<br>팀워크 또한 최고를 자랑합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-tools fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">기술력</h4>
                        <p class="text-muted">쏟아져 나오는 신기술들의 기술력 함양을 통한<br>고객 만족을 위해 노력하고 있습니다.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">갤러리</h2>
                    <h3 class="section-subheading text-muted">저희 회사가 작업의 일부 사진입니다.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4" style="">
                         <div class="portfolio-item" >
                         <div style="padding:80px 20px 60px 60px !important;background-color:#272e38;">
                         	<div style="color:#fff;font-size:24px;font-weight:bold;">
                         	ABOUT US
                         	</div>
                         	<br/>
                         	<button class="btn btn-primary btn-xl text-uppercase mvGraa" type="button" style="" onclick="location.href='/glaa/glaa.do'"> 갤러리 이동하기 </button>
                         </div>
                        <!--     <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/image/img/portfolio/01-thumbnail.jpg" alt="" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">자동화 솔루션</div>
                                <div class="portfolio-caption-subheading text-muted">최고의 기술력</div>
                            </div> -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a id="gally01" class="portfolio-link" href="/glaa/glaa.do">
                                <div  class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">전기부품</div>
                                <div class="portfolio-caption-subheading text-muted">좋은 부품</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a id="gally02" class="portfolio-link" href="/glaa/glaa.do">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">관리시스템</div>
                                <div class="portfolio-caption-subheading text-muted">시스템관리</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About-->
        
        <!-- Clients-->
        <div class="py-5">
            <div class="container slick_icon" id="">
                <div class="row">
                    <div class="col-md-3 col-sm-5 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/main/DSME.png" alt="" /></a>
                    </div>
                    <div class="col-md-3 col-sm-5 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/main/metanetDT.png" alt="" /></a>
                    </div>
                    <div class="col-md-3 col-sm-5 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/main/STM.png" alt="" /></a>
                    </div>
                    <div class="col-md-3 col-sm-5 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/main/KICS.png" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">문의하기</h2>
                    <h3 class="section text-muted">궁금하신 사항이나 문의사항 글을 올려주시면,<br>성심성의껏 답해 드리겠습니다.</h3>
                </div>
                    <div class="text-center" style="margin-top:15px;">
                        <div id="success"></div>
                        <button class="btn btn-primary btn-xl text-uppercase" id="sendMessageButton" type="submit" onclick="location.href='/braa/braa.do'">문의하기</button>
                    </div>
            </div>
        </section>
       
        <!-- Portfolio Modals-->
        <!-- Modal 1-->
        <%@ include file="/WEB-INF/views/comm/footer.jsp" %>
        
        
        <!-- Bootstrap core JS-->
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script> -->
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <!-- <script src="/image/mail/jqBootstrapValidation.js"></script>
        <script src="/image/mail/contact_me.js"></script> -->
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    </body>
</html>
