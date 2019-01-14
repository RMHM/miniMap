<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MHM TIMELINE</title>
<link href="/resources/css/disqusin.css" rel="stylesheet" />
</head>
<body>

	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div id="timelineHeader">
			<div class="container">
				<div class="col-md-1"></div>
				<div class="col-md-8">
					<h3>실시간 타임라인</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<div class="container">
			<div class='form-group'>
			<div class="membernick" style="display:none">${member.mnick}</div>
				<div id="div_chat">
					<ul class="disqusin">
						<c:forEach var="i" items="${list}">
							<c:choose>
								<c:when test="${i.getMNick() eq member.mnick}">
									<li>
										<div class="lastTID" style="display:none">${i.getTId()}</div>
										<div class="comment-main-level">
											<div class="comment-avatar">
												<img src="/resources/img/profiles/${i.profile_path}" alt="">
											</div>
											<div class="comment-box-me">
												<div class="comment-head-me">
													<span class="comment-name ">
														<a href="#">${i.getMNick()}</a>&nbsp;(나)
													</span>
													<span> ${i.getTDate()} </span>
													<a href="#" onclick="sendNote($(this).siblings('.comment-name').children('a').text());">
														<img class="jjokjee" src="/resources/img/timeline/jjokjee.png"/>
													</a>
													<a href="#" onclick="report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));">
														<img class="singo" src="/resources/img/timeline/singo.png"/>
													</a>
												</div>
												<div class="comment-content">
													<pre>${i.getTContent()}</pre>
												</div>
												<div class="comment-bottom-me">
													<i class="fa fa-link"></i>
													<a href="https://www.google.com/search?q=${i.hashTag}" target="_BLANK"> ${i.hashTag} </a>
												</div>
											</div>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<div class="lastTID" style="display:none">${i.getTId()}</div>
										<div class="comment-main-level">
											<div class="comment-avatar">
												<img src="/resources/img/profiles/${i.profile_path}" alt="">
											</div>
											<div class="comment-box">
												<div class="comment-head">
													<span class="comment-name ">
														<a href="#">${i.getMNick()}</a>
													</span>
													<span> ${i.getTDate()} </span>
													<a href="#" onclick="sendNote($(this).siblings('.comment-name').children('a').text());">
														<img class="jjokjee" src="/resources/img/timeline/jjokjee.png"/>
													</a>
													<a href="#" onclick="report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));">
														<img class="singo" src="/resources/img/timeline/singo.png"/>
													</a>
												</div>
												<div class="comment-content">
													<pre>${i.getTContent()}</pre>
												</div>
												<div class="comment-bottom">
													<i class="fa fa-link"></i>
													<a href="https://www.google.com/search?q=${i.hashTag}" target="_BLANK"> ${i.hashTag} </a>
												</div>
											</div>
										</div>
									</li>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</ul>
				<div class="container" id="menu_scroll_down">
					<div class="col-lg-12">
						<button id="btn_scroll_down" disabled="true">↓</button>
					</div>
				</div>
				</div>

				<div id="dialogue">
					<textarea rows="6" cols="150" name='message' id='message' 
						placeholder="어떤 경험을 하고 계신가요?&#13;&#10;어디에 방문하셨나요?&#13;&#10;음식은 맛있게 드셨나요?&#13;&#10;자유롭게 정보를 공유해주세요!"></textarea>
					<textarea rows="1" cols="150" name="tag" id="tag" 
						placeholder="어디에 계신가요?"></textarea>
					<div class="remaining">
						<span class="count">250</span>
					</div>
					<div class="remaining2">
						<span class="count2">50</span>
					</div>
					<div class="btnAlign">
						<button class='btn btn-primary' id='sendBtn'>타임라인 게시</button>
					</div>
					
				</div>
			</div>

		</div>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

<script src="/resources/js/timeline/echo.js"></script>

</body>

</html>