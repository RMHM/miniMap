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
							<small>회원 정보 수정 </small>
						</h1>
						<!-- </div> -->

						<form class="form-horizontal" id="updateForm" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="userId">유저아이디</label>
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
								<label class="col-sm-3 control-label" for="mname">이름</label> </label>
								<div class="col-sm-6">
									<input class="form-control" id="mname" name="mname" readonly
										type="text" value="${member.mname}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="mnick">닉네임</label> </label>
								<div class="col-sm-6">
									<input class="form-control" id="mnick" name="mnick" type="text"
										value="${member.mnick}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="email">이메일</label>
								<div class="col-sm-6">
									<input class="form-control" id="email" name="email"
										type="email" value="${member.email}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="gender">성별</label>

								<div class="col-sm-6">
									<input type="radio" name="gender" id="gender0" value="M" />남성
									<input type="radio" name="gender" id="gender1" value="F" />여성
									<%-- <input class="form-control" id="gender" name="gender" type=""
										value="${member.gender}"> --%>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="age">연령대</label>

								<div class="col-sm-6">
									<input type="radio" name="age" id="age0" value="10" />10대 <input
										type="radio" name="age" id="age1" value="20" />20대 <input
										type="radio" name="age" id="age2" value="30" />30대 <input
										type="radio" name="age" id="age3" value="40" />40대

									<%-- 									<input class="form-control" id="age" name="age" type=""
										value="${member.age}"> --%>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="profilePath">프로필
									사진</label>
								<div class="col-sm-6">
									<input class="form-control" id="profilePath" name="profilePath"
										type="file" value="${member.profilePath}">
								</div>
							</div>
					

						<div class="form-group">

							<button id="mUpdateMember" onclick="memberUpdate();">수정</button>
							<button id="mDeleteMember" onclick="memberDelete();">탈퇴</button>
							<button id="back" onclick="memberMain();">뒤로가기</button>

						</div>

	</form>
					</div>

				</div>

			</div>
		</div>




	</div>
	<c:import url="../common/footer.jsp" />
	</div>
	<script>

		function memberDelete(){
		console.log("delete 클릭");
    		$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/deleteMember.do"); 
		/*  location.href = "${pageContext.request.contextPath}/myPage/deleteMember.do";  */
     	}
     	function memberUpdate() {
			/* $("#updateForm").submit(); */
				$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/updateMember.do");
		 	<%-- location.href = "<%=request.getContextPath()%>/mUpdate.me" --%>
		}
    	function memberMain(){
    			$('#updateForm').attr("action", "/myPage/myPageMain.do");
    		console.log("main클릭");
    	}
      </script>
</body>
</html>
