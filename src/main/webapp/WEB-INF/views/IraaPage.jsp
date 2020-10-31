<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사소개</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		$("#btn_infoCompany").click(function(){
			$("#infoCompany").show();
			$("#infoCEO").hide();
		});
	
		$("#btn_infoCEO").click(function(){
			$("#infoCEO").show();
			$("#infoCompany").hide();
		});
		
		
	})

	
	
</script>
<div class="inner">
	<h2 class="" > 회사 소개</h2>
	
	<button id="btn_infoCEO" type="button" class="">CEO인사</button>
	<button id="btn_infoCompany" type="button" class="">희망ENG소개</button>
	
	<div id="infoCEO" style="">
	<div style="margin:0 auto; border-bottom:1px solid #cfcfcf"></div>
		<div style="font-size:40px;padding:2%;text-align:left;">
			CEO 인사말
		</div>
		
		<div class="introArea">
			<div class ="ceoComment" style="">
			 <span class="infoSpan">주식회사 희망ENG</span>는 <br>자동제어 및 전기공사를 주업무로 하고 있는기업으로<br>
			 2018년 10월 회사창립 이후로 끊임없이 고객만족을 목표로 각 분야별로 최선을
			다해 달려왔습니다.<br><br>
			<span class="infoSpan">최고의 품질</span>, <span class="infoSpan">최고의 서비스</span> 경영이념으로
			최상의 서비스 공급을 위해 최선을 다하고 있습니다.<br>
			끊임없이 쏟아져 나오는 신기술을 자체 개발 및 교육을 통하여 진보된
			기술력으로 고객을 만족시키기 위해 노력하고 있습니다.<br>
			<br>
			이에 기술력과 품질 만큼은 어느 타사보다 높은 자부심을 가지고
			있습니다.
			 하지만, 현재에 만족하지 않고 더 큰 고객만족을 위해 ㈜희망ENG는 
			계속해서 신기술 개발에 노력할 것임을 약속 드립니다.
			<br>
			 앞으로 더욱더 발전할 ㈜희망ENG를 지켜봐 주시고 많은 애정과 관심을 부탁 드립니다.
					
			</div>
			<div class="col-lg-4 mb-4 ceoPicture" style="">
				<img style="width:100%;" src="/image/img/iraa/picCEO.jpg" alt="CEO사진"/>
				<span class="imgTxt">CEO 김종진</span>
			</div>
		</div>
		
	</div>
	
	
	<div id="infoCompany" style="display:none">
	<div style="margin:0 auto; border-bottom:1px solid #cfcfcf"></div>
		<div style="font-size:40px;padding:2%;text-align:left;">
			<img style="width:90px;padding-bottom:30px;" src="/image/img/logos/HMeng_icon.png" alt="희망ENG 로고"/>
			희망ENG 소개
		</div>
		<div class="introArea">
			<div class="infoTxt">
			<span class="infoSpan">주식회사 희망ENG</span>는 <br>자동제어 및 전기공사를 주업무로 하고 있는기업으로<br>
			국내 여러 PLC, HMI 계장 배선등 끊임없이 쏟아져 나오는 신기술들의 기술력 함양을 통해
			고객을 만족시키기 위해 노력하고 있습니다.<br><br>
			기술력과 품질 만큼은 <span class="infoSpan">어느 타사보다 높은자부심</span>을 가지고 있습니다.
			
			하지만, 현재에 만족하지 않고 더 큰 고객만족을 위해 
			㈜희망ENG는 계속해서 신기술 개발에 노력할 것임을 약속 드립니다
					
			</div>
			<div class="infoChart">
				<img style="" src="/image/img/iraa/organ_chart.png" alt="CEO사진"/>
				<span class="imgTxt">회사 조직도</span>
			</div>
		</div>
	</div>
</div><!-- inner --></body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>
