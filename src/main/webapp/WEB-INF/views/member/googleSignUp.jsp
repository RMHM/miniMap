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
<title>구글</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp"/>
	<div id="wrapper">
		<div class="container">
			<h1 align="center">구글구글회원회원가입가입</h1>
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="/member/memberEnrollEnd.do" method="post" enctype = multipart/form-data>
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<div id="userId-container">
									<input type="text" class="form-control" placeholder="사용할 아이디 입력" name="mid" id="mid_" value="${gEmail}" readonly required>
									<div class="check_font" id="id_check"></div>
									<!-- 아이디중복검사 코멘트추가 -->
									<span class="guide ok">사용 가능한 아이디</span>
				            		<span class="guide error">이미 사용중인 아이디</span>
				            		<span class="guide invalid">6글자 이상 입력</span>
				            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				       
				            	</div>
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
							   <div id="userPw-container">
								<input type="password" class="form-control" name="mpw" id="mpw_" required>
								<div class="check_font" id="pw_check"></div>
								<span class="pw o">사용 가능한 비밀번호</span>
				            	<span class="pw e">이미 사용중인 비밀번호</span>
				            	<span class="pw i">6글자 이상 입력</span>
				            	<input type="hidden" name="pwCheck" id="pwCheck" value="0"/>
				            	</div>
							</td>
						</tr>
						<tr>
							<th>패스워드확인</th>
							<td>
								<div id="userPw2-container">	
								<input type="password" class="form-control" id="mpw2" required>
								<div class="check_font" id="pw2_check"></div>
								<span class="pw2 o">사용 가능한 비밀번호</span>
				            	<span class="pw2 e">이미 사용중인 비밀번호</span>
				            	<span class="pw2 i">6글자 이상 입력</span>
				            	<input type="hidden" name="pw2Check" id="pw2Check" value="0"/>
				            	</div>
							</td>
						</tr>  
						<tr>
							<th>이름</th>
							<td>	
							<input type="text" class="form-control" name="mname" id="mname_" value="${gName}" readonly required>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<div id="userNick-container">
								<input type="text" class="form-control" name="mnick" id="mnick_" required>
								<div class="check_font" id="nick_check"></div>
								<span class="nick o">사용 가능한 닉네임</span>
					            <span class="nick e">사용중인 닉네임 </span>
					            <span class="nick i">2글자 이상 입력</span>
					            <input type="hidden" name="nickCheck" id="nickCheck" value="0"/>
								<div class="check_font" id="nick_check"></div>
								</div>
							</td>
							
							
						</tr>
						<tr>
							<th>이메일</th>
							<td>	
								<div id="email-container">
								<input type="email" class="form-control" placeholder="사용할 이메일 입력" name="email" id="email" value="${gEmail}" readonly>
								<div class="check-font" id="email_check"></div>
								<span class="email o">사용 가능한 이메일</span>
					            <span class="email e">사용중인 이메일</span>
					            <span class="email i">6글자 이상 입력</span>
					            <input type="hidden" name="emailCheck" id="emailCheck" value="0"/>
								</div>
							</td>
							
						</tr>
						<tr>
							<th>회원 유형</th>
							<td>
							<input type="radio" class="form-check-input" name="mtype" value="M" checked/>일반회원
							<input type="radio" class="form-check-input" name="mtype" value="C" />기업회원
							</td>
						</tr>
						<tr>
							<th>성별 </th>
							<td>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" checked>
									<label for="gender0">남</label>
									<input type="radio" class="form-check-input" name="gender" id="gender1" value="F">
									<label for="gender1">여</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>연령대</th>
							<td>	
								<input type="radio" class="form-check-input" name="age" value="10" checked>
								<label for="age0">10대</label>
								<input type="radio" class="form-check-input" name="age" value="20">
								<label for="age0">20대</label>
								<input type="radio" class="form-check-input" name="age" value="30">
								<label for="age0">30대</label>
								<input type="radio" class="form-check-input" name="age" value="40">
								<label for="age0">40대</label>
							</td>
						</tr> 
						<tr>
							<%-- <th>업로드</th>
							<td>
							<img id="imc" src="" style="height:40%"/>
							<input type="file" class="form-check-input" name="profile" id="profilePath_" 
								   value="${gImg}" accept=".gif, .jpg, .png .jpeg" >
							</td> --%>
							<input type="hidden" name="path" value="${gImg}">
						</tr>
						
					</table>
					<input type="submit" class="btn btn-success" value="가입">
					<input type="reset"  class="btn btn-success" value="취소" onclick="loginForm()">
				</form>
			</div>
		</div>
	</div>
</body>
<script src="/resources/js/member/memberEnroll.js"></script>
</html>