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
				<div class="col-md-1">
					<select class="tTypeUp" id="tTypeUp" size="1">
           				<option value="entire"> 전체 </option>
             			<option value="S"> 교통 </option>
              			<option value="W"> 날씨 </option>
              			<option value="F"> 먹거리 </option>
              			<option value="T"> 볼거리 </option>
              			<option value="E"> 기타 </option>
           			</select>
				</div>
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

				<div id="dialogue">
					<select class="tTypeDown" id="tTypeDown" size="1">
           				<option value="N"> 분류 선택 </option>
             			<option value="S"> 교통 </option>
              			<option value="W"> 날씨 </option>
              			<option value="F"> 먹거리 </option>
              			<option value="T"> 볼거리 </option>
              			<option value="E"> 기타 </option>
           			</select>
					
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

						<div class="hidBtn">
              
							<input type="text" class='textQ' placeholder="태그로 검색"/>
							<button class='searchBtn' id='searchBtn' onclick='searchTag();'>검 색</button>

						</div>
						<button class='btn btn-primary' id='sendBtn'>타임라인 게시</button>
					</div>

				</div>
			</div>

		</div><br>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<script src="/resources/js/timeline/echo.js"></script>
	<script>
	

	var sock = new SockJS("/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	var today = null;

	sock.onopen = function() {
		console.log("tsock open");
		$('#div_chat').animate({
			scrollTop : $('#div_chat').prop('scrollHeight') + 1
		}, 500);
	}

	$(function() {
		$("#sendBtn").click(function() {
			if($('#tTypeDown').val()=='N'){
				alert('타임라인 분류를 선택해주세요');
			}else if ($('#message').val() == '' || $('#message').val() == null) {
				alert('타임라인에 등록할 메세지를 입력해주세요');

			} else {
				if ($("#tag").val() == '' || $('#tag').val() == null) {
					$('#tag').val('제주도');
				}
				if (confirm("정말 게시하시겠습니까?") == false) {
					return false;
				} else {
					console.log("send message.....");
					sendMessage();
					$("#message").val('');
					$('#tag').val('');
					$('.count').text('250');
					$('.count2').text('50');

					if (isScrollUp) {
						unreadCnt++;
						$('#btn_scroll_down').html('↓ ' + unreadCnt);
					}

					if (!isScrollUp) {
						$('#div_chat').animate({
							scrollTop : $('#div_chat').prop('scrollHeight') + 1
						}, 500);
					}
				}

			}

		});
	});
	function sendMessage() {
		if (sock.readyState === 1) {
			$('#sendBtn').prop('disabled',true);
			sock.send($("#message").val() + "|%%|&" + $("#tag").val() + "|%%|&" + $('#tTypeDown').val());
		} else {
			console.log("메세지 전송 실패(일시적 문제)");
		}

	};
	function onMessage(evt) {
		var data = evt.data;
		var host = null;
		var strArray = data.split("|%%|&");
		var userName = null;
		var profPath = null;
		var hashTag = null;
		var tId = null;

		if (strArray.length > 1) {
			sessionId = strArray[0];
			message = strArray[1];
			host = strArray[2].substr(1, strArray[2].indexOf(":") - 1);
			userName = strArray[3];
			profPath = strArray[4];
			hashTag = strArray[5];
			tId = strArray[6];
			tSort=strArray[7];
			today = new Date();
			printDate = today.getFullYear() + "/" + today.getMonth() + "/"
					+ today.getDate() + " " + today.getHours() + ":"
					+ today.getMinutes() + ":" + today.getSeconds();

			var ck_host = '${host}';

			var urlProf = "/resources/img/profiles/";
			if (host == ck_host || (host == 0 && ck_host.includes('0:0:'))
					|| (host == 0 && ck_host.includes('127.0.0.1'))) {
				var printHTML = "<li><div class='lastTID' style='display:none'>"
						+ tId
						+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
				printHTML += "<img src='" + urlProf + profPath + "' alt=''></div>";
				printHTML += "<div class='comment-box-me'><div class='comment-head-me'><span class='comment-name '>";
				printHTML += "<a href='#'>" + userName + "&nbsp;(나)"
						+ "</a></span><span>" + printDate + "</span>";
				printHTML += "<a href='#' class='jjokjeeTag'>"
						+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
						+ "</a><a href='#' class='singoTag'>"
						+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
				printHTML += "</div><div class='comment-type'><span>[<strong>"+tSort+"</strong>]</span>"
						+ "</div><div class='comment-content'><pre>" + message
						+ "</pre></div>";
				printHTML += "<div class='comment-bottom-me'><i class='fa fa-link'></i>";
				printHTML += "<a href='https://www.google.com/search?q=" + hashTag
						+ "' target='_BLANK'>" + hashTag + "</a>";
				printHTML += "</div></div></div></li>";
				$('.disqusin').append(printHTML);
				
				if($('#div_chat').scrollTop()>=$('#div_chat').prop('scrollHeight')){
					$('#div_chat').animate({
						scrollTop : $('#div_chat').prop('scrollHeight') + 1
					}, 500);
				}else{
					unreadCnt++;
					$('#btn_scroll_down').html('↓ ' + unreadCnt);
				}
			} else {
				var printHTML = "<li><div class='lastTID' style='display:none'>"
						+ tId
						+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
				printHTML += "<img src='" + urlProf + profPath + "' alt=''></div>";
				printHTML += "<div class='comment-box'><div class='comment-head'><span class='comment-name '>";
				printHTML += "<a href='#'>" + userName + "</a></span><span>"
						+ printDate + "</span>";
				printHTML += "<a href='#' class='jjokjeeTag'>"
						+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
						+ "</a><a href='#' class='singoTag'>"
						+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
				printHTML += "</div><div class='comment-type'><span>[<strong>"+tSort+"</strong>]</span>"
						+ "</div><div class='comment-content'><pre>" + message
						+ "</pre></div>";
				printHTML += "<div class='comment-bottom'><i class='fa fa-link'></i>";
				printHTML += "<a href='https://www.google.com/search?q=" + hashTag
						+ "' target='_BLANK'>" + hashTag + "</a>";
				printHTML += "</div></div></div></li>";
				$('.disqusin').append(printHTML);
				
				if($('#div_chat').scrollTop()>=$('#div_chat').prop('scrollHeight')){
					$('#div_chat').animate({
						scrollTop : $('#div_chat').prop('scrollHeight') + 1
					}, 500);
				}else{
					unreadCnt++;
					$('#btn_scroll_down').html('↓ ' + unreadCnt);
				}

			}
			
			$(document).off('click','.jjokjeeTag');
			$(document).off('click','.singoTag');

			$(document).on('click','.jjokjeeTag',function(){
				sendNote($(this).siblings('.comment-name').children('a').text());
			});
			
			$(document).on('click','.singoTag',function(){
				report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));
			});
		} 
		
		
		setTimeout(function() {
			$('#sendBtn').prop('disabled',false);
		}, 10000);
	};

	function onClose(evt) {

	}

	
	/* $(document).ready(function(){
		$('.hidBtn').hide();
	});
	
	var shown=false;
	$('.toggleBtn').click(function(){
		if(shown===true){
			console.log("hide");
			$('.hidBtn').hide();
			shown=false;
		}else if(shown===false){
			console.log("show");
			$('.hidBtn').show();
			shown=true;
		}
	}); */
	
	function searchTag(){
		var text=$('.textQ').val();
		window.location.href="/timeline.search?"+text
	}
	
	$('.tTypeUp').change(function(){
		var tType=$(this).val();
		var list=findSort(tType);
		var nick="${member.mnick}";
		
		console.log(list);
		
		$('#div_chat').unbind();
		
		$('.disqusin').empty();
		for (var i = 0; i < list.length; i++){
			if (nick == (list[i].mnick)) {
				var printHTML = "<li><div class='lastTID' style='display:none'>"
						+ list[i].tid
						+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
				printHTML += "<img src='/resources/img/profiles/"
						+ list[i].profile_path
						+ "' alt=''></div>";
				printHTML += "<div class='comment-box-me'><div class='comment-head-me'><span class='comment-name '>";
				printHTML += "<a href='#'>" + list[i].mnick
						+ "</a>" + "&nbsp;(나)" + "</span><span>"
						+ list[i].tdate + "</span>";
				printHTML += "<a href='#' class='jjokjeeTag'>"
						+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
						+ "</a><a href='#' class='singoTag'>"
						+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
				printHTML += "</div><div class='comment-type'><span>[<strong>"+list[i].tsort+"</strong>]</span>"
						+ "</div><div class='comment-content'><pre>"
						+ list[i].tcontent + "</pre></div>";
				printHTML += "<div class='comment-bottom-me'><i class='fa fa-link'></i>";
				printHTML += "<a href='https://www.google.com/search?q="
						+ list[i].hashTag
						+ "' target='_BLANK'>"
						+ list[i].hashTag + "</a>";
				printHTML += "</div></div></div></li>";
				
				$('.disqusin').prepend(printHTML);
				
			} else {
				var printHTML = "<li><div class='lastTID' style='display:none'>"
						+ list[i].tid
						+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
				printHTML += "<img src='/resources/img/profiles/"
						+ list[i].profile_path
						+ "' alt=''></div>";
				printHTML += "<div class='comment-box'><div class='comment-head'><span class='comment-name '>";
				printHTML += "<a href='#'>" + list[i].mnick
						+ "</a></span><span>" + list[i].tdate
						+ "</span>";
				printHTML += "<a href='#' class='jjokjee'>"
						+ "<img class='jjokjeeImg' src='/resources/img/timeline/jjokjee.png'/>"
						+ "</a><a href='#' class='singo'>"
						+ "<img class='singoImg' src='/resources/img/timeline/singo.png'/></a>";
				printHTML += "</div><div class='comment-type'><span>[<strong>"+list[i].tsort+"</strong>]</span>"
						+ "</div><div class='comment-content'><pre>"
						+ list[i].tcontent + "</pre></div>";
				printHTML += "<div class='comment-bottom'><i class='fa fa-link'></i>";
				printHTML += "<a href='https://www.google.com/search?q="
						+ list[i].hashTag
						+ "' target='_BLANK'>"
						+ list[i].hashTag + "</a>";
				printHTML += "</div></div></div></li>";
				
				$('.disqusin').prepend(printHTML);
			}
		}
		
		$('#div_chat').animate({
			scrollTop : $('#div_chat').prop('scrollHeight') + 1
		}, 500);
		
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

					if ($(this).scrollTop() == 0) {
						var lt = $('.lastTID').eq(0).text() * 1;
						var tp=$('.tTypeUp').val();
						var list = loadMoreT(lt,tp);
						var oldScrollHeight = $('#div_chat').prop(
								'scrollHeight');

						for (var i = 0; i < list.length; i++) {
							if ($(".membernick").text() == (list[i].mnick)) {
								var printHTML = "<li><div class='lastTID' style='display:none'>"
										+ list[i].tid
										+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
								printHTML += "<img src='/resources/img/profiles/"
										+ list[i].profile_path
										+ "' alt=''></div>";
								printHTML += "<div class='comment-box-me'><div class='comment-head-me'><span class='comment-name '>";
								printHTML += "<a href='#'>" + list[i].mnick
										+ "</a>" + "&nbsp;(나)" + "</span><span>"
										+ list[i].tdate + "</span>";
								printHTML += "<a href='#' class='jjokjeeTag'>"
										+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
										+ "</a><a href='#' class='singoTag'>"
										+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
								printHTML += "</div><div class='comment-type'><span>[<strong>"+list[i].tsort+"</strong>]</span>"
										+ "</div><div class='comment-content'><pre>"
										+ list[i].tcontent + "</pre></div>";
								printHTML += "<div class='comment-bottom-me'><i class='fa fa-link'></i>";
								printHTML += "<a href='https://www.google.com/search?q="
										+ list[i].hashTag
										+ "' target='_BLANK'>"
										+ list[i].hashTag + "</a>";
								printHTML += "</div></div></div></li>";
								$('.disqusin').prepend(printHTML);
							} else {
								var printHTML = "<li><div class='lastTID' style='display:none'>"
										+ list[i].tid
										+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
								printHTML += "<img src='/resources/img/profiles/"
										+ list[i].profile_path
										+ "' alt=''></div>";
								printHTML += "<div class='comment-box'><div class='comment-head'><span class='comment-name '>";
								printHTML += "<a href='#'>" + list[i].mnick
										+ "</a></span><span>" + list[i].tdate
										+ "</span>";
								printHTML += "<a href='#' class='jjokjee'>"
										+ "<img class='jjokjeeImg' src='/resources/img/timeline/jjokjee.png'/>"
										+ "</a><a href='#' class='singo'>"
										+ "<img class='singoImg' src='/resources/img/timeline/singo.png'/></a>";
								printHTML += "</div><div class='comment-type'><span>[<strong>"+list[i].tsort+"</strong>]</span>"
										+ "</div><div class='comment-content'><pre>"
										+ list[i].tcontent + "</pre></div>";
								printHTML += "<div class='comment-bottom'><i class='fa fa-link'></i>";
								printHTML += "<a href='https://www.google.com/search?q="
										+ list[i].hashTag
										+ "' target='_BLANK'>"
										+ list[i].hashTag + "</a>";
								printHTML += "</div></div></div></li>";
								$('.disqusin').prepend(printHTML);

							}
						}

						var newScrollHeight = $('#div_chat').prop(
								'scrollHeight');

						$(this).scrollTop(newScrollHeight - oldScrollHeight);
						
						$(document).off('click','.jjokjeeTag');
						$(document).off('click','.singoTag');

						$(document).on('click','.jjokjeeTag',function(){
							sendNote($(this).siblings('.comment-name').children('a').text());
						});
						
						$(document).on('click','.singoTag',function(){
							report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));
						});
					}

				});
		
	});
	
	function findSort(tType){
		var list = "";
		$.ajax({
			url : '/timeline.classify',
			type : 'post',
			async : false,
			data : {
				'tType' : tType
			},
			success : function(data) {
				list = data;
			},
			error : function(err) {
				console.log("search-error");
			}
		});
		return list;
	}
	
	function loadMoreT(lt,tp){
		var list = "";
		$.ajax({
			url : '/load.classify',
			type : 'post',
			async : false,
			data : {
				'tId' : lt,
				'tType':tp
			},
			success : function(data) {
				list = data;
			},
			error : function(err) {
				console.log("load-more-error");
			}
		});
		return list;
	}
	
	</script>
	
</body>

</html>