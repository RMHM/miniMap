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
<title>miniMap에 오신걸 환영합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

</head>

<body>
	<!-- 외부파일 선언 -->

	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<div class="container">
			<div class="col-md-10">

				<!-- <div class="container-fluid">
					<div class="row">
					<div class="col-lg-4 col-md-offset-4"> -->
						<div class="btn-group">
							<input type="button" value="작성 게시글" id="boTab" class="btn btn-theme" >
							<input type="button" value="작성 댓글" id="coTab" class="btn btn-theme" >
							<input type="button" value="관리자 페이지로" id="mngTab" class="btn btn-theme" >
						</div>
					<!-- </div> -->
						<div id = "boTable" class="list">

							<table  class="table table-hover">
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
									<c:if test="${!empty list }">
										<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">

											<tr id="${list.get(a).getBId()}">
												<td>${list.get(a).getBNo()}</td>
												<td>${list.get(a).getBCode()}</td>
												<td>${list.get(a).getBTitle()}</td>
												<td>${list.get(a).getMNo()}</td>
												<td>${list.get(a).getBCount()}</td>
												<td>${list.get(a).getBDate()}</td>

											</tr>
										</c:forEach>

									</c:if>
									<c:if test="${empty list }">
											<tr >
												<td colspan="6" align="center">작성 게시글이 없습니다.</td>
									

											</tr>
									
									</c:if>
								</tbody>
							</table>

							<c:out value="${pageBar}" escapeXml="false" />
							
						</div>
						
						<div id = "coTable" class="list" style="display:none">

							<table  class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty colist }">
										<c:forEach var="a" begin="0" end="${colist.size()-1 }" step="1">
										
											<tr id="${colist.get(a).getBid()}">
												<td>${colist.get(a).getCid()}</td>
												<td>${colist.get(a).getBid()}</td>
												<td>${colist.get(a).getCcontent()}</td>
												<td>${colist.get(a).getMno()}</td>
												<td>${colist.get(a).getCdate()}</td>
											</tr>
										</c:forEach>

									</c:if>
									<c:if test="${empty colist }">
											<tr >
												<td colspan="5" align="center">작성한 댓글이 없습니다.</td>
									

											</tr>
									
									</c:if>
								</tbody>
							</table>

							<c:out value="${copageBar}" escapeXml="false" />
							
						</div>
					</div>
				</div>
			</div>

			<script>
			$(function() {
				 $('#boTab').click(function(){
							$('#boTable').attr('style','display:block');
							$('#coTable').attr('style','display:none');		
				 });
					$('#coTab').click(function(){
							$('#boTable').attr('style','display:none');
							$('#coTable').attr('style','display:block');
					}); 
					
					$('#mngTab').click(function(){
						location.href = 'managerPage.go';
					});
					
					$("tr[id]").on("click", function() {
						var bId = $(this).attr("id");
					 	if($(this).children('td:eq(1)').text()==5) location.href = "${pageContext.request.contextPath}/board/adBoardView.do?bid="+bId; 
						else  location.href = "${pageContext.request.contextPath}/board/boardview.do?BId="+bId; 
					
						   
					});
				});
			</script>


		</div>
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>
