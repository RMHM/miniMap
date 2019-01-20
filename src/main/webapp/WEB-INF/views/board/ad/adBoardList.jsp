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
						<article>
							<div class="post-image">
								<div class="post-heading">
									<h3>
										<c:if test="${blist[i].getRFlag() eq 'N'}">
											<a href="#">${blist[i].getBTitle()}</a>
										</c:if>
										<c:if test="${blist[i].getRFlag() eq 'Y'}">
											신고당한 게시글 입니다.
										</c:if>
									</h3>
								</div>
								<div style="overflow:hidden; height:auto;">
									<c:if test="${blist[i].getRFlag() eq 'N'}">
										<img src="/resources/img/upload/${thumb[i]}" alt=""/>
									</c:if>
								</div>
								
							</div>
							<p>
								<c:if test="${blist[i].getRFlag() eq 'N'}">
									<c:out value="${fn:substring(blist[i].getBContent().replaceAll('<.*?>', ''), 0, 30)}"/>
								</c:if>
								<c:if test="${blist[i].getRFlag() ne 'N'}">
									<c:out value="신고당한 게시물은 열람할 수 없습니다."></c:out>
								</c:if>
							</p>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i>${blist[i].getBDate()}</li>
									<li><i class="icon-user"></i>${blist[i].getMnick()}</li>
									<li><i class="icon-folder-open"></i>${blist[i].getBCount()} Views</li>
									<li><i class="icon-comments"></i>${comment[i]} Comments</li>
								</ul>
								<c:if test="${blist[i].getRFlag() eq 'N'}">
									<a href="#" class="pull-right">Continue reading <i class="icon-angle-right"></i></a>
								</c:if>
							</div>
							
							<input type="hidden" name="bid" id="bid" value="${blist[i].getBId()}">
						</article>
						
					</c:forEach>
					<div id="pagination" class="col-md-6">
          <!-- 변수선언부  페이지 최소 최대 -->
						<c:set var="paging" value="5"/>
						<c:set var="min">
							<c:choose>
								<c:when test="${cPage-2 lt 2 or maxPage le paging}">1</c:when>
								<c:when test="${cPage+2 gt maxPage}">${maxPage-paging+1}</c:when>
								<c:otherwise>${cPage-2}</c:otherwise>
							</c:choose>
						</c:set>
						<c:set var="max">
							<c:choose>
								<c:when test="${maxPage le paging or cPage+2 ge maxPage}">${maxPage}</c:when>
								<c:when test="${cPage-2 le 1}">${paging}</c:when>
								<c:otherwise>${cPage+2}</c:otherwise>
							</c:choose>
						</c:set>
						<!--  -->
						<span class="all">Page ${cPage} of ${maxPage}</span>
						<c:if test="${cPage eq 1}">
							<span class="current">&lt;&lt;</span>
							<span class="current">&lt;</span>
						</c:if>
						<c:if test="${cPage ne 1}">
							<a href="/board/adBoard.go?cPage=1<c:if test="${type ne ''}">&type=${type}</c:if><c:if test="${keyword ne ''}">&keyword=${keyword}</c:if>" class="inactive">&lt;&lt;</a>
							<a href="/board/adBoard.go?cPage=${cPage-1}<c:if test="${type ne ''}">&type=${type}</c:if><c:if test="${keyword ne ''}">&keyword=${keyword}</c:if>" class="inactive">&lt;</a>
						</c:if>
						<c:forEach var="i" begin="${min}" end="${max}">
							<c:if test="${i eq cPage}">
								<span class="current">${i}</span>
							</c:if>
							<c:if test="${i ne cPage}">
            <a href="/board/adBoard.go?cPage=${i}<c:if test="${type ne ''}">&type=${type}</c:if><c:if test="${keyword ne ''}">&keyword=${keyword}</c:if>" class="inactive">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${cPage eq maxPage}">
							<span class="current">&gt;</span>
							<span class="current">&gt;&gt;</span>
						</c:if>
						<c:if test="${cPage ne maxPage}">
							<a href="/board/adBoard.go?cPage=${cPage+1}<c:if test="${type ne ''}">&type=${type}</c:if><c:if test="${keyword ne ''}">&keyword=${keyword}</c:if>" class="inactive">&gt;</a>
							<a href="/board/adBoard.go?cPage=${maxPage}<c:if test="${type ne ''}">&type=${type}</c:if><c:if test="${keyword ne ''}">&keyword=${keyword}</c:if>" class="inactive">&gt;&gt;</a>
						</c:if>
					</div> 
					<div class="col-md-6">
						<div align="right">
							<select name="" id="selSearch">
								<option value="">선택</option>
                <option value="nick">닉네임</option>
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
              				<h2>검색결과 또는 등록된 게시물이 없습니다.</h2>
							<a href="/board/adBoard.go">처음으로</a>
							<div align="right">
								<select name="" id="selSearch">
									<option value="">선택</option>
									<option value="nick">닉네임</option>
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