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
<title>board test page</title>

</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="container">
			<div class="col-md-2" align="center">
				&nbsp;&nbsp;
				<h4>--게시판 목록--</h4>
				<ul>
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					<li class=""><a href="/board/boardlist1.do">자유 게시판</a></li> &nbsp;
					<li class="">정보공유 게시판</li> &nbsp;
					<li class="">여행후기 게시판</li> &nbsp;
					<li class="">질문 게시판</li>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="ad">
					<div class="ad">
						<img class="" alt="" src="" />
						<div class="ad caption">
							<h4>광-고</h4>
							<p>광고좀 넣어주세요 현기증 난단 말이에요. 빨리 하야끄</p>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					
					<div class="col-md-10">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr style="background-color:lightskyblue;">
									<td>1</td>
									<td>공지</td>
									<td>여기에 공지가 들어갈꺼야</td>
									<td>놀고싶다.</td>
									<td>0</td>
									<td>sysdate가 될 것.</td>
								</tr>
								<c:forEach begin="1" end="10" step="1" var="b">
									<tr>
										<td>2</td>
										<td>일반</td>
										<td>여기 이제 게시물이 들어갈꺼야</td>
										<td>놀고싶다.</td>
										<td>0</td>
										<td>sysdate가 될 것.</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 페이지 처리 해야됨. -->
						<input type="button" value="글쓰기" id=""
							class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/board/boardwrite.do'" 
							style="position: absolute; right: 30px;" />
						<div class="" id=""
							style="display: flex; align-items: center; justify-content: center;">
							<form class="search">
								<input class="seracharea" type="text" />
								<button class="searchbtn" type="submit">검색</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
</body>
</html>