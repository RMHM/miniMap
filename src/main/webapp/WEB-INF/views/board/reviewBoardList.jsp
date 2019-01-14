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
<title>후기게시판 리스트</title>

</head>

<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="container">
		
			<div class="col-md-2" align="center">
				<br><br>
				<h4>--게시판 목록--</h4>
				<ul class="unstyled">
					<br><br>
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
				<div class="container-fluid">
				<input type="hidden" name="bCode" value="1">
					<div class="row">					
						<div class="list">							
							<table class="table table-hover">
								<thead align="center" style="background-color:lightskyblue;">
									<tr>
										<th width="5%">번호</th>
										<th width="5%">분류</th>
										<th width="5%"></th>										
										<th align="center">제목</th>										
										<th width="13%">작성자</th>
										<th width="7%">조회수</th>
										<th width="10%">작성일</th>
									</tr>
								</thead>
								<tbody>							
					
								<c:forEach var="Board" items="${list2 }"> <!-- 공지 게시글 페이지 -->
									<tr name="BId" id="${Board.BId }" style="background-color: #CEECF5;">									
									   <td align="center"><c:out value="${Board.BNo }"/></td>
                     				   <td><c:out value="공지"/></td>
                     				   <td></td>
                  				       <td><c:out value="${Board.BTitle }"/></td>                  				       
               				           <td align="center"><c:out value="${Board.mnick}"/></td>
               				           <td align="center"><c:out value="${Board.BCount }"/></td>
                			           <td><c:out value="${Board.BDate}"/></td>
									</tr>
								</c:forEach>									
								<c:forEach var="Board" items="${list }"> <!-- 일반 게시글 페이지 -->
								<c:choose>	
								<c:when test="${Board.RFlag eq 'Y' }">
								<tr <%--  name="BId" id="${Board.BId }" --%> style="background-color: lightgray;">
                     				   <td align="center"><c:out value="${Board.BNo }"/></td>
                     				   <td><c:out value="일반"/></td>
                     				   <td></td>
                  				       <td>신고된 게시글입니다.</td>                  				       
               				           <td align="center"><c:out value="${Board.mnick}"/></td>
               				           <td align="center"><c:out value="${Board.BCount }"/></td>
                			           <td><c:out value="${Board.BDate}"/></td>
                    				</tr>								
								</c:when>
								<c:otherwise>																				
									<tr name="BId" id="${Board.BId }" style="background-color: #EFF8FB;">
                     				   <td align="center"><c:out value="${Board.BNo }"/></td>
                     				   <td><c:out value="일반"/></td>
                     				   <td></td>
                  				       <td><c:out value="${Board.BTitle }"/></td>                  				       
               				           <td align="center"><c:out value="${Board.mnick}"/></td>
               				           <td align="center"><c:out value="${Board.BCount }"/></td>
                			           <td><c:out value="${Board.BDate}"/></td>
                    				</tr>
                    			</c:otherwise>		
                    			</c:choose>	
								</c:forEach>
														
								</tbody>
								
							</table>
							<!-- 페이지 처리 해야됨. -->
							
							<c:out value="${pageBar}" escapeXml="false"/>
							
							<c:if test="${not empty member and member.mtype ne 'C'}">
							<input type="button" value="글쓰기" id=""	class="btn btn-theme btn-large"
								onclick="location.href='${pageContext.request.contextPath}/board/boardwrite.do?BCode=3'"
								style="position: absolute; right: 20px;" /> </c:if>

							<div class="s-area" id="s-area"
								style="display: flex; align-items: center; justify-content: center;">
								
								<form action="/board/searchlist3.do" method="post" name="search" id="search" enctype="multipart/form-data">
								 <select name="keyField" size="1">
           						     <option value="mnick" <c:if test="${'mnick'==keyField }"> selected</c:if>> 이름 </option>
             						 <option value="BTitle" <c:if test="${'BTitle'==keyField }"> selected</c:if>> 제목 </option>
              						 <option value="BContent" <c:if test="${'BContent'==keyField }"> selected</c:if>> 내용 </option>
           						 </select>
                					 <input type="text" size="16" name="keyWord" value="${keyWord }">
                					 <input type="submit" class="btn btn-info" value="검색" onClick="check()">           						

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
			

		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script>
$(function(){
	$("tr[name]").on("click",function(){
		var BId = $(this).attr("id");
		console.log("BId="+BId);
		location.href = "${pageContext.request.contextPath}/board/boardview.do?BId="+BId;
	});
});

function check() {
    if (document.search.keyWord.value == "") {
        alert("검색어를 입력하세요.");
        document.search.keyWord.focus();
        return;
    }
    document.search.submit();
}


</script>


</html>