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
<title>로그인 페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		<section id="loginForm">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4><b>로그인</b></h4>
						<form action="/member/memberLogin.do" method="post" role="form" class="contactForm">
							<div class="form-group">
								<input type="text" class="form-control" id="mId" placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="mPw" placeholder="비밀번호를 입력하세요">
							</div>
							<div class="text-center">
								<input type="submit" value="로그인" id="btLogin" class="btn btn-theme">
								<input type="button" value="ID/PW 찾기" id="btFind" class="btn bnt-theme">
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>