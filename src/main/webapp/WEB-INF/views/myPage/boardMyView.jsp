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
<style>
td{
text-align:center;
}

</style>
</head>

<body>
	<!-- 외부파일 선언 -->

	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<div class="container">
			<c:import url="../common/myPageNav.jsp" />
		<!-- 	<div class="container">
				<div class="raw">
					<div class="col-lg-4 col-md-offset-4">
						<div class="btn-group">
							<input type="button" value="작성 게시글" id="boTap" class="btn btn-theme" >
							<input type="button" value="작성 댓글" id="coTap" class="btn btn-theme" >
						</div>
					</div>
					<div id="findDiv"  class="col-lg-4 col-md-offset-4">
					</div>
				</div>
			</div> -->
			<div class="col-md-10">

				<div class="container-fluid">
					<div class="row">
					<div class="col-lg-4 col-md-offset-4">
						<div class="btn-group">
							<input type="button" value="작성 게시글" id="boTap" class="btn btn-theme" >
							<input type="button" value="작성 댓글" id="coTap" class="btn btn-theme" >
						</div>
					</div>
					<c:if test="${myType eq 'board' }">
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
								
								
									<%-- 	${list.size() } 
								${list.get(0)}  --%>

									<%--  <c:out value="${list.size() gt 0 }"></c:out>  --%>
									<%-- <c:if test="${list.size() gt 0"> --%>
									<c:if test="${!empty list }">
										<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">
							
											 <c:if test="${list.get(a).getRFlag() eq 'Y' }">
											<tr id="${list.get(a).getBId()}" name="rflag" style="color:red; background:lightgray;">
												<!-- <td colspan="6" style="color:red; background:lightgray;">신고된 게시글 입니다.</td> -->
											
											</c:if>
					
											<c:if test="${list.get(a).getRFlag() eq 'N' }">
										
											<tr id="${list.get(a).getBId()}">
											 </c:if> 
												<td>${list.get(a).getBNo()}</td>
												<td>${list.get(a).getBName()}</td>
												<td>${list.get(a).getBTitle()}</td>
												<td>${member.mname }</td>
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
						</c:if>
						<c:if test="${myType eq 'comment' }">
						 <div id = "coTable" class="list" >

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
												<td>${colist.get(a).getBname()}</td>
												<td>${colist.get(a).getCcontent()}</td>
												<td>${member.mname }</td>
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
						</c:if>
					</div>
				</div>
			</div>

			<script>
		
			
			$(function() {
				 $('#boTap').click(function(){
					 location.href = "${pageContext.request.contextPath}/myPage/myBoardList.do";
				 
							/* $('#boTable').attr('style','display:block');
							$('#coTable').attr('style','display:none');		 */
				 });
					$('#coTap').click(function(){
						location.href = "${pageContext.request.contextPath}/myPage/myCommentList.do";
							/* $('#boTable').attr('style','display:none');
							$('#coTable').attr('style','display:block'); */
					}); 
					
					$("tr[id]").on("click", function() {
						var bId = $(this).attr("id");
				/* 		alert($(this).children('td:eq(1)').value); */
					 	if($(this).children('td:eq(1)').text()=="광고") location.href = "${pageContext.request.contextPath}/board/adBoardView.do?bid="+bId; 
						else  location.href = "${pageContext.request.contextPath}/board/boardview.do?BId="+bId; 
						
						   
					});
					var def ="";
				
					 $('tr[name=rflag]').mouseover(function(){
						def = this;
						console.log(this.change('<tr><td colspan="6">삭제된 게시글입니다.</td></tr>'));
					 
					  });
					  $("tr[name=rflag]").mouseout(function(){
		
					   console.log(def);
					   	this.find('td').remove();
						this.val(def);
				
					  }); 
				});
			</script>


		</div>
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>
