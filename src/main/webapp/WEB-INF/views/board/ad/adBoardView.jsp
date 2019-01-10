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
				<input type="hidden" name="BNo" value="${b.BNo }" />
				<input type="hidden" name="MNo" value="${b.MNo }" />
				<input type="hidden" name="BId" value="${b.BId }" />
				<!-- 게시판 제목 -->
				<label id="bTitle" style="font-size:2em; font-weight:bold">${b.BTitle }</label><br>
				<!-- 게시판 작성자 -->
				<div class="col-md-6">
					<strong>작성자 : ${b.mnick} &nbsp; 작성일 : ${b.BDate} &nbsp; 방문수 : ${b.BCount}</strong>
				</div>
				<div class="col-md-6" align="right">
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
					<input type="button" class="btn btn-theme btn-large" onclick="location.href='${pageContext.request.contextPath}/board/adBoard.go'" value="이전 항목으로" />
				</div>
				
				<textarea id="content" style="display: none;">${b.BContent}</textarea>
				<div id="BContent" style="width: 100%; height: auto; background-color: aliceblue; overflow:hidden"> ${b.BContent}</div>
				&nbsp;&nbsp;&nbsp;
								
				<div class="replyArea">
					<div id="replySelectArea" style="background-color: aliceblue">
						<table border="1" bordercolor="lightgray" width="100%">
							<!-- 댓글 목록 -->
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
										
										<td width="70%" <c:if test="${empty member or Coment.delFlag eq 'Y'}">colspan=2</c:if>>
											<div class="text_wrapper">
												<textarea class="reply-content" readonly="readonly" id="replycontent" name="replycontent" style="background-color: aliceblue"><c:choose><c:when test="${Coment.delFlag eq 'Y'}"><c:out value="삭제된 댓글입니다."/></c:when><c:otherwise><c:out value="${Coment.ccontent}"/></c:otherwise></c:choose></textarea>
												 	<input type="hidden" name="writer" value="${member.mno }" />
													<input type="hidden" name="cref" value="${Coment.cid }" />
													<input type="hidden" name="clevel" value="${Coment.clevel }" />
													<input type="hidden" name="BId" value="${b.BId }" />												
											</div>
										</td>
										<!-- 버튼 -->
										<c:if test="${not empty member and Coment.delFlag ne 'Y'}">
											<td width="20%">
												<div id="btn" style="text-align: center;" align="center">
													<c:if test="${Coment.mno eq member.mno }">
														<input type="hidden" name="cid" value="${Coment.cid }" />											
														<button type="button" class="updateBtn" id="updateBtn" onclick="updateReply(this);">수정</button>
														<button type="button" class="updateConfirm" id="updateBtn2"	onclick="updateConfirm(this);" style="display: none;">등록</button>
														<button type="button" class="deleteBtn" id="delteBtn" onclick="deleteReply(this);">삭제</button>
													</c:if>
													<c:if test="${Coment.clevel lt 2 && not empty member}">
														<input type="hidden" name="writer" value="${member.mno }" />
														<input type="hidden" name="recref" value="${Coment.cid }" />
														<input type="hidden" name="clevel" value="${Coment.clevel }" />
														<input type="hidden" name="BId" value="${b.BId }" />
														<button type="button" class="insertBtn"
															onclick="reComment(this);">댓글 달기</button>
														<button type="button" class="insertConfirm" onclick="reConfirm(this);" style="display: none;">댓글추가 완료</button>
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
													<button type="submit" id="addReply" value="댓글 등록">등록</button>
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
						</table>
					</div>
				</div>
				<br>
				
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
	
	
	<script>
		function updateReply(obj) {
			// 현재 위치와 가장 근접한 textarea 접근하기
			$(obj).parent().parent().prev().find('textarea').removeAttr(
					'readonly');
			$(obj).parent().parent().prev().find('textarea').css(
					'background-color', 'white');
			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.updateConfirm').css('display', 'inline');

			// 수정하기 버튼 숨기기
			$(obj).css('display', 'none');
		}

		function updateConfirm(obj) {
			// 댓글의 내용 가져오기
			var content = $(obj).parent().parent().prev().find('textarea').val();
			console.log(content);

			// 댓글의 번호 가져오기
			var cid = $(obj).siblings('input').val();

			// 게시글 번호 가져오기
			var bid = ${b.BId};
			
			var bCode = ${b.BCode};

			location.href = "/coment/comentUpdate.do?" + "cid=" + cid + "&bid="
					+ bid + "&ccontent=" + content + "&bCode=" + bCode;
		}

		function deleteReply(obj) {
			// 댓글의 번호 가져오기
			var cid = $(obj).siblings('input').val();

			// 게시글 번호 가져오기
			var bid = ${b.BId};
			var bCode = ${b.BCode}

			location.href = "/coment/comentDelete.do" + "?cid=" + cid + "&bCode=" + bCode
		}

		function reComment(obj) {
			// 추가 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.insertConfirm').css('display', 'inline');

			// 클릭한 버튼 숨기기
			$(obj).css('display', 'none');

			// 내용 입력 공간 만들기
			var htmlForm = '<tr class="recomment"><td width="10%"><div><b>${member.mnick }</b></div></td>'
					+ '<td style="background : transparent;" width="75%">'
					+ '<textarea class="reply-content" name="ccontent" style="background : ivory;"></textarea>'
					+ '</td>'
					+ '<td width="15%">'
					+ '<div id="btn" style="text-align: center;" align="center">'
					+ '<input type="hidden" name="writer" value="${member.mno }" />'
					+ '<input type="hidden" name="cref" value="${Coment.cid }" />'
					+ '<input type="hidden" name="clevel" value="${Coment.clevel }" />'
					+ '<button type="button" class="insertConfirm" onclick="reConfirm(this);" >댓글추가 완료</button>'
					+ '</div> </td>' + '</tr>';
			
					var htmlForm1 = '<td><div><b>${member.mnick }</b></div></td>'
					var htmlForm2 = '<textarea class="reply-content" name="recontent" style="background : ivory;"></textarea>'
						+ '<input type="hidden" name="writer" value="${member.mno }" />'
						+ '<input type="hidden" name="cref" value="${Coment.cid }" />'
						+ '<input type="hidden" name="clevel" value="${Coment.clevel }" />'
					
			$(obj).parent().parent().prev().prev().append(htmlForm1);
			$(obj).parent().parent().prev().append(htmlForm2);			

			

		}

		function reConfirm(obj) {
			// 댓글의 내용 가져오기

			// 참조할 댓글의 번호 가져오기
			var cref = $(obj).siblings('input[name="recref"]').val();
			var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;

			console.log($(obj).parent('div').siblings());

			console.log('cref=' + cref);

			console.log('clevel=' + level);

			// 게시글 번호 가져오기
			var bid = ${b.BId}

			var parent = $(obj).parent();
			var grandparent = parent.parent();
			var siblingsTR = grandparent.siblings().last();

			var content = grandparent.siblings().find('textarea[name="recontent"]').val();

			//console.log(parent.html());
			//console.log(grandparent.html());
			//console.log(siblingsTR.html());
			console.log('bid='+bid);
			console.log('ccontent='+content);

			// writer, replyContent
			// bid, refcid, clevel

			location.href = '/coment/comentAdd2.do' + '?BId=' + bid
			+'&ccontent=' + content + '&mno=' + ${member.mno} + '&cref=' + cref
					+ '&clevel=' + level; 
		}

		
	</script>
	
	
</body>
</html>