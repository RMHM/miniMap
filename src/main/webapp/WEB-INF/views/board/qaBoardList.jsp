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
<title>질문게시판 리스트</title>

</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="container">
			<div class="col-md-2" align="center">
				&nbsp;&nbsp;
				<h4>--게시판 목록--</h4>
				<ul class="unstyled">
					<br><br><br><br>
					<li><a href="/board/boardlist1.do">자유 게시판</a></li><br>
					<li><a href="/board/boardlist2.do">정보공유 게시판</a></li><br>
					<li><a href="/board/boardlist3.do">여행후기 게시판</a></li><br>
					<li><a href="/board/boardlist4.do">질문 게시판</a></li>
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
							<c:forEach var="Board" items="${list2 }"> <!-- 공지 게시글 페이지 -->
									<tr name="BId" id="${Board.BId }" style="background-color: lightskyblue;">									
									   <td><c:out value="${Board.BNo }"/></td>
                     				   <td><c:out value="공지"/></td>
                  				       <td><c:out value="${Board.BTitle }"/></td>
               				           <td><c:out value="${Board.mnick}"/></td>
               				           <td><c:out value="${Board.BCount }"/></td>
                			           <td><c:out value="${Board.BDate}"/></td>
									</tr>
								</c:forEach>									
								<c:forEach var="Board" items="${list }"> <!-- 일반 게시글 페이지 -->
									<tr name="BId" id="${Board.BId }">
                     				   <td><c:out value="${Board.BNo }"/></td>
                     				   <td><c:out value="일반"/></td>
                  				       <td><c:out value="${Board.BTitle }"/></td>
               				           <td><c:out value="${Board.mnick}"/></td>
               				           <td><c:out value="${Board.BCount }"/></td>
                			           <td><c:out value="${Board.BDate}"/></td>
                    				</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 페이지 처리 해야됨. -->
						<c:out value="${pageBar}" escapeXml="false"/>
						<c:if test="${not empty member and member.mtype ne 'C'}">
						<input type="button" value="글쓰기" id=""
							class="btn btn-theme" onclick="location.href='${pageContext.request.contextPath}/board/boardwrite.do'" 
							style="position: absolute; right: 30px;" />
						</c:if>	
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
</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
</body>
</html>