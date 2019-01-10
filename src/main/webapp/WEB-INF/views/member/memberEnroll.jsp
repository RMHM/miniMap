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
		div#enroll-container {width:400px; margin:0 auto; text-align:center;}
		div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
		div#enroll-container table th {text-align: right; padding-right:10px;}
		div#enroll-container table td {text-align: left;}
		/*중복아이디체크관련*/
		div#userId-container {position:relative; padding:0px;}
		div#userId-container span.guide {display:none; font-size: 12px; position:absolute; top:12px; right:10px;}
		div#userId-container span.ok {color:green;}
		div#userId-container span.error, span.invalid {color:red;}
		div#userNick-container {position:relative; padding:0px;}
		div#userNick-container span.nick {display:none; font-size: 12px; position:absolute; top:12px; right:10px;}
		div#userNick-container span.o {color:green;}
		div#userNick-container span.e, span.i {color:red;}
		div#email-container {position:relative; padding:0px;}
		div#email-container span.email {display:none; font-size: 12px; position:absolute; top:12px; right:10px;}
		div#email-container span.o {color:green;}
		div#email-container span.e, span.i {color:red;}
		div#userPw-container {position:relative; padding:0px;}
		div#userPw-container span.pw {display:none; font-size: 12px; position:abosulte; top:12px; right:10px;}
		div#userPw-container span.o {color:green;}
		div#userPw-container span.e, span.i {color:red;}
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
									<span class="guide ok">사용 가능한 아이디</span>
				            		<span class="guide error">이미 사용중인 아이디</span>
				            		<span class="guide invalid">4글자 이상 입력</span>
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
								<input type="password" class="form-control" id="mpw2" required>
								<div class="check_font" id="pw2_check"></div>
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
								<div id="userNick-container">
								<input type="text" class="form-control" name="mnick" id="mnick_" required>
								<span class="nick o">사용 가능</span>
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
								<input type="email" class="form-control" placeholder="사용할 이메일 입력" name="email" id="email">
								<span class="email o">사용 가능</span>
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
							<th>업로드</th>
							<td>
							<img id="imc" src="/resources/img/profiles" />
							<input type="file" class="form-check-input" name="profile" id="profilePath_" 
								   value="">
							</td>
						</tr>
						
					</table>
					<input type="submit" class="btn btn-success" value="가입">
					<input type="reset"  class="btn btn-success" value="취소" onclick="loginForm()">
				</form>
			</div>
			<script src="/resources/js/member/memberEnroll.js"></script>
			<script>
				function loginForm(){
					location.href = "/";
					if (confirm("메인 페이지로 돌아가시겠습니까?") == true){ // yes
					} else {
						location.href = "/member/memberEnroll.go";
					}
				}
			</script>
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
			<!--  <script>
			// 비밀번호 정규식 : A~z, a~z, 0~9, 6~12자리
			var pw = /^[A-Za-z0-9]{6,12}$/; 
			
			// 이름 정규식
			// var nameJ = /^[가-힣]{2,6}$/;
			
			// 이메일 검사 정규식
			//var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			// 휴대폰 번호 정규식
			//var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
			
			// 1-1 정규식
				$("#mpw_").blur(function(){
					console.log(pw);
					console.log($('#mpw_').val());
					if(pw.test($('#mpw_').val())){
						console.log('true');
						$('#pw_check').text('');
					} else {
						console.log('false');
						$('#pw_check').text('숫자 or 대소문자로만 6자리이상 12자리 이하 입력 해주세요.');
						$('#pw_check').css('color', 'red'); 
					}
				});
				
				// 1-2 비밀번호 일치 확인
				$('#mpw2').blur(function(){
					if($('#mpw2').val() != $(this).val()){
					   $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
					   $('#pw2_check').css('color', 'red');
					} else {
						$('#pw2_check').text('');
					}
				});
				
				/* $("#mpw_").blur(function(){
					var mpw = $('#mpw_').val();
					
					$.ajax({
						url : "/member/checkPw.do",
						data : { mpw },
						dataType : "json",
						success : function(data){
							console.log("1 = 중복o / 0 = 중복x : "+ data);
							
							if (data == 1){
								// 1 : 비밀번호가 중복되는 문구
								$("#pw_check").text("사용중인 비밀번호 입니다.");
								$("#pw_check").css("color", "red");
								$("#submit").attr("disabled", true);
							} else {
								
							}
						}
					});
				});  */
			</script> -->
			<!-- 
			/* 닉네임 유효성 검사 */
			<script>
			var nick = /^[가-힣]{2,6}$/;
			
			$("#mnick_").blur(function(){
				if (nick.test($('#mnick_').val())){
					console.log('true');
					$('nick_check').text('');
				} else {
					console.log('false');	
					$('#nick_check').text('한글 2자리 이상 6자리 이하 입력해주세요.');
					$('#nick_check').css('color', 'red');
				} 
			});
			</script> 
			-->
			<script>
			$("#mpw_").on("keyup", function(){
				var mpw = $(this).val().trim();

				
				if (mpw.length < 6){
					$(".pw.e").hide();
					$(".pw.o").hide();
					$(".pw.i").show();
					return;
				} else {
					$.ajax({
							url : "/member/checkPw.do",
							data : { mpw : mpw },
							dataType : "json",
							success : function(data){
								console.log(data);
								if(data.isUsable==true){
									$(".pw.e").hide();
									$(".pw.i").hide();
									$(".pw.o").show();
									$("#pwCheck").val(1);
								} else {
									$(".pw.e").show();
									$(".pw.i").hide();
									$(".pw.o").hide();
									$("#pwCheck").val(0);
								}
							}, error : function(jqxhr, testStatus, errorThrown){
								console.log("ajax 처리 실패");
								
								console.log(jqxhr);
							}
						});
					}
			
					console.log(mpw);
				}); 
				
			</script>
			<script>
			$("#mnick_").on("keyup", function(){
				var mnick = $(this).val().trim();

				
				if (mnick.length < 2){
					$(".nick.e").hide();
					$(".nick.o").hide();
					$(".nick.i").show();
					return;
				} else {
					
					$.ajax({
							url : "/member/checkNick.do",
							data : { mnick : mnick },
							dataType : "json",
							success : function(data){
								console.log(data);
								if(data.isUsable==true){
									$(".nick.e").hide();
									$(".nick.i").hide();
									$(".nick.o").show();
									$("#nickCheck").val(1);
								} else {
									$(".nick.e").show();
									$(".nick.i").hide();
									$(".nick.o").hide();
									$("#nickCheck").val(0);
								}
							}, error : function(jqxhr, testStatus, errorThrown){
								console.log("ajax 처리 실패");
								
								console.log(jqxhr);
							}
						});
					}
			
					console.log(mnick);
				}); 
				
			</script>
			<script>
			$("#email").on("keyup", function(){
				var email = $(this).val().trim();

				
				if (email.length < 6){
					$(".email.e").hide();
					$(".email.o").hide();
					$(".email.i").show();
					return;
				} else {
					
					$.ajax({
							url : "/member/checkEmail.do",
							data : { email : email },
							dataType : "json",
							success : function(data){
								console.log(data);
								if(data.isUsable==true){
									$(".email.e").hide();
									$(".email.i").hide();
									$(".email.o").show();
									$("#emailCheck").val(1);
								} else {
									$(".email.e").show();
									$(".email.i").hide();
									$(".email.o").hide();
									$("#emailCheck").val(0);
								}
							}, error : function(jqxhr, testStatus, errorThrown){
								console.log("ajax 처리 실패");
								
								console.log(jqxhr);
							}
						});
					}
			
					console.log(email);
				}); 
			
			</script>
			
		</section>
		<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>