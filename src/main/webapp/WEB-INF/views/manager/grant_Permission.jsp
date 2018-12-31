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
		<div class="container">

			<div class="col-md-10">
				<div class="container">

					<!-- 	<div class="container-fluid"> -->
					<div class="col-sm-8 text-center">
						<h1>
							<small>승인 페이지</small>
						</h1>
						<form class="form-horizontal" id="request" method="post">
							<div class="raw">
									<div class="form-group">
									<div class="btn-group">
										<c:if test="${autho.getACode() == 1}">
											<input type="radio" id="aCode1" name="aCode" value="1" checked/><label for="aCode1">작성권한</label>
										</c:if>
										<c:if test="${autho.getACode() == 2}">
											<input type="radio" id="aCode2"  name="aCode" value="2" checked/><label for="aCode2">파워링크</label>
										</c:if>
									</div>
								</div>
							
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="request_Date">권한요청일</label>
								<div class="col-sm-6">
									<input class="form-control" id="reqDate" name="reqDate" readonly
										type="date" value="${autho.getRequest_date()}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="mName">회원 이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="mName" name="mName" readonly
										type="text" value="${autho.getMName()}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="address" >주소</label>
								<div class="col-sm-6">
									<input type="text" style="width:98%;" value="${autho.getAddress()}" readonly/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="aContent">내용</label>
								<div class="col-sm-6">

									<textarea cols="30" rows="5" id="edited_title" name="aContent"
										name="aContent" style="width: 98%; resize:none;" maxlength="100">${autho.getAContent() }</textarea>
								</div>
							</div>
							
							<div class="form-group">

								<button id="grantAuthority" onclick="grant();">승인</button>
								<button id="refuseAuthority" onclick="refuse();">거절</button>

							</div>
						</form>
					</div>

				</div>

			</div>
		</div>

	</div>
	<script>
	
	var url = "";
	
		function grant() {
		
			/* $('#request').attr("action", "grantAuthority.do?mno=${autho.getMNo()}"); */
			
			url = "grantAuthority.do?mno=${autho.getMNo()}";
			
			opener.window.location = url;
			
			close();

		}
		function refuse() {
			// 거절 사유 전달해서 쪽지 내용에 추가하기
			var content = window.prompt("거절 사유를 작성해 주세요.");
			
			url = "refuseAuthority.do?mno=${autho.getMNo()}"
			
			opener.window.location = url;
			
			close();

		}
	</script>
</body>
</html>
