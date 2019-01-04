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
<title>${b.BNo }번게시글 </title>
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

.uploder-profile {
 	width: 120px;
	height: 120px;
}

.uploader{
	width: 90%;
	border: 2px solid;
	
}

</style>
<script>
/* $(document).ready(function(){
	
});
 */
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
				<input type="hidden" name="BNo" value="${b.BNo }" />
				<input type="hidden" name="MNo" value="${b.MNo }" />
				<input type="hidden" name="BId" value="${b.BId }" />
				
				<!-- 게시판 작성자 -->
				<br>
				<div class="uploader">				
				<img src="/resources/img/profiles/${b.profile_Path }" class="uploder-profile">				
				&nbsp;&nbsp; 작성자 &nbsp; : &nbsp;${b.mnick}				
				<br>
				 <a id="report-modal" href="#report-modal-container" role="button" class="btn" data-toggle="modal">신고하기</a>
				</div>
				<!-- 게시판 제목 -->
				<div id="titlearea" style="width: 90%; background-color: lightblue">
				제목 : ${b.BTitle }
				</div>
				<textarea id="content" style="display: none;">${b.BContent}</textarea>
				<div id="BContent" style="width: 90%; min-height:300px; background-color: aliceblue">
					${b.BContent}</div>
				&nbsp;&nbsp;&nbsp; 
				<input type="button" class="btn btn-theme btn-large" 
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
												<textarea class="reply-content" readonly="readonly" id="replycontent" name="replycontent" style="background-color: aliceblue"
												 ><c:choose><c:when test="${Coment.delFlag eq 'Y'}">삭제된 댓글입니다.</c:when><c:otherwise>${Coment.ccontent }</c:otherwise></c:choose></textarea>
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
	
	<!--Modal -->
	<form id ="insertReport"  action="${pageContext.request.contextPath}/report/insertReport.do" method="post" >
	<div class="modal fade" id="report-modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								게시물을 신고하시겠습니까?
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						
							<div>
							
							<input type="hidden" id = "targetType" name = "target_type" value="" />
							<input type="hidden" id = "targetId" name = "target_id" value="" />
							<input type="hidden" name = "report_mno" value="${member.mno}"  />
							
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
								<textarea name="rdetail" id="rdetail"  rows="10"style="width:400px; height:70px"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">				 
							<input id="submit" type="submit" value="신고하기"class="btn btn-primary" >
							<!-- <button class="btn btn-primary" id="reportbtn" onclick="insertRe();">
								신고하기
							</button>  -->
							<button  class="btn btn-secondary" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
					
				</div>
				<script>
				$('#report-modal').click(function(){
					console.log(this);
					$('#targetType').val("B");
					$('#targetId').val("${b.BId}");
				});
				</script>
	</div>	
	</form>
<!-- <script>
 $("#reportbtn").click(function(){
	 $('#insertReport').attr(("action", "${pageContext.request.contextPath}/report/insertReport.do"});
}); 
</script> -->

</body>
</html>

	
		
		 
			