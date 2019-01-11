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
<title>광고게시판 - ${b.BTitle}</title>
</head>
<style>
	.replyArea {
		width: 100%;
		height: 90%;
		border: 3px solid #F8E5D0;
	}
	
	.replyArea textarea {
		border-radius: 5px;
		resize: none;
		width: 100%;
		height: 100%;	
	}
	img {
		max-width : 100%;
		height : auto;
	}

</style>

<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		<div class="navbar-header" style="background:#68A4C4; width:100%">
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
					<h3>게시판 상세보기</h3>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<br>
				<input type="hidden" name="BNo" value="${b.BNo}" />
				<input type="hidden" name="MNo" value="${b.MNo}" />
				<input type="hidden" name="BId" value="${b.BId}" />
				<!-- 게시판 제목 -->
				<label id="bTitle" style="font-size:2em; font-weight:bold">${b.BTitle }</label><br>
				<!-- 게시판 작성자 -->
				<div class="col-md-6">
					<strong>작성자 : ${b.mnick} &nbsp; 작성일 : ${b.BDate} &nbsp; 방문수 : ${b.BCount}</strong>
				</div>
				<div class="col-md-6" align="right">
					<div class="btn-group">
						<!-- 회원정보 확인 -->
						<c:if test="${member.mno eq b.MNo}">
							<input type="button" class="btn btn-warning btn-large" name="modify" value="수정"
								onclick="location.href='${pageContext.request.contextPath}/board/adBoardUpdate.go?bid=${b.BId }'">
						</c:if>
						<!-- 회원번호와 작성자 번호가 일치하거나 회원이 관리자 일 경우 -->
						<c:if test="${member.mno eq b.MNo or member.mtype eq 'A'}">
							<input type="button" class="btn btn-danger btn-large" name="delete" value="삭제"
								onclick="location.href='${pageContext.request.contextPath}/board/adBoardRemove.do?bid=${b.BId }'">
						</c:if>
						<c:if test="${not empty member and member.mno ne b.MNo}">
							<%-- <input type="button" id="btnReport" value="신고" class="btn btn-danger btn-large" onclick="report(${b.BId});"> --%>
							<a id="report-modal" href="#report-modal-container" role="button" class="btn btn-danger btn-large" data-toggle="modal">신고하기</a>
						</c:if>
						<input type="button" class="btn btn-theme btn-large" onclick="location.href='${pageContext.request.contextPath}/board/adBoard.go'" value="이전 항목으로" />
					</div>
				</div>
				
				<textarea id="content" style="display: none;">${b.BContent}</textarea>
				<div id="BContent" style="width: 100%; height: auto; background-color: aliceblue; overflow:hidden"> ${b.BContent}</div>
				&nbsp;&nbsp;&nbsp;
								
				<div class="replyArea">
					<div id="replySelectArea" style="background-color: aliceblue">
						<table border="1" bordercolor="lightgray" width="100%">
							<!-- 댓글 목록 -->
							<tbody>
								<c:if test="${not empty clist}">
									<c:forEach var="Coment" items="${clist}">
									<%-- <c:if test="${Coment.cref eq 0 }"> --%>								
										<input type=hidden name="bid" id="bid" value="${b.BId }"></input>
										<tr>
											<!-- 아이디, 작성날짜 -->
											<td width="10%">
												<div>
													<c:if test="${Coment.clevel >1 }">
													&nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->                            
	                         						<img alt="" src="/resources/img/re-reply.png">
	             						            </c:if>
													<b>${Coment.mnick }</b><br>												 
													<font size="2" color="lightgray">${Coment.cdate }</font>
												</div>
											</td>
											<!-- 본문내용 -->
											
											<td width="50%" <c:if test="${empty member or Coment.delFlag eq 'Y'}">colspan=2</c:if>>
												<div class="text_wrapper">
													<%-- <textarea class="reply-content" readonly="readonly" id="replycontent" name="replycontent" style="background-color: aliceblue"><c:choose><c:when test="${Coment.delFlag eq 'Y'}"><c:out value="삭제된 댓글입니다."/></c:when><c:otherwise><c:out value="${Coment.ccontent}"/></c:otherwise></c:choose></textarea> --%>
														<p>
															<c:choose>
																<c:when test="${Coment.delFlag eq 'Y'}">
																	<c:out value="삭제된 댓글입니다."/></c:when>
																<c:otherwise>
																	${Coment.ccontent}
																</c:otherwise>
															</c:choose>
														</p>
													 	<input type="hidden" name="writer" value="${member.mno }" />
														<input type="hidden" name="cref" value="${Coment.cid }" />
														<input type="hidden" name="clevel" value="${Coment.clevel }" />
														<input type="hidden" name="BId" value="${b.BId }" />												
												</div>
											</td>
											<!-- 버튼 -->
											<c:if test="${not empty member and Coment.delFlag ne 'Y'}">
												<td width="40%" align="center">
													<div id="btn" style="text-align: center;" class='btn-group'>
														<c:if test="${Coment.mno eq member.mno }">
															<input type="hidden" name="cid" value="${Coment.cid }" />
															<input type="button" value="수정" class="btn btn-warning" id="updateBtn" onclick="updateReply(this);">
															<input type="button" value="등록" class="btn btn-theme" id="updateBtn2" onclick='updateConfirm(this, ${b.BId}, ${b.BCode});' style="display: none;">
															<input type="button" value="삭제" class="btn btn-danger" id="delteBtn" onclick="deleteReply(this, ${b.BId}, ${b.BCode});">
														</c:if>
														<c:if test="${Coment.clevel lt 2 && not empty member}">
															<input type="hidden" name="writer" value="${member.mno }" />
															<input type="hidden" name="recref" value="${Coment.cid }" />
															<input type="hidden" name="clevel" value="${Coment.clevel }" />
															<input type="hidden" name="BId" value="${b.BId }" />
															<c:if test="${Coment.mno eq member.mno}"><br></c:if>
															<input type="button" value="댓글등록" class="btn btn-theme" onclick="reComment(this, ${b.BId}, ${b.BCode},'${member.mnick}', ${member.mno}, ${Coment.cid}, ${Coment.clevel});">
														</c:if>
		
														<c:if test="${Coment.clevel > 2} ">
															<span> 마지막 레벨입니다.</span>
														</c:if>
		
													</div>
												</td>
											</c:if>
										</tr>
										
									</c:forEach>
								</c:if>
							</tbody>
							
							<tfoot>
								<!-- 로그인 했을 경우만 댓글 작성가능 -->
								<c:if test="${not empty member}">
									<div class="replyWriteArea">								
										<tr bgcolor="#F5F5F5">
											<form action="/coment/comentAdd.do" method="post" id="coment" enctype="multipart/form-data">
												<input type="hidden" name="mnick" value="${member.mnick }" />
												<input type="hidden" name="mno" value="${member.mno }" /> 
												<input type="hidden" name="BId" value="${b.BId }" />
												<input type="hidden" name="BCount" value="${b.BCount }" />
												<input type="hidden" name="cref" value="0" /> 
												<input type="hidden" name="clevel" value="1" />
												<input type="hidden" name="bCode" value="${b.BCode}" />
												<!-- 아이디-->
												<td width="15%">
													<div>
														<b>${member.mnick }</b>
													</div>
												</td>
												<!-- 본문 작성-->
												<td width="70%">
													<div>
														<textarea id="cContent" name="cContent"></textarea>
													</div>
												</td>
												<!-- 댓글 등록 버튼 -->
												<td width="15%">
													<div id="btn" style="text-align: center;">
														<input type="submit" class='btn btn-submit' value="댓글등록" id="addReply">
														
													</div>
												</td>
											</form>
										</tr>
									</div>
								</c:if>
								<c:if test="${empty member}">
									<div class="replyWriteArea">
										<tr>
											<td colspan=3 align=center><h5>비회원은 댓글을 작성할수 없습니다.</h5></td>
										</tr>
									</div>
								</c:if>
							</tfoot>
						</table>
					</div>
				</div>
				<br>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
	
	<!--Modal -->
	<form id ="insertReport"  method="post" >
	<%-- <form id ="insertReport"  action="${pageContext.request.contextPath}/report/insertReport.do" method="post" > --%>
		<div class="modal fade" id="report-modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">게시물을 신고하시겠습니까?</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					
					<div class="modal-body">
						<div>
							<input type="hidden" id = "targetId" name = "target_id" value="" />
							<input type="hidden" name = "report_mno" value="${member.mno}"  />
						</div>
						<div class="modal-body">
							<div class = "modal-content">
							<label >신고  대상  </label></div>
							<div class = "modal-content">
							<input type="radio" name="target_type" value = "M" /><label>&nbsp;작성자</label>&nbsp;
							<input type="radio" name="target_type" value = "B" /><label>&nbsp;게시글</label>
							</div>
						</div>
						<div class="modal-body">
							<div class = "modal-content">
							<label >신고  사유 : </label></div>
							<div class = "modal-content">
							<input type="radio" name="rcode" value = "1" /><label>욕설</label>
							<input type="radio" name="rcode" value = "2" /><label>도배</label>
							<input type="radio" name="rcode" value = "3" /><label>사칭</label>
							<input type="radio" name="rcode" value = "4" /><label>비방</label>
							<input type="radio" name="rcode" value = "5" /><label>조작</label>
							<input type="radio" name="rcode" value = "6" /><label>기타</label>
							</div>
						</div>
						<div class="modal-body">
							<div class = "modal-content">
								<label>세부 내용: </label>
							</div>
							<div class = "modal-content">
								<textarea name="rdetail" id="rdetail"  rows="10"style="width:100%; height:100%;"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">				 
						<input type="button" value="신고하기" class="btn" id="reportbtn" data-dismiss="" onclick="report(${b.MNo}, ${b.BId});">
						<input type="button" id="btnCancel" value="취소" class="btn btn-secondary" data-dismiss="modal">
					</div>
				</div>
			</div>
		</div>	
	</form>
	
</body>
<script src="/resources/js/board/adBoardView.js"></script>
</html>