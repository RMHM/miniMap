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
<title>회원 정보 페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<nav style="float: left; width: 100px; height: auto;">
			<a href="#">쪽지</a><br /> <a
				href="${pageContext.request.contextPath}/myPage/myPageMain.do">정보수정</a><br />
			<a href="#">일정관리</a><br /> <a href="#">지도</a><br /> <a href="#">작성한글</a>
			<br /> <a href="#">권한요청(기업)</a>

		</nav>
		<section class="callaction">
		<div>
		<form name="updateForm" id="updateForm"
			<%-- action="${pageContext.request.contextPath}/myPage/updateMember.do" --%>
			method="post">

			<div class="form-group">
				<label for="mid">아이디</label> <input type="text" class="form-control"
					name="mid" id="mid_" value="${member.mid}" readonly required>
			</div>

			<div class="form-group">
				<label for="mpw">비밀번호</label> <input type="password"
					class="form-control" name="mpw" id="mpw_"
					placeholder="비밀번호를 입력하세요." />
			</div>


			<div class="from-group">
				<label for="mname">이름</label> <input type="text"
					class="form-control" name="mname" id="mname"
					value="${member.mname}" placeholder=" 이름을 입력하세요." />
			</div>

			<br>

			<div class="from-group">
				<label for="mnick">닉네임</label> <input type="text"
					class="form-control" name="mnick" id="mnick"
					value="${member.mnick}" placeholder=" 닉네임을 입력하세요." />
			</div>

			<br>

			<div class="from-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control" name="email" id="email"
					value="${member.email}" placeholder=" 이메일 주소를 입력하세요." />
			</div>

			<br>

			<div class="from-group">
				<label for="gender">성별</label> <br> <input type="radio"
					name="gender" value="M" />남성 <input type="radio" name="gender"
					value="F" />여성
				<script>
					
				</script>
			</div>

			<br>

			<div class=from-group">
				<label for="age">연령대</label> <br> <input type="radio"
					name="age" value="10" />10대 <input type="radio" name="age"
					value="20" />20대 <input type="radio" name="age" value="30" />30대
				<input type="radio" name="age" value="40" />40대
			</div>

			<div class="from-group">
				<br> <label for="profilePath">이미지경로</label> <input type="file"
					name="profilePath" value="${member.profilePath}" />

			</div>

			<br /> <br /> 
			<div class="form-group">
							<div class="col-sm-3">
								<div align="center"  class="col-sm-6">
								<br>
									<button class="btn btn-primary" onclick="memberUpdate();">정보
										수정</button>
									<button class="btn btn-danger" onclick="memberDelete();">회원
										탈퇴</button>
									<button class="btn btn-danger" onclick="memberMain();">
										뒤로가기</button>
								</div>
							</div>
					
					</div>

		</form>
		</div>
		</section>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>

		function memberDelete(){
		console.log("delete 클릭");
    		$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/deleteMember.do");
	<%-- 	location.href = "<%=request.getContextPath()%>/mDelete.me"; --%>
     	}
     	function memberUpdate() {
			/* $("#updateForm").submit(); */
				$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/updateMember.do");
		 	<%-- location.href = "<%=request.getContextPath() %>/mUpdate.me" --%>
		}
    
    	function memberMain(){
    			$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/myPageMain.jsp");
    		console.log("main클릭");
    	}

		
      </script>
</body>
</html>