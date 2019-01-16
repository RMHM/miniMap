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
<style>
span.guide { font-size: 11px; position:absolute; top:20%; right:5%;}
.ok{
display : none;
color:#0431B4;
}
.error{
display : none;
color:#FF8000;
}
}
</style>
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
										value="${member.mnick}"placeholder="닉네임을 입력하세요" required>
										<span id = "nickx"class="guide error nick" >사용불가</span>
										<span id="nicko"class="guide ok nick" >사용가능</span>
								</div>
								<label id="checkNick"></label>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="email">이메일</label>
								<div class="col-sm-6">
									<input class="form-control" id="email" name="email"
										type="email" value="${member.email}"placeholder="이메일을 입력하세요" required>
										<span id = "emailx" class="guide error email" >사용불가</span>
										<span id= "emailo"class="guide ok email" >사용가능</span>
										
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
								<!-- <div class=" col-sm-6">
								<button type="button" id="defa" >기본이미지</button>
								</div> -->
								
								<div class="col-sm-6">
								
                  <img id = "imc" src="/resources/img/profiles/${member.profilePath}" width="10%" heigh="10%">
									<input class="form-check-input" id="profile" name="profile" onchange="readURL(this);"
										type="file" value="${member.profilePath}">	
								</div>
								<div class="form-group">
								
								<div class="col-sm-6">
								
								</div>
								<div class="form-group">
								
								<div class="col-sm-6">
								
								</div>
							</div>
						<script> 
						$('#defa').click(function(){
              $('#imc').attr('src','/resources/img/profiles/default.png');
						});
						$("#mnick").blur(function(){
							if($('#mnick').val()==""){
								$('#nicko').hide();
								$('#nickx').show();	
							}else{
							$.ajax({
								url : "${pageContext.request.contextPath}/myPage/nickCheck.do",

								data : {
									
									mnick : $('#mnick').val()
								},
								dataType : "json",
								success : function(data) {
									
									if(data.result==1){
									 	if(mnick.value == "${member.mnick}"){
											$('#nickx').hide();
											$('#nicko').show();
										
									 	
									 	}else{
											$('#nicko').hide();
											$('#nickx').show();	
										}
									}else{
										$('#nickx').hide();
										$('#nicko').show();
									}
								
								},
								error : function(e) {
									console.log("error" + data);
								}

							});
							}
						});
					
						$("#email").blur(function(){
							
							var eref = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]{3,9}.[a-zA-Z]{2,3}$/i;
							
							if($('#email').val()==""){
								$('#emailo').hide(); 
								$('#emailx').show();
								
							}else{
							
								
								if(eref.test($("#email").val())){
									$.ajax({
										url : "${pageContext.request.contextPath}/myPage/emailCheck.do",

										data : {
											
											email : $('#email').val()
										},
										dataType : "json",
										success : function(data) {
											if(data.result==1){
												if(email.value == "${member.email}"){
													$('#emailx').hide();
													$('#emailo').show();
												}else{
											 	$('#emailo').hide(); 
												$('#emailx').show();
												}
											}else{
												$('#emailx').hide();
												$('#emailo').show();
											}
										},
										error : function(e) {
											console.log("error" + data);
										}

									});
								}else{
									$('#emailo').hide(); 
									$('#emailx').show();
								}
							
							}
						});
						
						
						function readURL(input) { 
							console.log("input"+input);
								console.log($('#defa').click);
							
								var reader = new FileReader(); 
								reader.onload = function (e) {
									$('#imc').attr('src', e.target.result); 
									} 
								reader.readAsDataURL(input.files[0]); 
							console.log("read : " + reader.readAsDataURL(input.files[0]));		
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

</div></div>


	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>
	  function check(){
		
			var regNum = /[0-9]/g;
	     	var regEng = /[a-z]/ig;
	     	var pass= $('#mpw').val(); 
	     
	   		var r = "";
		   		if($('#mpw').val()!=""){
	
			     	if(!regNum.test(pass)||!regEng.test(pass)) {
			     		alert("숫자와 영문자를 입력하세요");
			     		return false
			     	}
			     	else if(pass.length<4||pass.length>16){
			     		alert("비밀번호 4~16자리를 입력하세요");
			     		return false
			     	}
		   		}else if($('#checkNick').text()=="사용불가"){
		     		alert("닉네임을 다시 설정하세요.");
		     		return false
		     	}else if($('#checkemail').text()=="사용불가"){
		     		alert("이메일을 다시 설정하세요.");
		     		return false
		     	}

	     	
				return true;
		
	
		
		
	}
		function memberDelete(){
		console.log("delete 클릭");
		if(confirm("탈퇴 하시겠습니까?")) {
			$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/deleteMember.do"); 
         }else{
        	 return false;
         }
			
     	}
     	function memberUpdate() {
     		 
     		if(confirm("수정 하시겠습니까?")) {
     			$('#updateForm').attr("action", "${pageContext.request.contextPath}/myPage/updateMember.do");
             }else{
            	 return false;
            }
     	   
 
		}
    	function memberMain(){
    		if(confirm("수정을 취소하시겠습니까?")) {
    			$('#updateForm').attr("action", "/myPage/myPageMain.do");
             }else{
            	 return false;
            }
    			
    	}
      </script>
</body>
</html>