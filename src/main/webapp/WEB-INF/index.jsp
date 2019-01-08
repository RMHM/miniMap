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
</head>
<style>
	.test-icon:before {
		width : 25px;
		content: url("../resources/img/counter/test.png");
	}
</style>
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
								<li><img src="resources/img/member/3.jpg" alt="" />
									<div class="flex-caption">
										<h3>Modern Design</h3>
										<p>Duis fermentum auctor ligula ac malesuada. Mauris et
											metus odio, in pulvinar urna</p>
										<a href="#" class="btn btn-theme">Learn More</a>
									</div></li>
								<li><img src="resources/img/member/1.jpg" alt="" />
									<div class="flex-caption">
										<h3>Fully Responsive</h3>
										<p>Sodales neque vitae justo sollicitudin aliquet sit amet diam curabitur sed fermentum.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
									</div></li>
								<li><img src="resources/img/testImgLogo.png" alt="" />
									<div class="flex-caption">
										<h3>Clean &amp; Fast</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit donec mer lacinia.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
									</div>
								</li>
							</ul>
						</div>
						<!-- end slider -->
					</div>
				</div>
			</div>
		</section>
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
											<i class="fa test-icon fa-3x"></i>
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
		
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2>
									<span>실타자</span>
								</h2>
								<h6>(실시간 타임라인 들어갈 자리라는 뜻 ㅎ)</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
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
						<h4 class="heading">최근 인증 게시물</h4>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<!-- Item Project and Filter Name -->
									<li class="col-lg-3 design" data-id="id-0" data-type="web">
										<div class="item-thumbs">
											<!-- Fancybox - Gallery Enabled - Title - Full Image -->
											<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 1" href="resources/img/works/1.jpg">
												<span class="overlay-img"></span>
												<span class="overlay-img-thumb font-icon-plus"></span>
											</a>
											<!-- Thumb Image and Description -->
											<img src="resources/img/works/1.jpg"
												alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
										</div>
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 2" href="resources/img/works/2.jpg"> 
											<span class="overlay-img"></span>
											<span class="overlay-img-thumb font-icon-plus"></span>
										</a> <!-- Thumb Image and Description -->
										
										<img src="resources/img/works/2.jpg"
										alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 3" href="resources/img/works/3.jpg">
										<span class="overlay-img"></span>
										<span class="overlay-img-thumb font-icon-plus"></span>
									</a>
									<!-- Thumb Image and Description -->
									<img src="resources/img/works/3.jpg"
										alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 4" href="resources/img/works/4.jpg">
										<span class="overlay-img"></span>
										<span class="overlay-img-thumb font-icon-plus"></span>
									</a>
									<!-- Thumb Image and Description -->
									<img src="resources/img/works/4.jpg"
										alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									<!-- End Item Project -->
								</ul>
							</section>
						</div>
					</div>
				</div>

			</div>
		</section>
	</div>
	<!-- footer 선언 -->
	<c:import url="views/common/footer.jsp"/>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>
<script src="/resources/js/counter.js"></script>


<!-- <link href="/resources/css/counter.css" rel="stylesheet"/> -->
</html>
