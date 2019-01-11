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
<title>광고 게시판</title>
<style>
	img {
		max-width : 100%;
		height : auto;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div class="navbar-header" style="background:#68A4C4; width:100%">
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
					<h3>게시물 목록</h3>
				</div>
			</div>
		</div>
		<div class="container">
			
			<div class="col-md-10 col-md-offset-1">
				<c:if test="${blist.size() ne 0}">
					<c:forEach var="i" begin="0" end="${blist.size()-1}">
						<%-- ${blist[i].getBDate()} --%>
						<article>
							<div class="post-image">
								<div class="post-heading">
									<h3>
										<a href="#">
											<c:if test="${blist[i].getRFlag() eq 'N'}">
												${blist[i].getBTitle()}
											</c:if>
											<c:if test="${blist[i].getRFlag() eq 'Y'}">
												신고당한 게시글 입니다.
											</c:if>
										</a>
									</h3>
								</div>
								<div style="overflow:hidden; height:auto;">
									<c:if test="${blist[i].getRFlag() eq 'N'}">
										<img src="/resources/img/upload/${thumb[i]}" alt=""/>
									</c:if>
								</div>
								
							</div>
							<p>
								<c:out value="${fn:substring(blist[i].getBContent().replaceAll('<.*?>', ''), 0, 30)}"/>
							</p>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i>${blist[i].getBDate()}</li>
									<li><i class="icon-user"></i>${blist[i].getMnick()}</li>
									<li><i class="icon-folder-open"></i>${blist[i].getBCount()} Views</li>
									<li><i class="icon-comments"></i>${comment[i]} Comments</li>
								</ul>
								<a href="#" class="pull-right">Continue reading <i class="icon-angle-right"></i></a>
							</div>
							<input type="hidden" name="bid" id="bid" value="${blist[i].getBId()}">
						</article>
						
					</c:forEach>
					<div id="pagination" class="col-md-6">
						<span class="all">Page ${cPage} of ${maxPage}</span>
						<c:forEach var="i" begin="1" end="${maxPage}">
							<c:if test="${i eq cPage}">
								<span class="current">${i}</span>
							</c:if>
							<c:if test="${i ne cPage}">
								<a href="/board/adBoard.go?cPage=${i}&type=${type}&keyword=${keyword}" class="inactive">${i}</a>
							</c:if>
						</c:forEach>
					</div> 
					<div class="col-md-6">
						<div align="right">
							<select name="" id="selSearch">
								<option value="">선택</option>
								<option value="mnick">닉네임</option>
								<option value="title">제목</option>
							</select>
							<input type="text" name="" id="txtFind">
							<input type="button" value="검색" id="btnSearch" class='btn btn-theme'>
							<c:if test="${sessionScope.member.mtype eq 'A' or authority eq 'yes'}">
								<input type="button" value="글쓰기" id="adWrite" class="btn btn-theme"
								onclick="javascript:location.href='/board/adBoardWrite.go'">
							</c:if>
						</div>
					</div>
				</c:if>
				<c:if test="${blist.size() eq 0}">
					<article>
						<div class="col-md-12">
							<h2>등록된 게시물이 없습니다.</h2>
								<c:if test="${sessionScope.member.mtype eq 'A' or authority eq 'yes'}">
								<input type="button" value="글쓰기" id="adWrite" class="btn btn-theme"
								onclick="javascript:location.href='/board/adBoardWrite.go'">
							</c:if>
						</div>
					</article>
				</c:if>
				<br>
			</div>
			
		</div>
		<br>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>

<script src="/resources/js/board/adBoardList.js"></script>
</html>