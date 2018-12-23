<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MHM TIMELINE</title>
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/disqusin.css" rel="stylesheet" />
</head>
<body>

	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="container">
			<div class='form-group'>

				<div id="div_chat">
					<ul class="disqusin">
						<c:forEach var="i" items="${list}">
							<c:choose>
								<c:when test="${i.mNick eq member.mnick}">
									<li>
										<div class="comment-main-level">
											<div class="comment-avatar">
												<img src="/resources/img/profiles/${i.profile_path}" alt="">
											</div>
											<div class="comment-box-me">
												<div class="comment-head-me">
													<span class="comment-name ">
														<a href="" target="_BLANK">${i.mNick}&nbsp;(나)</a>
													</span>
													<span> ${i.tDate} </span>
													<i class="fa fa-thumbs-down">0</i>
													<i class="fa fa-thumbs-up">0</i>
												</div>
												<div class="comment-content">
													<pre>${i.tContent}</pre>
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
										<div class="comment-main-level">
											<div class="comment-avatar">
												<img src="/resources/img/profiles/${i.profile_path}" alt="">
											</div>
											<div class="comment-box">
												<div class="comment-head">
													<span class="comment-name ">
														<a href="" target="_BLANK">${i.mNick}</a>
													</span>
													<span> ${i.tDate} </span>
													<i class="fa fa-thumbs-down">0</i>
													<i class="fa fa-thumbs-up">0</i>
												</div>
												<div class="comment-content">
													<pre>${i.tContent}</pre>
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
						<!-- <li>
				<div class="comment-main-level">
					<div class="comment-avatar">
						<img
							src="/resources/img/profiles/default.png"
							alt="">
					</div>
					<div class="comment-box">
						<div class="comment-head">
							<span class="comment-name ">
								<a href="" target="_BLANK">김이박</a>
							</span>
							<span>
								11분 전
							</span>
							<i class="fa fa-thumbs-down">0</i>
							<i class="fa fa-thumbs-up">0</i>
						</div>
						<div class="comment-content">
							<pre>집에가고싶다</pre>
						</div>
						<div class="comment-bottom">
							<i class="fa fa-link"></i>
							<a href="">
								고기국수 먹는중
							</a>
						</div>
					</div>
				</div>
			</li> -->
					</ul>

					<!-- <div id="menu_hide"></div> -->


					<!-- <div class='panel panel-default'>
				<div id='chatdata' class='panel-body'></div>
			</div> -->
				</div>

				<!-- 메세지 작성부분 -->
				<textarea rows="6" cols="150" name='message' id='message'></textarea>
				<textarea rows="1" cols="150" name="tag" id="tag"></textarea>
				<div class="remaining">
					<span class="count">250</span>
				</div>
				<div class="remaining2">
					<span class="count2">50</span>
				</div>
				<button class='btn btn-primary' id='sendBtn'>전송</button>
				<button class='btn btn-primary' id='exitBtn'>나가기</button>
				<!-- 대화내용이 출력되는 부분 -->


			</div>

		</div>
		<div id="menu_scroll_down">
			<button id="btn_scroll_down" disabled="true">↓</button>
		</div>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>

	<script>
		$(document).ready(function() {
			$('#div_chat').animate({
				scrollTop : $('#div_chat')[0].scrollHeight + 700
			}, 100);
		});

		// 내용부분 글자제한
		$(function() {
			$('.remaining').each(function() {
				// count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
				var $count = $('.count', this);
				var $input = $(this).prev().prev();
				// .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
				var maximumCount = $count.text() * 1;
				// update 함수는 keyup, paste, input 이벤트에서 호출한다.
				var update = function() {
					var before = $count.text() * 1;
					var now = maximumCount - $input.val().length;
					// 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
					if (now < 0) {
						var str = $input.val();
						alert('글자 입력수를 초과하였습니다.');
						$input.val(str.substr(0, maximumCount));
						now = 0;
					}
					// 필요한 경우 DOM을 수정한다.
					if (before != now) {
						$count.text(now);
					}
				};
				// input, keyup, paste 이벤트와 update 함수를 바인드한다
				$input.bind('input keyup paste', function() {
					setTimeout(update, 0)
				});
				update();
			});
		});

		// 태그부분 글자제한
		$(function() {
			$('.remaining2').each(function() {
				// count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
				var $count = $('.count2', this);
				var $input = $(this).prev().prev();
				// .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
				var maximumCount = $count.text() * 1;
				// update 함수는 keyup, paste, input 이벤트에서 호출한다.
				var update = function() {
					var before = $count.text() * 1;
					var now = maximumCount - $input.val().length;
					// 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
					if (now < 0) {
						var str = $input.val();
						alert('글자 입력수를 초과하였습니다.');
						$input.val(str.substr(0, maximumCount));
						now = 0;
					}
					// 필요한 경우 DOM을 수정한다.
					if (before != now) {
						$count.text(now);
					}
				};
				// input, keyup, paste 이벤트와 update 함수를 바인드한다
				$input.bind('input keyup paste', function() {
					setTimeout(update, 0)
				});
				update();
			});
		});

		var isScrollUp = false;
		var lastScrollTop;
		var unreadCnt = 0;

		/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
		var sock = new SockJS("<c:url value='/echo'/>");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		var today = null;
		$(function() {
			$("#sendBtn").click(function() {
				if ($('#message').val() == '' || $('#message').val() == null) {
					alert('타임라인에 등록할 메세지를 입력해주세요');

				} else {
					if ($("#tag").val() == '' || $('#tag').val() == null) {
						$('#tag').val('제주도');
					}

					console.log("send message.....");
					/* 채팅창에 작성한 메세지 전송 */
					sendMessage();
					/* 전송 후 작성창 초기화 */
					$("#message").val('');
					$('#tag').val('');
					$('.count').text('250');
					$('.count2').text('50');

					/* // 라인 추가
					$('#table_chat').append(
					  $('<tr>').append(
					    $('<td>').append($('#add_name').val()),
					    $('<td>').append($('#add_msg').val())
					  )
					); */

					if (isScrollUp) {
						// 메뉴가 보이는 상태에서 새로운 라인 추가 시 안 읽은 수 표시
						unreadCnt++;
						$('#btn_scroll_down').html('↓ ' + unreadCnt);
					}

					// 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
					if (!isScrollUp) {
						$('#div_chat').animate({
							scrollTop : $('#div_chat')[0].scrollHeight + 700
						}, 100);
					}
				}

			});
			$("#exitBtn").click(function() {
				console.log("exit message.....");
				/* 채팅창에 작성한 메세지 전송 */
				sock.onclose();
			});
		});
		function sendMessage() {
			/* 맵핑된 핸들러 객채의 handleTextMessage메소드가 실행 */
			sock.send($("#message").val() + "|%%|&" + $("#tag").val());
		};
		function onMessage(evt) {
			var data = evt.data;//new text객체로 보내준 값을 받아옴.
			var host = null;//메세지를 보낸 사용자 ip저장
			var strArray = data.split("|%%|&");//데이터 파싱처리하기
			var userName = null;//대화명 저장
			var profPath = null; //프로필 이미지

			//전송된 데이터 출력해보기
			for (var i = 0; i < strArray.length; i++) {
				console.log('str[' + i + '] :' + strArray[i]);
			}
			if (strArray.length > 1) {
				sessionId = strArray[0];
				message = strArray[1];
				host = strArray[2].substr(1, strArray[2].indexOf(":") - 1);
				userName = strArray[3];
				profPath = strArray[4];
				hashTag = strArray[5];
				today = new Date();
				printDate = today.getFullYear() + "/" + today.getMonth() + "/"
						+ today.getDate() + " " + today.getHours() + ":"
						+ today.getMinutes() + ":" + today.getSeconds();

				console.log(today);
				var ck_host = '${host}';

				/* var startMsec = today.getMilliseconds();
				var now=new Date();
				var elapsedTime = (now.getMilliseconds() - startMsec) / 1000;  */

				console.log(sessionId);
				console.log(message);
				console.log('host : ' + host);
				console.log('ck_host : ' + ck_host);
				console.log(profPath);
				console.log(hashTag);
				var urlProf = "/resources/img/profiles/";
				/* 서버에서 데이터를 전송할경우 분기 처리 */
				console.log('prof::' + urlProf + profPath);
				if (host == ck_host || (host == 0 && ck_host.includes('0:0:'))
						|| (host == 0 && ck_host.includes('127.0.0.1'))) {
					var printHTML = "<li><div class='comment-main-level'><div class='comment-avatar'>";
					printHTML += "<img src='"+urlProf+profPath+"' alt=''></div>";
					printHTML += "<div class='comment-box-me'><div class='comment-head-me'><span class='comment-name '>";
					printHTML += "<a href='' target='_BLANK'>" + userName
							+ "&nbsp;(나)" + "</a></span><span>" + printDate
							+ "</span>";
					printHTML += "<i class='fa fa-thumbs-down'>0</i><i class='fa fa-thumbs-up'>0</i>";
					printHTML += "</div><div class='comment-content'><pre>"
							+ message + "</pre></div>";
					printHTML += "<div class='comment-bottom-me'><i class='fa fa-link'></i>";
					printHTML += "<a href='https://www.google.com/search?q="
							+ hashTag + "' target='_BLANK'>" + hashTag + "</a>";
					printHTML += "</div></div></div></li>";
					$('.disqusin').append(printHTML);
				} else {
					var printHTML = "<li><div class='comment-main-level'><div class='comment-avatar'>";
					printHTML += "<img src='"+urlProf+profPath+"' alt=''></div>";
					printHTML += "<div class='comment-box'><div class='comment-head'><span class='comment-name '>";
					printHTML += "<a href='' target='_BLANK'>" + userName
							+ "</a></span><span>" + printDate + "</span>";
					printHTML += "<i class='fa fa-thumbs-down'>0</i><i class='fa fa-thumbs-up'>0</i>";
					printHTML += "</div><div class='comment-content'><pre>"
							+ message + "</pre></div>";
					printHTML += "<div class='comment-bottom'><i class='fa fa-link'></i>";
					printHTML += "<a href='https://www.google.com/search?q="
							+ hashTag + "' target='_BLANK'>" + hashTag + "</a>";
					printHTML += "</div></div></div></li>";
					$('.disqusin').append(printHTML);

				}
				//console.log('chatting data : '+data);
			} else {
				/* today = new Date();
				printDate = today.getFullYear() + "/" + today.getMonth() + "/"
						+ today.getDate() + " " + today.getHours() + ":"
						+ today.getMinutes() + ":" + today.getSeconds();
				message = strArray[0];
				var printHTML = "<div class='well'  style='margin-left30%:'>";
				printHTML += "<div class='alert alert-danger'>";
				printHTML += "<sub>" + printDate + "</sub><br/>";
				printHTML += "<strong>[서버관리자] : " + message + "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				$('#chatdata').append(printHTML);
				 */
			}
		};

		function onClose(evt) {
			location.href = '${pageContext.request.contextPath};';
		};

		/* 추가 버튼 클릭 시 */
		/* $('#sendBtn').on("click", function() {
		  /* // 라인 추가
		  $('#table_chat').append(
		    $('<tr>').append(
		      $('<td>').append($('#add_name').val()),
		      $('<td>').append($('#add_msg').val())
		    )
		  ); */

		/*if (isScrollUp) {
			// 메뉴가 보이는 상태에서 새로운 라인 추가 시 안 읽은 수 표시
		  unreadCnt++;
		  $('#btn_scroll_down').html('↓ ' + unreadCnt);
		}

		// 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
		if (!isScrollUp) {
		  $('#div_chat').animate({
		    scrollTop: divChat.scrollHeight - divChat.clientHeight
		  }, 100);
		} 
		}); */

		/* 메뉴 스크롤 ↓ 버튼 클릭 시 */
		$('#btn_scroll_down').on('click', function() {
			// 마지막으로 보고 있었던 (스크롤을 올리기 시작했던) 위치로 이동
			$('#div_chat').animate({
				scrollTop : $('#div_chat')[0].scrollHeight + 700
			}, 100);

			if (lastScrollTop >= $('#div_chat')[0].scrollHeight) {
				// 마지막 위치와 스크롤 최하단이 같다면 (새로 추가된 라인이 없다면) 메뉴 숨김
				$("#menu_scroll_down").css("opacity", "0.0");
				$("#btn_scroll_down").css("opacity", "0.0");
				$("#btn_scroll_down").attr("disabled", true);
				isScrollUp = false;
				unreadCnt = 0;
				$('#btn_scroll_down').html('↓');
			} else {
				// 마지막 위치와 스크롤 최하단이 다르다면 (새로 추가된 라인이 있다면) 마지막 위치를 최하단으로 변경
				lastScrollTop = $('#div_chat')[0].scrollHeight + 700;
			}
		})

		/* 스크롤 이벤트 */
		$("#div_chat").on('mousewheel DOMMouseScroll', function(e) {
			var E = e.originalEvent, delta = E.wheelDelta || -E.detail;

			// 메뉴를 숨겼을 때만 마지막 위치 저장
			if (!isScrollUp) {
				lastScrollTop = $('#div_chat')[0].scrollHeight + 700;
			}

			// 스크롤이 생겼을 때
			if ($(this).scrollTop() > 0) {
				if (delta < 0) {
					// 스크롤 내리는 이벤트 중 최하단 도달 시 메뉴 숨김 (-1은 오차 제어)
					if ($(this).scrollTop() >= 0) {
						$("#menu_scroll_down").css("opacity", "0.0");
						$("#btn_scroll_down").css("opacity", "0.0");
						$("#btn_scroll_down").attr("disabled", true);
						isScrollUp = false;
						unreadCnt = 0;
						$('#btn_scroll_down').html('↓');
					}
				} else {
					// 스크롤 올리는 이벤트 발생 시 메뉴 보임
					$("#menu_scroll_down").css("opacity", "1.0");
					$("#btn_scroll_down").css("opacity", "1.0");
					$("#btn_scroll_down").attr("disabled", false);
					isScrollUp = true;
				}
			}
		});
	</script>



</body>

</html>