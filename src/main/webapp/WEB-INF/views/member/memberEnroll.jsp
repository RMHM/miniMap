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
<title>회원가입 페이지</title>

</head>
<body>
   <c:import url="/WEB-INF/views/common/exFile.jsp"/>
   <div id="wrapper">
      <c:import url="/WEB-INF/views/common/header.jsp"/>
    
      	<div class="container">
      			<div class="col-md-6 col-md-offset-3">
                <h3>회원가입 Form</h3>
                </div>
      	
      	<div class="col-sm-6 col-md-offset-3">
                <form action="/member/memberEnrollEnd.do" method="post">
                    <table>
                    <div class="form-group">
                        <label for="mid">아이디</label>
                        <input type="text" class="form-control"  name="mid" id="mid_" placeholder="사용하실 아이디를 입력하세요.">
      				</div>
      				
      				<div class="form-group">
      					<label for="mpw">비밀번호</label>
      					<input type="text" class="form-control" name="mpw" id="mpw_" placeholder="비밀번호를 입력하세요." />
      				</div>
      				
      				<div class="form-group">
      					<label for="mpw">비밀번호 확인</label>
      					<input type="text" class="form-control" id="mpw2" placeholder="비밀번호를 확인을 위해 다시한번 입력하세요." />
      				</div>
      				
      				<div class="from-group">
      					<label for="mname">이름</label>
      					<input type="text" class="form-control" id="mname" placeholder="이름을 입력하세요." />
      				</div> 
      				
      				 <br>
      				 
      				<div class="from-group">
      					<label for="mnick">닉네임</label>
      					<input type="text" class="form-control" id="mnick" placeholder="닉네임을 입력하세요." />
      				</div> 
      				
      				<br>
      				
      				<div class="from-group">
      					<label for="email">이메일</label>
      					<input type="text" class="form-control" id="email" placeholder="이메일 주소를 입력하세요." />
      				</div>
      				
      				<br>
      				
      				<div class="from-group">
      					<label for="mtype">회원유형</label> <br>
      					<input type="radio" name="member" value="일반" />일반회원
      					<input type="radio" name="member" value="기업" />기업회원
      				</div>
      				
      				<br>
      				
      				<div class="from-group">
      					<label for="gender">성별</label> <br>
      					<input type="radio" name="gender" value="M" />남성
      					<input type="radio" name="gender" value="F" />여성
      				</div>
      				 				
      				<br>
      				
      				<div class=from-group">
      					<label for="age">연령대</label> <br>
      					<input type="radio" name="age" value="10" />10대
      					<input type="radio" name="age" value="20" />20대
      					<input type="radio" name="age" value="30" />30대
      					<input type="radio" name="age" value="40" />40대
      				</div>
      				
      				<div class="from-group"> <br>
      					<label for="profilePath">이미지경로</label>
      					<input type="file" />
      				
      				</div>
      				
      				<br /><br />
      				</table>
      				<input type="submit" class="btn btn-success" value="회원가입" /> 
      				<input type="reset" class="btn btn-danger" value="이전으로" />
      	</form>
      	</div>
      	</div>
      	
      	<br>

      <c:import url="/WEB-INF/views/common/footer.jsp"/>
   </div>

</body>
</html>