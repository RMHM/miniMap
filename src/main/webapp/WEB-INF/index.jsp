<%@
	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>miniMap에 오신걸 환영합니다.</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<style>
		.fancybox-overlay [class^="fancybox-"] {
			max-width : width;
		}
		
		.fancybox-close {
			
		}
		
		#main-slider img, .flexslider{
			width : 100%;
			height : 500px;
		}
	</style>
</head>
<body>
	<!-- 외부파일 선언 -->
	<c:import url="views/common/exFile.jsp" />
	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="views/common/header.jsp" />

		<section id="featured">
			<!-- start slider -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Slider -->
						<div id="main-slider" class="flexslider">
							<ul class="slides">
                <li><img src="resources/img/member/e.jpg" alt="" /></li>
								<li><img src="/resources/img/index/index_sketch.png" alt="" /></li>
								<li><img src="/resources/img/index/2.jpg" alt="" /></li>
								<li><img src="/resources/img/index/index_horse.png" alt="" /></li>
								<li><img src="/resources/img/index/1.jpg" alt="" /></li>
								<li><img src="/resources/img/index/3.jpg" alt="" /></li>
							</ul>
						</div>
						<!-- end slider -->
					</div>
				</div>
			</div>
		</section>
		
		<h3 align='center'>실시간 타임라인</h3>
		<section class="callaction" style="height:270px !important;">
			<div class="box" id="siltaja" name="siltaja"></div>
			<div id="letustl" style='position:absolute !important; right:150px !important;'>
				<h5 id='letTxt' style='line-height:1.7em;'>
					타임라인에서 다른 여행객들과 실시간으로 정보를 공유해보세요!<br>
					고기국수는 어디가 맛있을까요?<br>
					길이 막히지는 않을까요?<br>
					같이 올레길을 걸을 친구가 필요하지 않으세요?<br>
					지금 타임라인을 이욯하세요!<br>
				</h5>			
				<button id="tlBtn" onclick="window.location.href='/echo.do'">타임라인 이용하기</button>
			</div>
		</section>
		
		<br>
		
		<!-- counter section -->
		<section class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-4">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>전체 방문자 수</h4>
										<div class="icon">
											<i class="fa fa-user-plus fa-3x"></i>
											<div class="counter" data-count="9">0</div>
										</div>
										<p>현재까지 우리를 방문해주신 분들은?</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>오늘 방문자 수</h4>
										<div class="icon">
											<i class="fa fa-users fa-3x"></i>
											<div class="counter" data-count="99">0</div>
										</div>
										<p>오늘 우리를 방문해주신 분들은?</p>

									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>평균 방문자 수</h4>
										<div class="icon">
											<i class="fa fa-balance-scale fa-3x"></i>
											<div class="counter" data-count="999">0</div>
										</div>
										<p>하루에 우리를 이용해주시는 분들은?</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- end counter -->
		<br>
		
		<section id="content">
			<div class="container">
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Portfolio Projects -->
				<div class="row">
					<div class="col-lg-12">
						<h4 class="heading">최근 후기 게시물</h4>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
								</ul>
							</section>
						</div>
					</div>
				</div>

			</div>
		</section>
	</div>
	<!-- footer 선언 -->
	<c:import url="views/common/footer.jsp" />
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>
<script src="/resources/js/counter.js"></script>
<script src="/resources/js/main/index.js"></script>
<!-- <link href="/resources/css/counter.css" rel="stylesheet"/> -->
</html>
