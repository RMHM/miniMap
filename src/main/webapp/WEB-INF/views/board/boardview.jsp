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
	width: 100%;
	height: 90%;
	border: 3px solid #F8E5D0;
}

.replyArea textArea {
	/* border-radius: 5px; */
	border: none;	
	resize: none;
	width: 100%;
	height: 100%;	
	background-color: aliceblue;
}

.uploder-wrap{
	width: 90%;
}

.uploaderp{	
	border: 1px solid;
	
	width: 15%;
	height: 120px;		
}

.uploaderi{
	width: 75%;
	height : 120px;
	border: 1px solid;
	background-color: #F5FBEF;
	
} 

#titlearea{	
	
	border-top:solid 1px;
	border: 2px solid lightgray;
	border-bottom:dashed 1px lightgray;
	margin-bottom: 10px;
	
}

.uploder-profile {
 	width: 100%;
	height: 100%;
	position: absolute; top:0; left: 0;
}

#BContent p img{
	max-width: 95%;
	max-height: auto;
}
.jjokjee{
	width: 15px;
	height: 15px;
}

</style>
<script>
/* $(document).ready(function(){
	
});
 */
</script>
<script src="/resources/js/board/adBoardView.js"></script>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"align="center">
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
			
			<div class="row uploder-wrap">
				<div class="col-md-2 uploaderp">
					<img src="/resources/img/profiles/${b.profile_Path }" class="uploder-profile">
				</div>
				<div class="col-md-10 uploaderi">
				<b>&nbsp; 작성자 : &nbsp;<span>${b.mnick}</span></b>
				<a href="#" onclick="sendNote($(this).siblings('b').children('span').text());">
				<img class="jjokjee" src="/resources/img/timeline/jjokjee.png"/>
				</a> <br>
				<b>&nbsp; 작성일 : &nbsp;${b.BDate }</b> <br>
				<b>&nbsp; 조회수 : &nbsp;${b.BCount }</b> <br>
				<b>&nbsp; 추천수 : &nbsp;${b.likes }</b> <br>		
				<a id="" href="" role="button" class="btn btn-success"> 추천하기</a>
				<c:if test="${b.isNotice eq 'N' }">
				<!-- <a id="report-modal" href="#report-modal-container"  -->
				<a id="report-modal" href="javascript:void(0);" onclick="reportModal(${b.MNo},${b.BId},'B');" 

				role="button" class="btn btn-danger" data-toggle="modal">신고하기</a>
				</c:if>
				<c:if test="${b.RFlag eq 'Y' }">
				<input type="button" class="btn btn-warning"
						onclick="location.href='${pageContext.request.contextPath}/board/boardBlindOff.do?BId=${b.BId }'" 
						name="blindoff" value="블라인드해제">
				</c:if>
				</div>
			</div>
			<div class="row" style="width:90%;">
				<div class="" id="titlearea">
					<span class="bTitle" style="margin: 10px; margin-left:0px;">제목 : ${b.BTitle }</span>
					<%-- <textarea id="content" style="display: none;">${b.BContent}</textarea> --%>
				</div>	
				<div id="BContent" style="width:100%; min-height:500px; border: 2px solid lightgray; border-top: 0px;
					margin:0 auto; float:left;"><br>${b.BContent}					
				</div>
				
				<c:if test="${member.mno eq b.MNo}">
					<input type="button" class="btn btn-theme btn-large"
						onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?BId=${b.BId }'"
						name="modify" value="수정">
				</c:if>
				&nbsp;
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
										<td width="18%">
											<div>
												<c:if test="${Coment.clevel >1 }">
												&nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->                            
                         						<img alt="" src="/resources/img/re-reply.png">
             						            </c:if>
												&nbsp;<b>${Coment.mnick }</b><br>												 
												&nbsp;<font size="2" color="lightgray">${Coment.cdate }</font>
												<a id="report-modal" href="#report-modal-container" onclick="reportModal(${Coment.mno},${Coment.cid},'C');" 
												role="button" class="btn" data-toggle="modal">신고</a>
											</div>
										</td>
										<!-- 본문내용 -->
										<td width="67%">
											<div class="text_wrapper" >
											<p id="cc"><c:choose><c:when test="${Coment.delFlag eq 'Y'}">삭제된 댓글입니다.</c:when><c:otherwise>${Coment.ccontent }</c:otherwise></c:choose></p>
												<%-- <textarea class="reply-content" readonly="readonly" id="replycontent" name="replycontent" style="display:none;"
												 ><c:choose><c:when test="${Coment.delFlag eq 'Y'}">삭제된 댓글입니다.</c:when><c:otherwise>${Coment.ccontent }</c:otherwise></c:choose></textarea> --%>
												 												 
												 	<input type="hidden" name="writer" value="${member.mno }" />
													<input type="hidden" name="cref" value="${Coment.cid }" />
													<input type="hidden" name="clevel" value="${Coment.clevel }" />
													<input type="hidden" name="BId" value="${b.BId }" />												
											</div>
										</td>
										<!-- 버튼 -->
										<td width="15%">
											<div id="btn" style="text-align: center;" align="center">
												<c:if test="${Coment.mno eq member.mno and Coment.delFlag eq 'N' }">
													<input type="hidden" name="cid" value="${Coment.cid }" />											
								<button type="button" class="updateBtn" id="updateBtn" onclick="updateReply(this);">수정</button>
								<button type="button" class="updateConfirm" id="updateBtn2"	onclick="updateConfirm(this);" style="display: none;">등록</button>
								<button type="button" class="deleteBtn" id="delteBtn" onclick="deleteReply(this);">삭제</button>
												</c:if>
												<c:if test="${Coment.clevel lt 2 && not empty member and Coment.delFlag ne 'Y'}">
													<input type="hidden" name="writer" value="${member.mno }" />
													<input type="hidden" name="recref" value="${Coment.cid }" />
													<input type="hidden" name="clevel" value="${Coment.clevel }" />
													<input type="hidden" name="BId" value="${b.BId }" />
													<button type="button" class="insertBtn" id="reinsert"
														onclick="reComment(this);">댓글 달기</button>
													<button type="button" class="insertConfirm" onclick="reConfirm(this);" style="display: none;">댓글달기</button>
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
										<input type="hidden" name="BCount" value="${b.BCount }" />
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
											<textarea id="cContent" name="cContent" required style="background:white;"></textarea>
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
					
				<br>
				<br>
				<input type="button" class="btn btn-theme btn-large" 
				onclick="location.href='${pageContext.request.contextPath}/board/boardlist${b.BCode }.do'" 
				value="리스트로"/> <!-- style="position: absolute; right: 20px;" -->  <br>
				
				
				</div>
				
				
			</div>
		</div>
	</div>
