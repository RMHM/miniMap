<%@
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header>
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
			
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
				<a class="navbar-brand" href="/">
				<img src="/resources/img/mhm_logo.png" style="width:120px;" alt="" /></a>			
			</div>
			<div class="navbar-collapse collapse" style="max-height:500px">
				<input type="hidden" id="hdnSession" data-value="${member.mno}" />
				<ul class="nav navbar-nav" style="width:auto; position: relative;"  >
					<li class="active"><a href="/">Home</a></li>
					<li class=""><a href="/synopsis">개요</a></li>
					<li><a href="/echo.do">타임라인</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">지도 <b class=" icon-angle-down"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/test/testMap.do">제주도 지도</a></li>
							<li><a href="/test/NewFile.do">지도테스트</a></li>
						</ul></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">게시판 <b class=" icon-angle-down"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/board/boardlist1.do">자유게시판</a></li>
							<li><a href="/board/boardlist2.do">정보공유 게시판</a></li>
							<li><a href="/board/boardlist3.do">여행후기게시판</a></li>
							<li><a href="/board/boardlist4.do">질문 게시판</a></li>
						</ul></li>
					<!-- <li><a href="/board/boardlist1.do">게시판 테스트</a><li> -->
					<li><a href="/board/adBoard.go">여행상품</a>
					<li>
					<li><a href="/event/eventCalendar.go">문화달력</a></li>
					<!-- 로그인여부에 따른 분기점 -->
					<c:if test="${not empty member}">
            			<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">${member.mnick} 님 <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/myPage/myPageMain.do">myPage</a></li>
								<li><a href="#" class="note" onclick="message();">쪽지함 <b class="newMsg"></b></a></li>
								<c:if test="${member.mtype eq 'A'}">
									<li><a href="/manager/managerPage.go">관리자 페이지</a></li>
								</c:if>
								<li><a href="/member/memberLogout.do">로그아웃</a></li>
								<li style="background: resources/img/member/eee.jpg center top no-repeat; float: none; list-style: none; 
											position: absolute; width: 926px; z-index: 0; display: none;"></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${empty member}">
						<li class="dropdown active">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0"	data-close-others="false">회원<b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/member/loginPage.go">로그인</a></li>
								<li><a href="/member/memberEnroll.go">회원가입</a></li>
								<li><a href="/member/infoFindPage.go">id/pw 찾기</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<script>
		function message() {
			var popUrl = "/popUp.inbox";

			var popOption = "width=765, height=485, resizable=no, scrollbars=no, status=no; fullscreen=no; tollbar=no; menubar=no;";

			window.open(popUrl, "", popOption);
		}
	</script>
	<!-- <script>

var sock = new SockJS("<c:url value='/notice'/>");
sock.onmessage = onMessage;
sock.onclose = onClose;
var today = null;

$(function(){
	if($("#hdnSession")!=null){
		console.log("쪽지확인");
		sendMessage();
	}
});

function sendMessage() {

	sock.send("hdn");
	setTimeout(function() {
		console.log('Works!'), 1000
	});
	sendMessage();
};
function onMessage(evt) {
	var data = evt.data;
	
	console.log("data::"+data);
	
	$("#test").text(data);
	/* $('.dropdown-toggle').append(data);
	$('.note').append(data); */

};

function onClose(evt) {
	location.href = '${pageContext.request.contextPath};';
};
</script> -->
</header>