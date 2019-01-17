<%@
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개요</title>
<style>
	ul li {
		list-style-image: url( "/resources/img/member/one.jpg" );
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
			<div class="container">
				<div class="col-lg-12">
					<img src="/resources/img/member/main.png" style="width:100%; heigth:auto">
				</div>
				<div class="col-lg-12">
					<ul>
						<li>
							메뉴
							<ul>
								<li>
									개요
									<ul>
										<li>현재 메인 페이지를 소개하는 화면으로 이동합니다.</li>
									</ul>
								</li>
								<li>
									타임라인
									<ul>
										<li>
											실시간으로 회원들간의 정보를 공유하거나 이야기를 나눌 수 있는 타임라인입니다.<br>
											<font color=red>로그인 후 사용 가능합니다.</font>
										</li>
									</ul>
								</li>
								<li>
									지도
									<ul>
										<li>사용자가 원하는 지점을 등록할 수 있습니다.</li>
									</ul>
								</li>
								<li>
									게시판
									<ul>
										<li>
											회원들간의 정보 공유 또는 이야기를 나눌 수 있는 게시판 입니다.<br>
											<font color=red>로그인 후 사용 가능합니다.</font>
										</li>
									</ul>
								</li>
								<li>
									여행상품
									<ul>
										<li>
											제주도에서 현재 판매 중인 여행 상품을 확인 할 수 있는 게시판입니다.<br>
											<font color=red>권한을 받은 기업회원만 게시글을 작성할 수 있습니다.</font>
										</li>
									</ul>
								</li>
								<li>
									문화달력
									<ul>
										<li>
											전시공연을 확인 할 수 있는 달력입니다.<br>
											상세보기를 원할 경우 해당 행사를 선택하면 됩니다.
										</li>
									</ul>
								</li>
								<li>
									회원
									<ul>
										<li>클릭 시 로그인, 회원가입 그리고 ID/PW 찾기 기능을 사용하실 수 있습니다.</li>
									</ul>
								</li>
							</ul>
						</li>
							
						<li>메인</li>
						<li>
							여행 상품
							<ul>
								<li>최근 등록된 여행 상품을 일부 확인 할 수 있습니다.</li>
							</ul>
						</li>
						<li>
							방문자 수
							<ul>
								<li>현재까지 사이트를 방문해준 현황을 확인할 수 있습니다.</li>
							</ul>
						</li>
						<li>
							최근 후기 게시물
							<ul>
								<li>최근 방문하였던 회원님의 게시글을 확인 할 수 있습니다.</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>