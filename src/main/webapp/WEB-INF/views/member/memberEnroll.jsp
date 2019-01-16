<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
	<c:import url="../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css">
</head>
<body>
	<div id="container">
		 <c:import url="/WEB-INF/views/common/exFile.jsp"/>
		<section id="content">
			<div id="enroll-container">
        <div>
			<h1 align="left" style="font-size:60px; margin:-50px 0px 0px 0px"><font color="skyblue"><b>SIGN UP</b></font></h1>
			<p align="left">가입에 필요한 회원정보를 입력해 주세요. <img src="/resources/img/member/ico_required.png" alt="필수" /><b> 필수 입력</b></p>
			<hr />
			</div>
				<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" enctype = multipart/form-data onsubmit="return check();"
							onkeydown="return captureReturnKey(event)">
							
					<table height="50" border="1" >
					<colsgroup><col style="width:250px;"><col style="width:auto;">
					</colsgroup>
					<tbody>

						<tr>
							<th style = "text-align:center;">아이디 <img src="/resources/img/member/ico_required.png" alt="필수" /></th>
							
							<td>
								<div id="userId-container">
                  <input type="text" autofocus class="form-control" placeholder="사용할 아이디 입력" name="mid" id="mid_" required oninvalid="this.setCustomValidity('숫자, 대소문자 혼용 6자이상 입력바랍니다.')" oninput="setCustomValidity('')" >
									<div class="check_font" id="id_check" ></div>
									<!-- 아이디중복검사 코멘트추가 -->
									<span class="guide ok">사용 가능한 아이디</span>
				            		<span class="guide error">이미 사용중인 아이디</span>
				            		<span class="guide invalid">6글자 이상 입력</span>
				            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				       
				            	</div>
							</td>
						</tr>
						<tr>
							<th style = "text-align:center;">패스워드 <img src="/resources/img/member/ico_required.png" alt="필수" /></th>
							<td>
							   <div id="userPw-container">
								<input type="password" class="form-control" name="mpw" id="mpw_" required>
								<div class="check_font" id="pw_check"></div>
								<span class="pw o">사용 가능한 비밀번호</span>
				            	<span class="pw e">이미 사용중인 비밀번호</span>
				            	<span class="pw i">6글자 이상 입력</span>
				            	<input type="hidden" name="pwCheck" id="pwCheck" value="0" />
				            	</div>
							</td>
						</tr>
						<tr>
							<th style = "text-align:center;">패스워드 확인 <img src="/resources/img/member/ico_required.png" alt="필수" /></th>
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
							<th style = "text-align:center;">이름 <img src="/resources/img/member/ico_required.png" alt="필수" /></th>
							<td>	
							<div id="userName-container">
							<input type="text" class="form-control" name="mname" id="mname_" required>
							<div class="check_font" id="name_check"></div>
							<span class="name o"></span>
							<span class="name e"></span>
							<span class="name i"></span>
							<input type="hidden" name="nameCheck" id="nameCheck" value="0"/>
							
							</div>
							</td>
						</tr>
						<tr>
							<th style = "text-align:center;">닉네임 <img src="/resources/img/member/ico_required.png" alt="필수" /></th>
							<td>
								<div id="userNick-container">
								<input type="text" class="form-control" name="mnick" id="mnick_" required>
								<div class="check_font" id="nick_check"></div>
								<span class="nick o">사용 가능한 닉네임</span>
					            <span class="nick e">사용중인 닉네임 </span>
					            <span class="nick i">2글자 이상 입력</span>
					            <input type="hidden" name="nickCheck" id="nickCheck" value="0"/>
								</div>
							</td>
							
							
						</tr>
						<tr>
							<th style = "text-align:center;">이메일 <img src="/resources/img/member/ico_required.png" alt="필수" /></th>
							<td>	
								<div id="email-container">
								<input type="email" class="form-control" placeholder="사용할 이메일 입력" name="email" id="email" required>
								<div class="check-font" id="email_check"></div>
								<span class="email o">사용 가능한 이메일</span>
					            <span class="email e">사용중인 이메일</span>
					            <span class="email i">6글자 이상 입력</span>
					            <input type="hidden" name="emailCheck" id="emailCheck" value="0"/>
								</div>
							</td>
							
						</tr>
						<tr>
							<th style = "text-align:center;">회원 유형</th>
							<td style = "text-align:center;">
							<input type="radio" class="form-check-input" name="mtype" value="M" checked/>일반회원
							<input type="radio" class="form-check-input" name="mtype" value="C" />기업회원
							</td>
						</tr>
						<tr>
							<th style = "text-align:center;">성별 </th>
							<td style = "text-align:center;">
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" name="gender" id="gender0" value="M" checked>
									<label for="gender0">남</label>
									<input type="radio" class="form-check-input" name="gender" id="gender1" value="F">
									<label for="gender1">여</label>
								</div>
							</td>
						</tr>
						<tr>
							<th style = "text-align:center;">연령대</th>
							<td style = "text-align:center;">	
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
							<th style = "text-align:center;">업로드</th>
							<td>
							<img id="imc" src="" style="height:50"/>
              <img id="imc" src="" style="height:50%"/>
							<input type="file" class="form-check-input" name="profile" id="profilePath_" 
								   value="/resources/img/profiles/default.png" accept=".gif, .jpg, .png .jpeg">
							</td>
						</tr>
						</tbody>
					</table>
					<br />
				<input type="submit" class="btn btn-dark" value="가입" onclick="check()" style= "width: 80px; "border-radius:100px; font-s" ">
				<input type="reset"  class="btn btn-dark" value="취소" onclick="loginForm()" style= "width: 80px; "border-radius:100px;">	
				</form>
				
			</div>
      <script src="/resources/js/member/memberEnroll.js"></script>			
		</section>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>