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
<title>${b.BNo }번게시글</title>
</head>
<style>
.replyArea {
	width: 90%;
	height: 90%;
	border: 3px solid #F8E5D0;
}

.replyArea textArea {
	border-radius: 5px;
	resize: none;
	width: 100%;
	height: 100%;
}
</style>
<script>
$(document).ready(function(){
	
});

</script>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="">
			<div class="col-md-2" align="center">
				&nbsp;&nbsp;
				<h4>--게시판 목록--</h4>
				<ul>
					<br><br><br><br>
					<li><a href="/board/boardlist1.do">자유 게시판</a></li>
					<br>
					<li><a href="/board/boardlist2.do">정보공유 게시판</a></li>
					<br>
					<li><a href="/board/boardlist3.do">여행후기 게시판</a></li>
					<br>
					<li><a href="/board/boardlist4.do">질문 게시판</a></li>
				</ul>
			</div>
			<div class="col-md-10" overflow:auto id="boardview">
				<!-- 게시판 고유 번호 -->
				<input type="hidden" name="BNo" value="${b.BNo }" /> <input
					type="hidden" name="MNo" value="${b.MNo }" /> <input type="hidden"
					name="BId" value="${b.BId }" />
				<!-- 게시판 제목 -->
				<input type="text" name="boardTitle" id="boardTitle"
					value="${b.BTitle }" readonly>
				<!-- 게시판 작성자 -->
				<input type="text" class="form-control" name="boardWriter"
					value="${b.mnick}" readonly>
				<textarea id="content" style="display: none;">${b.BContent}</textarea>
				<div id="BContent"
					style="width: 90%; height: 500px; background-color: aliceblue">
					${b.BContent}</div>
				&nbsp;&nbsp;&nbsp; <input type="button"
					class="btn btn-theme btn-large"
					onclick="location.href='${pageContext.request.contextPath}/board/boardlist1.do'"
					value="리스트로" />
				<c:if test="${member.mno eq b.MNo}">
					<input type="button" class="btn btn-theme btn-large"
						onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?BId=${b.BId }'"
						name="modify" value="수정">
				</c:if>
				<c:if test="${member.mno eq b.MNo or member.mtype eq 'A'}">
					<input type="button" class="btn btn-theme btn-large"
						onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?BId=${b.BId }'"
						name="delete" value="삭제">
				</c:if>
				


				<div class="replyArea">
					<div id="replySelectArea" style="background-color: aliceblue">
						<table border="1" bordercolor="lightgray" width="100%">
							<!-- 댓글 목록 -->
							<c:if test="${not empty clist}">
								<c:forEach var="Coment" items="${clist }">
								<%-- <c:if test="${Coment.cref eq 0 }"> --%>								
									<input type=hidden name="bid" id="bid" value="${b.BId }"></input>
									<tr>
										<!-- 아이디, 작성날짜 -->
										<td width="10%">
											<div>
												<c:if test="${Coment.clevel >1 }">
												&nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->                            
                         						Re :
             						            </c:if>
												<b>${Coment.mnick }</b><br>												 
												<font size="2" color="lightgray">${Coment.cdate }</font>
											</div>
										</td>
										<!-- 본문내용 -->
										<td width="75%">
											<div class="text_wrapper">
												<textarea class="reply-content" readonly="readonly"
													id="replycontent" name="replycontent"
													style="background-color: aliceblue">${Coment.ccontent }</textarea>
													<input type="hidden" name="writer" value="${member.mno }" />
													<input type="hidden" name="cref" value="${Coment.cid }" />
													<input type="hidden" name="clevel" value="${Coment.clevel }" />
													<input type="hidden" name="BId" value="${b.BId }" />												
											</div>
										</td>
										<!-- 버튼 -->
										<td width="15%">
											<div id="btn" style="text-align: center;" align="center">

												<c:if test="${Coment.mno eq member.mno }">
													<input type="text" name="cid" value="${Coment.cid }" />
								&nbsp;	  				
								<button type="button" class="updateBtn" id="updateBtn" onclick="updateReply(this);">수정</button>
								<button type="button" class="updateConfirm" id="updateBtn2"	onclick="updateConfirm(this);" style="display: none;">등록</button>
								<button type="button" class="deleteBtn" id="delteBtn" onclick="deleteReply(this);">삭제</button>
												</c:if>
												<c:if test="${Coment.clevel lt 2 && Coment.mno ne member.mno && not empty member}">
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
									</tr>
									<%-- <tr class="comment">
										<td width="10%"><div><b>${member.mnick }</b></div></td>
											<td style="background : transparent;" width="75%">
											<textarea class="reply-content" name="ccontent" style="background : ivory;"></textarea>
											</td>
											<td width="15%">
											<div>
											<button type="button" class="insertConfirm" onclick="reConfirm(this);" align="center" >댓글추가 완료</button>
											</div> 
											</td>
									</tr> --%>
								<%-- </c:if> --%>
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
										<input type="hidden" name="cref" value="0" /> 
										<input type="hidden" name="clevel" value="1" />
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
						</table>

					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-10"></div>
				</div>
			</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
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

			location.href = "/coment/comentUpdate.do?" + "cid=" + cid + "&bid="
					+ bid + "&ccontent=" + content;
		}

		function deleteReply(obj) {
			// 댓글의 번호 가져오기
			var cid = $(obj).siblings('input').val();

			// 게시글 번호 가져오기
			var bid = ${b.BId}
			;

			location.href = "/coment/comentDelete.do" + "?cid=" + cid/*  + "&bid="
								+ bid; */
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