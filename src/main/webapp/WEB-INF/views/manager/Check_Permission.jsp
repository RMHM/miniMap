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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
</head>

<body>
	<!-- 외부파일 선언 -->
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	
	<div id="wrapper">
		<div class="container">
			<div class="col-md-10">
				<div class="container-fluid">
					<div class="row">
						<div class="list">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>회원번호</th>
										<th>권한분류</th>
										<th>요청권한</th>
										<th>요청자</th>
										<th>요청날짜</th>
										<th>요청확인</th>
									</tr>
								</thead>


								<tbody id="tb">
										<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">
											<tr id="code${list.get(a).getACode()}">
												<td>${list.get(a).getMNo()}</td>
												<td>${list.get(a).getACode()}</td>
												<td>${list.get(a).getAName()}</td>
												<td>${list.get(a).getMName()}</td>
												<td>${list.get(a).getRequest_date()}</td>
												<td><button name="checkBtn">요청확인</button></td>
											</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="checkList">
						<form class="form-horizontal" id="request" method="post">
							<div class="raw">
									<div class="form-group">
									<div class="btn-group">
									<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">
										<c:if test="${list.get(a).getACode() == 1}">
											<input type="radio" id="aCode1" name="aCode" value="1" checked/><label for="aCode1">작성권한</label>
										</c:if>
										<c:if test="${list.get(a).getACode() == 2} }">
											<input type="radio" id="aCode2"  name="aCode" value="2" checked/><label for="aCode2">파워링크</label>
										</c:if>
									</c:forEach>
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
										name="aContent" style="width: 98%; resize:none;" maxlength="100" readonly>${autho.getAContent() }</textarea>
								</div>
							</div>
							<div class="form-group">

								<button id="grantBtn" onclick="grant();">승인</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="refuseBtn" onclick="refuse();">거절</button>

							</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
<script>
	var url = "";
	
	$(document).ready(function(){
		$('#checkList').hide();
	});
	
	function grant() {

		var checkResult = window.confirm("승인하겠습니까?");
		
		if(checkResult){
			url = "grantAuthority.do?mnick=${autho.getMNick()}";
			
			opener.window.location = url;
			
			close();
		} else {
			alert("승인이 취소 되었습니다.")
		}

	}
	function refuse() {
		// 거절 사유 전달해서 쪽지 내용에 추가하기
		var content = window.prompt("거절 사유를 작성해 주세요.");
		
		url = "refuseAuthority.do?mnick=${autho.getMNick()}&content="+content
		
		opener.window.location = url;
		
		close();

	}
	
	$('button[name=checkBtn]').click(function(){
		$('#checkList').show();
		$('.list').hide();
		
		console.log("test : " + $(this).parent().siblings().eq(1).text());
		
	});
	
	</script>
</body>
</html>
