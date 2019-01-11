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
			<c:import url="../common/myPageNav.jsp" />

			<div class="col-md-10">
				<div class="container">

					<!-- 	<div class="container-fluid"> -->
					<div class="col-sm-8 text-center">
						<h1>
							<small>회원 정보 </small>
						</h1>
						<!-- </div> -->

						<div class="form-horizontal" id="updateForm">

							<div class="form-group">
								<label class="col-sm-3 control-label" for="userId">유저아이디</label>
								<%-- <label class="col-sm-3 control-label"for="userId" name="userId"><%=m.getUserId()%> --%>
								</label>
								<div class="col-sm-6">
									<input class="form-control" id="mid" name="mid" readonly
										type="" value="${member.mid}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="password">비밀번호
									입력</label>
								<div class="col-sm-6">
									<input class="form-control" id="mpw" name="mpw" type="password">
								</div>
							</div>
							<div class="form-group">

								<button id="mUpdateMember" onclick="mUpdate();">정보 수정</button>

							</div>
							<script>
								function mUpdate() {

									console.log($('#mpw').val());
									$
											.ajax({
												url : "${pageContext.request.contextPath}/myPage/passCheck.do",

												data : {
													mid : $('#mid').val(),
													mpw : $('#mpw').val()
												},
												dataType : "json",
												success : function(data) {
													console.log("asd");
													console.log("일치" + data);
													console.log(data.msg);
													if (data.msg) {
														location.href = "${pageContext.request.contextPath}/myPage/updateMemberView.do";
													} else {
														alert("비밀번호가 일치하지 않습니다.");
													}

												},
												error : function(e) {
													console.log("error" + data);
													alert("ajax 실패");

												}

											});

								}
							</script>

						</div>

					</div>

				</div>
			</div>




		</div>
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>
