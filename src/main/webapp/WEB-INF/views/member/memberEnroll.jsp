<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입 페이지</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#enroll-container{width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th{text-align: right; padding-right:10px;}
		div#enroll-container table td{text-align: left;}
		/*중복아이디체크관련*/
		div#userId-container{position:relative; padding:0px;}
		div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		div#userId-container span.ok{color:green;}
		div#userId-container span.error, span.invalid{color:red;}
	</style>
</head>
<body>
	<div id="container">
		 <c:import url="/WEB-INF/views/common/exFile.jsp"/>
		<section id="content">
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return fn_enroll_validate();" enctype = multipart/form-data>
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<div id="userId-container">
									<input type="text" class="form-control" placeholder="사용할 아이디 입력" name="mid" id="mid_" required>
									<!-- 아이디중복검사 코멘트추가 -->
									<span class="guide ok">사용 가능</span>
				            		<span class="guide error">사용 불가</span>
				            		<span class="guide invalid">4글자 미만</span>
				            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
				            	</div>
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" class="form-control" placeholder="정규식은 아직 입니다." name="mpw" id="mpw_" required>
							</td>
						</tr>
						<tr>
							<th>패스워드확인</th>
							<td>	
								<input type="password" class="form-control" id="mpw2" required>
							</td>
						</tr>  
						<tr>
							<th>이름</th>
							<td>	
							<input type="text" class="form-control" name="mname" id="mname_" required>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
							<input type="text" class="form-control" name="mnick" id="mnick_" required>
							</td>
							<td>
							<a href="#" id="nickCheck" class="btn">중복확인</a>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>	
								<input type="email" class="form-control" placeholder="사용할 이메일 입력" name="email" id="email">
							</td>
							<td>
								<a href="#" id="emailCheck" class="btn">중복확인</a>
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
							<th>업로드</th>
							<td>
							<img id="imc" src="/resources/img/profiles/" />
							<input type="file" class="form-check-input" name="profile" id="profilePath_" 
								   value="">
							</td>
						</tr>
						
					</table>
					<input type="submit" class="btn btn-danger" value="가입" >
					<input type="reset"  class="btn btn-danger" value="취소">
				</form>
			</div>
			<script src="/resources/js/member/memberEnroll.js"></script>
			<script> 
				// 파일 업로드, 미리보기
				function readURL(input){
				
					if (input.files && input.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e) {
						$('#imc').attr('src', e.target.result);
					
					}
					
					reader.readAsDataURL(input.files[0]);
					}
				}
				
					$("#profilePath_").change(function() {
						readURL(this);
					});
			</script>
			<script>
			function checkPassword(){
				var check = /^[A-Za-z0-9{6,12}$]/;
				
				if (!check.test($("input[id='mpw_']").val())){
					// 경고
					return false;
				}
				
			}
				
			</script>
		</section>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>