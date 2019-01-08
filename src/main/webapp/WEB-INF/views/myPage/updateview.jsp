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

						<form class="form-horizontal" id="updateForm" method="post" enctype = "multipart/form-data" onsubmit="return check()">
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
									<input type="hidden" name="mpwTest" value="${member.mpw }"/>
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
								<label class="col-sm-3 control-label" for="mnick">닉네임</label> 
								<div class="col-sm-6">
									<input class="form-control" id="mnick" name="mnick" type="text"
										value="${member.mnick}"placeholder="닉네임을 입력하세요">
										
								</div>
								<label id="checkNick"></label>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="email">이메일</label>
								<div class="col-sm-6">
									<input class="form-control" id="email" name="email"
										type="email" value="${member.email}"placeholder="이메일을 입력하세요">
								</div>
								<label id="checkemail"></label>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="gender">성별</label>

								<div class="col-sm-6">
									<input type="radio" name="gender" id="gender0" value="M" />남성
									<input type="radio" name="gender" id="gender1" value="F" />여성
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
								<label class="col-sm-3 control-label" for="">프로필</label>	
								<div class="col-sm-6">
									<img id = "imc" src="/resources/img/profiles/${member.profilePath}">
									<input class="form-check-input" id="profile" name="profile" onchange="readURL(this);"
										type="file" value="${member.profilePath}">
								</div>
							</div>
						<script> 
						
						$("#mnick").blur(function(){
							$.ajax({
								url : "${pageContext.request.contextPath}/myPage/nickCheck.do",

								data : {
									
									mnick : $('#mnick').val()
								},
								dataType : "json",
								success : function(data) {
									
									if(data.result==1){
										if(mnick.value == "${member.mnick}"){
											$('#checkNick').text("사용가능");	
										}else{
											$('#checkNick').text("사용불가");	
										}
									}else{
										if(mnick.value == ""){
											$('#checkNick').text("사용불가");
										}else{
											$('#checkNick').text("사용가능");	
										}
										
									}
									

								},
								error : function(e) {
									console.log("error" + data);
								}

							});
						});
						
						$("#email").blur(function(){
							$.ajax({
								url : "${pageContext.request.contextPath}/myPage/emailCheck.do",

								data : {
									
									email : $('#email').val()
								},
								dataType : "json",
								success : function(data) {
									if(data.result==1){
										if(email.value == "${member.email}"){
											$('#checkemail').text("사용가능");	
										}else{
											$('#checkemail').text("사용불가");	
										}
									}else{
										if(email.value == ""){
											$('#checkemail').text("사용불가");
										}else{
											$('#checkemail').text("사용가능");	
										}
										
									}
									

								},
								error : function(e) {
									console.log("error" + data);
								}

							});
						});
						
						
						function readURL(input) { 
							
								var reader = new FileReader(); 
								reader.onload = function (e) {
									$('#imc').attr('src', e.target.result); 
									} 
								reader.readAsDataURL(input.files[0]); } 
								
						
						function check(){
								
							var regNum = /[0-9]/g;
					     	var regEng = /[a-z]/ig;
					     	var pass= $('#mpw').val(); 
					   		var r = "";
					   		console.log("val : " + $('#mpw').val());
					   		
						   		if($('#mpw').val()!=""){
					
							     	if(!regNum.test(pass)||!regEng.test(pass)) {
							     		alert("숫자와 영문자를 입력하세요");
							     		return false
							     	}
							     	else if(pass.length<4||pass.length>16){
							     		alert("비밀번호 4~16자리를 입력하세요");
							     		return false
							     	}
						   		}else if(($('#checkNick').text()=="")||($('#checkemail').text()=="")){
						     		alert("값을 입력하세요");
						     		return false
						     	}
						   		
						     	else if($('#checkNick').text()=="사용불가"){
						     		alert("닉네임을 다시 설정하세요.");
						     		return false
						     	}else if($('#checkemail').text()=="사용불가"){
						     		alert("이메일을 다시 설정하세요.");
						     		return false
						     	}
					   				
					     			
					     			
					     	return true;
					   
						}
						</script>

						<div class="form-group">

							<button id="mUpdateMember" onclick="memberUpdate();">수정</button>
							<button id="mDeleteMember" onclick="memberDelete();">탈퇴</button>
							<button id="back" onclick="memberMain();">뒤로가기</button>

						</div>
						<script>
						 $('input[value=${member.age}]').attr('checked','true'); 
						 $('input[value=${member.gender}]').attr('checked','true'); 
						</script>
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
     	}
     	function memberUpdate() {
   
     	   $('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/updateMember.do");
 
		}
    	function memberMain(){
    			$('#updateForm').attr("action", "/myPage/myPageMain.do");
    	}
      </script>
</body>
</html>