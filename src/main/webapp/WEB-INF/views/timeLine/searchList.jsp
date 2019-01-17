<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MHM TIMELINE</title>
<link href="/resources/css/disqusin.css" rel="stylesheet" />
<style>
	#div_chat{
		height:100% !important;
	}
	#sendBtn{
		position:relative;
		margin-left:1070px;
	}
	.void{
		height:50px;
	}
	</style>
</head>
<body>

	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div id="timelineHeader">
			<div class="container">
				<div class="col-md-1"></div>
				<div class="col-md-8">
					<h3>타임라인 검색결과</h3>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<div class="container">
			<div class='form-group'>
				<div class="membernick" style="display: none">${member.mnick}</div>
				<div id="div_chat">
					<ul class="disqusin">
						<c:forEach var="i" items="${list}">
							<c:choose>
								<c:when test="${i.getMNick() eq member.mnick}">
									<li>
										<div class="lastTID" style="display: none">${i.getTId()}</div>
										<div class="comment-main-level">
											<div class="comment-avatar">
												<img src="/resources/img/profiles/${i.profile_path}" alt="">
											</div>
											<div class="comment-box-me">
												<div class="comment-head-me">
													<span class="comment-name "> <a href="#">${i.getMNick()}</a>&nbsp;(나)
													</span> <span> ${i.getTDate()} </span> <a href="#"
														onclick="sendNote($(this).siblings('.comment-name').children('a').text());">
														<img class="jjokjee"
														src="/resources/img/timeline/jjokjee.png" />
													</a> <a href="#"
														onclick="report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));">
														<img class="singo" src="/resources/img/timeline/singo.png" />
													</a>
												</div>
												<div class="comment-type">
														<span>[<strong>${i.getTSort()}</strong>]</span>
												</div>
												<div class="comment-content">
													<pre>${i.getTContent()}</pre>
												</div>
												<div class="comment-bottom-me">
													<i class="fa fa-link"></i> <a
														href="https://www.google.com/search?q=${i.hashTag}"
														target="_BLANK"> ${i.hashTag} </a>
												</div>
											</div>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<div class="lastTID" style="display: none">${i.getTId()}</div>
										<div class="comment-main-level">
											<div class="comment-avatar">
												<img src="/resources/img/profiles/${i.profile_path}" alt="">
											</div>
											<div class="comment-box">
												<div class="comment-head">
													<span class="comment-name "> <a href="#">${i.getMNick()}</a>
													</span> <span> ${i.getTDate()} </span> <a href="#"
														onclick="sendNote($(this).siblings('.comment-name').children('a').text());">
														<img class="jjokjee"
														src="/resources/img/timeline/jjokjee.png" />
													</a> <a href="#"
														onclick="report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));">
														<img class="singo" src="/resources/img/timeline/singo.png" />
													</a>
												</div>
												<div class="comment-type">
														<span>[<strong>${i.getTSort()}</strong>]</span>
												</div>
												<div class="comment-content">
													<pre>${i.getTContent()}</pre>
												</div>
												<div class="comment-bottom">
													<i class="fa fa-link"></i> <a
														href="https://www.google.com/search?q=${i.hashTag}"
														target="_BLANK"> ${i.hashTag} </a>
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

				
			</div>
			<button class='btn btn-primary' id='sendBtn' onclick="window.location.href='/echo.do'">돌아가기</button>
		</div>
		<div class="void"></div>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<script>
	

	var isScrollUp = false;
	var unreadCnt = 0;
	
	$('#div_chat').animate({
		scrollTop : $('#div_chat').prop('scrollHeight') + 1
	}, 500);

	$('#btn_scroll_down').on('click', function() {
		$('#div_chat').animate({
			scrollTop : $('#div_chat').prop('scrollHeight') + 1
		}, 500);

		$('#btn_scroll_down').html('↓');
		$("#menu_scroll_down").css("opacity", "0.0");
		$("#btn_scroll_down").css("opacity", "0.0");
		$("#btn_scroll_down").attr("disabled", true);
		isScrollUp = false;
		unreadCnt = 0;

	});

	$("#div_chat")
			.bind(
					'scroll touchmove mousewheel',
					function(e) {

						var delta = e.originalEvent.wheelDelta;
						

						if (delta > 0 && delta != undefined) {
							$("#menu_scroll_down").css("opacity", "1.0");
							$("#btn_scroll_down").css("opacity", "1.0");
							$("#btn_scroll_down").attr("disabled", false);
							isScrollUp = true;
						} else if (delta < 0 && delta != undefined) {
							var scrollHeight = $(this).height();
							var scrollPosition = $(this).height()
									+ $(this).scrollTop();

							if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
								$('#btn_scroll_down').html('↓');
								$("#menu_scroll_down").css("opacity", "0.0");
								$("#btn_scroll_down").css("opacity", "0.0");
								$("#btn_scroll_down").attr("disabled", true);
								isScrollUp = false;
								unreadCnt = 0;
							} else {
								$("#menu_scroll_down").css("opacity", "0.0");
								$("#btn_scroll_down").css("opacity", "0.0");
								$("#btn_scroll_down").attr("disabled", true);
								isScrollUp = false;
							}

						}


					});


	function sendNote(nick) {
		var popUrl = "/popUp.write?" + nick;

		var popOption = "width=765, height=485, resizable=no, scrollbars=no, status=no;"; 

		window.open(popUrl, "", popOption);
	}

	function report(tid,mnick) {
		if (confirm("차단한 타임라인은 자신에게 다시는 보이지 않습니다. 그래도 차단하시겠습니까?") == false) {
			return false;
		} else{
			var myNick=$(".membernick").text();
			var tId=tid;
			var mNick=mnick;
			if(mNick=='사이트관리자'){
				alert("사이트관리자는 차단할 수 없습니다.");
				return false;
			}else if(mNick==myNick){
				alert("자기 자신의 글은 차단할 수 없습니다.");
				return false;
			}else{
				$.ajax({
					url : '/block.timeline',
					type : 'post',
					traditional:true,
					async : false,
					data : {
						'tId' : tId,
						'mNick':mNick
					},
					success : function(data) {
						if(data>0){
							alert("게시글을 차단했습니다.");
							window.location.href ="/echo.do";
						}
					},
					error : function(err) {
						console.log("일시적인 문제가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}
				});
			}
			
		}
	}

	</script>
	<script>
	$(document).ready(function(){
		$('.hidBtn').hide();
	});
	
	var shown=false;
	$('.toggleBtn').click(function(){
		if(shown===true){
			$('.hidBtn').slide({
				$('.hidBtn').hide();
			},500);
			shown=false;
		}else if(shown===false){
			$('.hidBtn').slide({
				$('.hidBtn').show();
			},500);
			shown=true;
		}
	});
	
	$('.searchBtn').click(function(){
		var text=$('.textQ').val();
		$.ajax({
			url : '/timeline.search',
		    type : 'get',
		    traditional:true,
		    data : {
		    	'text':text
		    },
		    success : function(data) {
		    	alert('쪽지를 성공적으로 삭제했습니다!');
		    	window.location.href ="/popUp.inbox";
		    },
		    error : function() {
		    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
		   	}
		});
	});
	</script>
	
</body>

</html>