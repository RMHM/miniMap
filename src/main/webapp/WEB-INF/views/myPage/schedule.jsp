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

<c:import url="../common/exFile.jsp" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">


<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
.modal-content{
	width : 60%;
}
</style>


</head>
<body>
	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<div class="container">
			<c:import url="../common/myPageNav.jsp" />
			<div class="col-md-10">
        <div align="center" id= "loadingdiv">
				<img src="/resources/img/loading.gif" id="loading" style="width : 250px;height : 250px;">
				</div>
				<div id='calendar'></div>

				<form id="formAction" action="insertSchedule.do" method="post" onsubmit="return scheduleTest();">
					<div class="modal fade" id="test" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true" >
						<div class="modal-dialog" role="document" >
							<div class="modal-content" >
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">일정 등록
									<button type="button" class="modal-title close"
										data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button></h5>
								</div>
								<div class="modal-body">
								<div style="text-align: left;">
								<input type="hidden" id="sId" name="sId">
								</div>
									<div>
										<label>제목</label><input type="text" id="sTitle" name="sTitle"></input>
									</div>
									<div>
										<div>
											<label>메모</label>
											<div>
												<textarea cols="30" rows="5" id="sContent" name="sContent"
													name="scontent" style="width: 100%;" maxlength="100"></textarea>
											</div>
										</div>
									</div>

									<div>
										<label>날짜</label> <input type="date" id="startDateT"
											name="startDateT" style="width: auto;"
											class="ed hasDatepicker">~<input type="date"
											id="endDateT" name="endDateT" min="2019-01-05"
											style="width: auto; margin-bottom: 4px;"
											class="ed hasDatepicker">
									</div>
									<div style="clear: both;"></div>
									<div>
										<label> 색상 선택 </label><input type="color" id="sColor"
											name="sColor">
									</div>
								</div>
								<div id="result" class="modal-footer">
									<input  type="submit" value="등록"
										class="btn btn-primary">
									<button class="btn btn-secondary" data-dismiss="modal">
										취소</button>
								</div>
								<div class="modal-footer" id="updateresult"
									style="display: none">
									<input id="update" type="submit" class="btn btn-primary"
										value="수정" onclick="updateS();"> <input type="submit"
										id="del" class="btn btn-primary" value="삭제"
										onclick="deleteS();">
									<button class="btn btn-secondary" data-dismiss="modal">
										취소</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp" />
	<script src="/resources/js/myPage/myPageSchedule.js"></script>
</body>
</html>