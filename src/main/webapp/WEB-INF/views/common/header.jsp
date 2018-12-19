<%@
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header>
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
				<a class="navbar-brand" href="/"><span>We</span> need LoGo</a>
			</div>
			<div class="navbar-collapse collapse ">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/">Home</a></li>
					<li><a href="/testLink.do">타임라인 테스트</a></li>
					<li><a href="/test/testMap.do">지도테스트</a></li>
					<!-- 로그인여부에 따른 분기점 -->
					<c:if test="${not empty member}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Features <b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">myPage</a></li>
								<li><a href="#">로그아웃</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${empty member}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">회원<b class=" icon-angle-down"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/member/loginPage.go">로그인</a></li>
								<li><a href="/member/memberEnroll.go">회원가입</a></li>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</header>