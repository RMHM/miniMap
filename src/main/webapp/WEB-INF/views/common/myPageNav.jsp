<%@
	page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
	.test {
		color : red;
		background-image : url('/resources/img/timeline/jjokjee.png');
		background-size: contain;
		background-repeat : no-repeat;
		background-position : 50% 50%;
		
	}
</style>
<div class="col-md-2" align="center">
		<!-- <a href="/myPage/testt.do">test</a><br/> -->
		${member.mnick } 님 

		 <a id= "aTest" href="#" onclick="test();" class="note">
			<img id="imgtest"alt=""src="/resources/img/timeline/jjokjee.png" width="20px"height="20px">
			 <b class="newMsg"></b>
		</a> 
		<br/>
		<!--  style="position:absolute; top: 0px; right: 40px; font-weight: bold; font-size:x-small; color:red"  -->
		
		<a href="/myPage/myPageMain.do">정보수정</a><br/>
		<a href="/myPage/selectSchedule.do">일정관리</a><br/>
		<!-- <li><a href="#">지도</a></li> -->
		<a href="/myPage/myBoardList.do">작성 게시글</a><br/>
		<c:if test="${member.mtype eq 'C'}">
			<a href="/myPage/rePermissionPage.do">권한 요청(기업)</a><br/>
		</c:if>
		
		<script>

		
		function test(){
		
			var popUrl = "/popUp.inbox";	//팝업창에 출력될 페이지 URL
			
			var popOption = "width=765, height=485, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);
		}

	
		</script>
</div>