</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>

	<script>	
	
	
		function updateReply(obj) {
						
			// 다른 버튼 숨기기.
			$(obj).siblings('#delteBtn').css('display', 'none');
			$(obj).siblings('#reinsert').css('display', 'none');
			
			var t = $(obj).parents('tr').find('td').eq(1).find('p').html().trim().replace(/\<br\>/gim, '\n');
			console.log(t)
			$(obj).parents('tr').find('td').eq(1).find('p').remove();
			$(obj).parents('tr').find('td').eq(1).append($('<textarea>').attr({'style':'height:50px; background:white'}).text(t));
			
			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).siblings('#updateBtn2').css('display', 'inline');

			// 수정하기 버튼 숨기기
			$(obj).css('display', 'none');			
			
		}

		function updateConfirm(obj) {
			
			// 댓글의 내용 가져오기
			var content = $(obj).parent().parent().prev().find('textarea').val().replace(/\n/gim, '<br>');
			
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
			var bid = ${b.BId};

			location.href = "/coment/comentDelete.do" + "?cid=" + cid
		}

		function reComment(obj) {
			// 추가 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.insertConfirm').css('display', 'inline');

			// 클릭한 버튼 숨기기
			$(obj).css('display', 'none');

			// 내용 입력 공간 만들기
			/* var htmlForm = '<tr class="recomment"><td width="10%"><div><b>${member.mnick }</b></div></td>'
					+ '<td style="background : transparent;" width="75%">'
					+ '<textarea class="reply-content" name="ccontent" style="background : ivory;" ></textarea>'
					+ '</td>'
					+ '<td width="15%">'
					+ '<div id="btn" style="text-align: center;" align="center">'
					+ '<input type="hidden" name="writer" value="${member.mno }" />'
					+ '<input type="hidden" name="cref" value="${Coment.cid }" />'
					+ '<input type="hidden" name="clevel" value="${Coment.clevel }" />'
					+ '<button type="button" class="insertConfirm" onclick="reConfirm(this);" >댓글달기</button>'
					+ '</div> </td>' + '</tr>'; */
			
					var htmlForm1 = '<td><div><b>${member.mnick }</b></div></td>'
					var htmlForm2 = '<textarea class="reply-content" id="recontent" name="recontent" style="background : white " required></textarea>'
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

			// 게시글 번호 가져오기
			var bid = ${b.BId}

			var parent = $(obj).parent();
			var grandparent = parent.parent();
			var siblingsTR = grandparent.siblings().last();

			var content = grandparent.siblings().find('textarea[name="recontent"]').val().replace(/\n/gim, '<br>');			

			// writer, replyContent
			// bid, refcid, clevel	
			
			if(content == null || content.length < 1){
				alert('댓글을 입력해 주셔야 합니다.');				
			}else{
				location.href = '/coment/comentAdd2.do' + '?BId=' + bid
				+'&ccontent=' + content + '&mno=' + ${member.mno} + '&cref=' + cref
						+ '&clevel=' + level; 
				
			}

			
		}
		
		function sendNote(nick){
			var popUrl = "/popUp.write?"+nick;	//팝업창에 출력될 페이지 URL

			var popOption = "width=765, height=485, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);
		}	
		
		
	</script>
	
	<!--Modal -->
	<%-- <form id ="insertReport"  method="post" >
	<form id ="insertReport"  action="${pageContext.request.contextPath}/report/insertReport.do" method="post" >
	<div class="modal fade" id="report-modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
              <h5 class="modal-title" id="myModalLabel">
								신고하시겠습니까?
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						
							<div>
							
							<!-- <input type="hidden" id = "targetType" name = "target_type" value="" /> -->
							<input type="hidden" id = "targetId" name = "target_id" value="" />
							<input type="hidden" name = "report_mno" value="${member.mno}"  />
							
							</div>
							<div class="modal-body">
								<div class = "modal-content">
								<label >신고  대상  </label></div>
								<div class = "modal-content">
								<input type="radio" name="target_type" value = "M" /><label>작성자</label>
								<input type="radio" name="target_type" value = "B" /><label>게시글</label>
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
							<!-- <input id="submit" type="submit" value="신고하기"class="btn btn-primary" > -->
							<!-- <button class="" id="reportbtn" onclick="insertRe();"> -->
							<button class="" id="reportbtn" data-dismiss="modal" >
								신고하기
							</button> 
							<button  class="btn btn-secondary" data-dismiss="modal">
								취소
							</button>
						</div>
					</div>
					
				</div>
				<script>
				
				/* $('#report-modal').click(function(){
					$('#insertReport')[0].reset();
					console.log("${b.BId}");
					$('#targetType').val("B");
					$('#targetId').val("${b.BId}");					
					$('#reportbtn').unbind('click');
					
					$('#reportbtn').click(function(){
				
				
					 	if($("input:radio[name='target_type']").is(":checked")==false)alert('대상을 선택해주세요');
						else if($("input:radio[name='rcode']").is(":checked")==false)alert('신고사유를 선택해주세요');
						else{
							if(($('#rdetail').val()==""))$('#rdetail').val("세부내용없음");
 						var re = $('#insertReport').serializeArray();
	 					 $.ajax({
						 url : "${pageContext.request.contextPath}/report/insertReport.do",
						 data :re, 
						 
						 contentType: "application/json", 
							dataType : "json",
							success : function() {
								alert("신고접수 완료");
								 
							},
							error : function(e) {
								alert("신고 실패");
							}
							
						});	  
						} 
	 					
	 					
					});
				
				}); */
				
			/* 	function insertRe(){
					/* console.log(this.serialize());
					console.log($('#insertReport').val());
					console.log($('#targetType').val()); 
					alert("test");
					
					 	$.ajax({
							url : "${pageContext.request.contextPath}/report/insertReport.do",
							data : {kkk:$('#insertReport').serialsize()},
							dataType : "json",
							success : function(data) {
								alert(data);
								 
							},
							error : function(e) {
								alert("신고 실패");
							}
							
						});	 
			
				} */
				</script>
	</div>	
	</form> --%>
<!-- <script>
 $("#reportbtn").click(function(){
	 $('#insertReport').attr(("action", "${pageContext.request.contextPath}/report/insertReport.do"});
}); 
</script> -->

</body>
</html>

	
		
		 
			