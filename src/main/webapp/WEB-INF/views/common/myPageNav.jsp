<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-2" align="center">
	

		<a href="#">쪽지</a><br/>
		<a href="/myPage/myPageMain.do">정보수정</a><br/>
		<a href="/myPage/selectSchedule.do">일정관리</a><br/>
		<!-- <li><a href="#">지도</a></li> -->
		<a href="/myPage/myBoardList.do">작성 게시글</a><br/>
		
		<c:if test="${member.mtype eq 'A'}">
			<a href="/myPage/rePermissionPage.do">권한 요청(기업)</a><br/>
		</c:if>
	
</div>