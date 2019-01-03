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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager/manager.css">
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
							<small>블랙리스트 해제</small>
						</h1>
						<form class="form-horizontal" id="request" method="post">
							<div class="raw">
									<div class="form-group">
									<div class="btn-group">
										<label for="reason">정지 사유</label>
										<input type="text" class="form-control" id="reason" name="reason" value="${black.getReason()}" readonly/>
									</div>
								</div>
							
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="request_Date">정지 기간</label>
								<div class="col-sm-6">
									<input class="form-control" id="endDate" name="endDate" readonly
										type="date" value="${black.getEndDate()}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="mName">회원 이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="mName" name="mName" readonly
										type="text" value="${black.getMname()}">
								</div>
							</div>
							
							
								<div class="form-group">
									<label class="col-sm-3 control-label" for="aContent">상세내용</label>
									<div class="col-sm-6">
										<c:if test="${not empty black.getRdetail()}">
											<textarea cols="30" rows="5" id="edited_title" name="rDetail"
											name="rDetail" style="width: 98%; resize:none;" maxlength="100">${black.getRdetail()}</textarea>
										</c:if>
										<c:if test="${empty black.getRdetail()}">
											<textarea cols="30" rows="5" id="edited_title" name="rDetail"
											name="rDetail" style="width: 98%; resize:none;" maxlength="100">상세 신고 내용이 없습니다.</textarea>
										</c:if>
									</div>
								</div>
							
							<div class="form-group">

								<button id="clearBtn" onclick="clearBlackList()">해제</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="resetBtn" onclick="resetBlackList()">취소</button>

							</div>
						</form>
					</div>

				</div>

			</div>
		</div>

	</div>
	<script>
	var url = "";

	function clearBlackList() {

		var checkResult = window.confirm("${black.getMid()} 회원을 블랙리스트에서 해제 하겠습니까?");
		
		if(checkResult){
			url = "clearBlackList.do?mno=${black.getMno()}";
			
			opener.window.location = url;
			
			close();
			
		} else {
			alert("취소 되었습니다.")
			url = "managerPage.go"
			opener.window.location = url;
			close();
		}

	}

	function resetBlackList() {
		alert("취소 되었습니다.")
		url = "managerPage.go"
		
		opener.window.location = url;
		
		close();

	}
	</script>
</body>
</html>
