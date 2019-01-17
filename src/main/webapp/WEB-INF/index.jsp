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
								<li><img src="resources/img/index/jeju5.jpg" alt="" height="380" />
								<div class="flex-caption"><h4>제주도 여행 준비하기</h4>
								<p>사전 준비와 계획을 안내 해드립니다.</p>
								<a href="board/boardlist3.do" class="btn btn-theme">더 자세한 정보를 알고 싶다면?</a>
								</div>
								</li>
								<li><img src="resources/img/index/jeju3.gif" alt="" height="380" />
								<div class="flex-caption"><h4>일별 여행 코스는?</h4>
								<p>일별로 일정을 안내 해드립니다.</p>
								<a href="board/boardlist2.do" class="btn btn-theme">더 자세한 정보를 알고 싶다면?</a>
								</div>
								</li>
								<li><img src="resources/img/index/jeju4.jpg" alt="" height="380" />
								<div class="flex-caption"><h4>제주도에도 사파리가 있나?</h4>
								<p>관련 여행지를 안내 해드립니다.</p>
								<a href="board/boardlist2.do" class="btn btn-theme">더 자세한 정보를 알고 싶다면?</a>
								</div>
								</li>
								<li><img src="resources/img/index/jeju.jpg" alt="" height="380" />
								<div class="flex-caption"><h4>제주도엔 뭐가 있지?</h4>
								<p>추천 여행지를 안내 해드립니다.</p>
								<a href="board/boardlist2.do" class="btn btn-theme">더 자세한 정보를 알고 싶다면?</a>
								</div>
								</li>
								<li><img src="resources/img/index/jeju6.jpg" alt="" height="380" />
								<div class="flex-caption"><h4>박물관은 살아있다</h4>
								<p>살아 있을까요 죽었을까요?</p>
								<a href="board/boardlist2.do" class="btn btn-theme">더 자세한 정보를 알고 싶다면?</a>
								</div>
								</li>
								
							</ul>
						</div>
						<!-- end slider -->
					</div>
				</div>
			</div>
		</section>
		
		<section class="callaction" style="height:300px; padding:0px; top-padding:10px;">
			<div class="container">
				<div class="col-lg-12"><h5>최근 등록된 여행상품</h5></div>
				<div class="row">
					<div class='col-lg-6'>
						<div class="box" id="boardDiv"></div>
					</div>
					<div class='col-lg-6'>
						<div>
							<h5>여행 상품 정보</h5>
							<p>제주도의 여행상품을 확인하실 수 있습니다.</p>
							<p>준비를 못 하셨거나 필요한 것이 생각나지 않으면</p>
							<p>여행상품을 확인하러 가보세요</p>
							<p><a href="/board/adBoard.go">보러가기</a></p>
						</div>
					</div>
				</div>
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
