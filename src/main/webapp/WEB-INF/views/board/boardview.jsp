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
	border: 2px solid #E0ECF8;
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
	border-left : none;
	border-right : none;
	border-bottom:dashed 3px lightgray;
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


<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />

		<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"align="center">
				<br><br>
				<h4>게시판 목록</h4>
				<ul class="unstyled">
					<br>
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
				<c:if test="${b.MNo ne member.mno  }">
				<a href="#" onclick="sendNote($(this).siblings('b').children('span').text());">
				<img class="jjokjee" src="/resources/img/timeline/jjokjee.png"/>
				</a></c:if> <br>
				<b>&nbsp; 작성일 : &nbsp;${b.BDate }</b> <br>
				<b>&nbsp; 조회수 : &nbsp;${b.BCount }</b> <br>
				<b>&nbsp; 추천수 : &nbsp;${b.likes }</b> <br>		
				<!-- <a id="likes" href="" onclick="likesupdate()" 
				role="button" class="btn btn-success"> 추천하기</a> -->
				<c:if test="${b.MNo ne member.mno  }">
				<input type="button" class="btn btn-theme" onclick="likesEvent();" name="likes" value="추천하기">
				</c:if>
				<c:if test="${b.isNotice eq 'N' and b.MNo ne member.mno}">				
          <a id="report-modal" href="#report-modal-container" role="button" class="btn btn-danger" data-toggle="modal">신고하기</a>
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
					<b><span class="bTitle" style="margin: 10px; margin-left:0px;">제목 : ${b.BTitle }</span></b>
					<%-- <textarea id="content" style="display: none;">${b.BContent}</textarea> --%>
				</div>	
				<div id="BContent" style="width:100%; min-height:500px; border: 2px solid #F2F2F2; border-top: 0px;
					margin:0 auto; float:left;"><br>${b.BContent}					
				</div>					
				<br>
				
				&nbsp;					
				
				
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
												<a id="report-modal" href="javascript:reportModal(${Coment.mno}, ${Coment.cid}, 'C')" style="color:red;font-size:2">신고</a>
											</div>
										</td>
										<!-- 본문내용 -->
										<td width="67%">
											<div class="text_wrapper" >
											<p>
												<c:choose>
													<c:when test="${Coment.delFlag eq 'Y'}">
														<c:out value="<font color='blue'>삭제된 댓글입니다.</font>" escapeXml="false"/>
													</c:when>
													<c:when test="${Coment.rflag eq 'Y'}">
														<c:out value="<font color='red'>신고당한 댓글입니다.</font>" escapeXml="false"/>
													</c:when>
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
										<td width="15%">
											<div id="btn" style="text-align: center;" align="center">
												<c:if test="${Coment.mno eq member.mno and Coment.delFlag eq 'N' }">
													<input type="hidden" name="cid" value="${Coment.cid }" />											
													<button type="button" class="updateBtn btn btn-warning" id="updateBtn" onclick="updateReply(this);">수정</button>
													<button type="button" class="updateConfirm btn btn-theme" id="updateBtn2"	
															onclick='updateConfirm(this, ${b.BId}, ${b.BCode});' style="display: none;">등록</button>
													<button type="button" class="deleteBtn btn btn-danger" id="delteBtn" 
															onclick="deleteReply(this, ${b.BId}, ${b.BCode});">삭제</button>
												</c:if>
												<c:if test="${Coment.clevel lt 2 && not empty member and Coment.delFlag ne 'Y'}">
													<input type="hidden" name="writer" value="${member.mno }" />
													<input type="hidden" name="recref" value="${Coment.cid }" />
													<input type="hidden" name="clevel" value="${Coment.clevel }" />
													<input type="hidden" name="BId" value="${b.BId }" />													
													<button type="button" class="insertConfirm btn btn-theme" 
													onclick="reComment(this, ${b.BId}, ${b.BCode},'${member.mnick}', ${member.mno}, ${Coment.cid}, ${Coment.clevel});"
													>댓글달기</button>
												</c:if>

												<c:if test="${Coment.clevel > 2} ">
													<span> 마지막 레벨입니다.</span>
												</c:if>

											</div>
										</td>
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
											<button type="submit" id="addReply" class="btn btn-theme" value="댓글 등록">등록</button>
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
				
				<div style="text-align:right; width:100%; padding:0;">
   					<c:if test="${member.mno eq b.MNo}">
						<input type="button" class="btn btn-warning btn-large"
							   onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?BId=${b.BId }'"
							   name="modify" value="수정">
					</c:if>
					&nbsp;
					<c:if test="${member.mno eq b.MNo or member.mtype eq 'A'}">
						<input type="button" class="btn btn-danger btn-large" onclick="deleteEvent();" 
							   name="delete" value="삭제">
					</c:if>
					&nbsp;			
					<input type="button" class="btn btn-theme btn-large" 
						   onclick="location.href='${pageContext.request.contextPath}/board/boardlist${b.BCode }.do'" value="리스트로"/> 
				</div>			
				
				</div>
				
				
			</div>
		</div>
	</div>
</div>
			<c:import url="/WEB-INF/views/common/footer.jsp" />
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
<script src="/resources/js/board/BoardView.js"></script>
	<script>	
		function deleteEvent(){
			
			if (confirm("정말 삭제하시겠습니까?") == true){    //확인
				var bid = ${b.BId};
				location.href="/board/boardDelete.do?"+"BId="+bid
			}else{   //취소
			    return;
			}
		}
		
		function likesEvent(){
			
			var bid = ${b.BId};
			var mno = ${member.mno};
			
			var li = 'lid=0&target_bid='+bid+'&like_mno='+mno
			
			if (confirm("게시글을 추천하시겠습니까?") == true){
			$.ajax ({				

				type : "GET",                     // GET 또는 POST
				url : '/likes/insertLikes.do',          // 서버측에서 가져올 페이지
				data : li,       // 서버측에 전달할 parameter
				timeout : 5000,                  // 응답대기시간 
				dataType : 'json',               // html , javascript, text, xml, jsonp 등이 있다
				beforeSend: function() {      // ajax 요청하기전에 실행되는 함수
					console.log("아작스 테스트");
				},
		        success : function(data) { 	// 정상적으로 완료되었을 경우에 실행된다
		        	alert(data.msg);
		        },	
				error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
					alert("게시물 추천 실패");
				},
				complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수

				}
				});
			}else{   //취소
			    return;
			}	
			
			
		}
		
		
		
		
	</script>
	
	 
</body>
 
</html>
