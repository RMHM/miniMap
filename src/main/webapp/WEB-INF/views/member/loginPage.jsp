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
<!--
 	구글 소셜 로그인시 활용 
 <meta name="google-signin-scope" content="profile email">
 <meta name="google-signin-client_id" content="919250358333-6tcbkn54dfekrnsjv762k08dtobul7iv.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
-->
<title>로그인 페이지</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp"/>
		<section id="loginForm">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<h4><b>로그인</b></h4>
						<form action="/member/memberLogin.do" method="post" role="form" class="contactForm">
							<div class="form-group">
								<input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="mpw" id="mpw" placeholder="비밀번호를 입력하세요">
							</div>
							<div class="text-center">
								<input type="submit" value="로그인" id="btLogin" class="btn btn-theme btn-large">
                <input type="button" value="ID/PW 찾기" id="btFind" class="btn bnt-theme btn-large">
                  <!--
                    구글 소셜 로그인 버튼 생성 
                    <div class="g-signin2 btn" data-onsuccess="onSignIn" data-theme="dark">구글구글</div>
                  -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
<script src="/resources/js/member/loginPage.js"></script>
</html>