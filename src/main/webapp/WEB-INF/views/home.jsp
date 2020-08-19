<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  		<%@ include file="/WEB-INF/views/header.jsp" %>
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
        	<!-- <div>
		      <img data-lazy="http://placehold.it/350x300?text=1-350w" data-srcset="http://placehold.it/650x300?text=1-650w 650w, http://placehold.it/960x300?text=1-960w 960w" data-sizes="100vw">
		    </div>
		    <div>
		      <img data-lazy="http://placehold.it/350x300?text=2-350w" data-srcset="http://placehold.it/650x300?text=2-650w 650w, http://placehold.it/960x300?text=2-960w 960w" data-sizes="100vw">
		    </div>
		    <div>
		      <img data-lazy="http://placehold.it/350x300?text=3-350w"  data-srcset="http://placehold.it/650x300?text=3-650w 650w, http://placehold.it/960x300?text=3-960w 960w" data-sizes="100vw">
		    </div>
		    <div>
		      <img data-lazy="http://placehold.it/350x300?text=4-350w"  data-srcset="http://placehold.it/650x300?text=4-650w 650w, http://placehold.it/960x300?text=4-960w 960w" data-sizes="100vw">
		    </div>
		    <div>
		      <img data-lazy="http://placehold.it/350x300?text=5-350w"  data-srcset="http://placehold.it/650x300?text=5-650w 650w, http://placehold.it/960x300?text=5-960w 960w" data-sizes="100vw">
		    </div>
		    <div>
		      this slide should inherit the sizes attr from the parent slider
		      <img data-lazy="http://placehold.it/350x300?text=6-350w"  data-srcset="http://placehold.it/650x300?text=6-650w 650w, http://placehold.it/960x300?text=6-960w 960w">
		    </div> -->
        
            <div class="container" style="background:url('../image/img/main/main_bg1.jpg') no-repeat center; height:640px;  background-size:100%; max-width:none;margin-top:93px;">
                <div class="masthead-subheading">성장하는 회사</div>
                <div class="masthead-heading text-uppercase">퇴사를 위한 회사</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/braa/braa.do">문의하기</a>
            </div>
            <div class="container" style="background:url('../image/img/main/main_bg2.jpg') no-repeat center; height:640px; background-size:100%; max-width:none;margin-top:93px;">
                <div class="masthead-subheading">연봉 1억2천만원 !!</div>
                <div class="masthead-heading text-uppercase">퇴사 하고 싶다</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/braa/braa.do">문의하기</a>
            </div>
            <div class="container" style="background:url('../image/img/main/main_bg3.jpg') no-repeat center; height:640px; background-size:100%; max-width:none;margin-top:93px;">
                <div class="masthead-subheading">배우는 회사!</div>
                <div class="masthead-heading text-uppercase">하루 3시간 근무하는 회사</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/braa/braa.do">문의하기</a>
            </div>
            <div class="container" style="background:url('../image/img/main/main_bg1.jpg') no-repeat center; height:640px; background-size:100%; max-width:none;margin-top:93px;">
                <div class="masthead-subheading">배가 고프다!</div>
                <div class="masthead-heading text-uppercase">소고기 사주는  회사</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/braa/braa.do">문의하기</a>
            </div>
            <div class="container" style="background:url('../image/img/main/main_bg2.jpg') no-repeat center; height:640px; background-size:100%; max-width:none;margin-top:90px;">
                <div class="masthead-subheading">집가까운 회사!</div>
                <div class="masthead-heading text-uppercase">해외여행 가고싶다</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/braa/braa.do">문의하기</a>
            </div>
            <div class="container" style="background:url('../image/img/main/main_bg3.jpg') no-repeat center; height:640px; background-size:100%; max-width:none;margin-top:90px;">
                <div class="masthead-subheading">개발자를 위한 회사</div>
                <div class="masthead-heading text-uppercase">맥북 최신 제공</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/braa/braa.do">문의하기</a>
            </div>
            </section>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">회사 소개</h2>
                    <h3 class="section-subheading text-muted">(주)희망이앤지 회사 소개입니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">정직함</h4>
                        <p class="text-muted">저희 회사는 정직합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">모범</h4>
                        <p class="text-muted">타의 모범이 됩니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">기술력</h4>
                        <p class="text-muted">세계안전협회가 인정한 기술력</p>
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
                         	<button class="btn btn-primary btn-xl text-uppercase mvGraa" type="button" style="" onclick="location.href='/glaa/uploadForm.do'"> 갤러리 이동하기 </button>
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
                            <a class="portfolio-link" href="/glaa/uploadForm.do">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/image/img/portfolio/02-thumbnail.jpg" alt="" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">전기부품</div>
                                <div class="portfolio-caption-subheading text-muted">좋은 부품</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="/glaa/uploadForm.do">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="/image/img/portfolio/03-thumbnail.jpg" alt="" />
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
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">작업단계</h2>
                    <h3 class="section-subheading text-muted">안전하고 체계적인 단계를 밟습니다.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="/image/img/about/1.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>분석</h4>
                                <h4 class="subheading">요구사항분석</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">요구사항을 분석 합니다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="/image/img/about/2.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>설계</h4>
                                <h4 class="subheading">잘 설계합니다</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">설계 합니다</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="/image/img/about/3.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>체크</h4>
                                <h4 class="subheading">체크합니다</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">잘 체크합니다</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="/image/img/about/4.jpg" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>구축</h4>
                                <h4 class="subheading">시스템 구축을 합니다.</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">시스템 구축</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                               	시스템  완료
                                <br />
                           		    설비
                                <br />
              					   완료
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- Clients-->
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/logos/envato.jpg" alt="" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/logos/designmodo.jpg" alt="" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/logos/themeforest.jpg" alt="" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid d-block mx-auto" src="/image/img/logos/creative-market.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">문의하기</h2>
                    <h3 class="section-subheading text-muted">궁금한 사항을 문의합니다.</h3>
                </div>
                    <div class="text-center">
                        <div id="success"></div>
                        <button class="btn btn-primary btn-xl text-uppercase" id="sendMessageButton" type="submit" onclick="location.href='/braa/braa.do'">문의하기</button>
                    </div>
            </div>
        </section>
       
        <!-- Portfolio Modals-->
        <!-- Modal 1-->
        <%@ include file="/WEB-INF/views/footer.jsp" %>
        
        
        <!-- Bootstrap core JS-->
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <!-- <script src="/image/mail/jqBootstrapValidation.js"></script>
        <script src="/image/mail/contact_me.js"></script> -->
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    </body>
</html>
