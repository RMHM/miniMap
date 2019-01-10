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
<style>
button[id*=Btn], button[name*=Btn] { 
   border : 1px solid lightgray;
   background : rgba(218, 218, 218, 0.623);
}

button:hover {
    border : 1px solid rgba(119, 188, 224, 0.623);
    background : rgba(128, 202, 241, 0.568);
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

</head>

<body>
	<!-- 외부파일 선언 -->
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	
	<div id="wrapper" align="center">
		<div class="container">
			<div class="col-md-10">
				<div class="container-fluid">
					<div class="row">
						<div class="list">
						<br><br>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>신고자</th>
										<th>신고내용</th>
										<th>신고날짜</th>
									</tr>
								</thead>
									<tbody id="tb" align="center">
											<c:forEach var="r" begin="0" end="${report.size()-1}" step="1">
												<tr>
													<td style="display:none">${report.get(r).getMno()}</td>
													<td>${report.get(r).getRep_mid()}</td>
													<td>${report.get(r).getRdetail()}</td>
													<td>${report.get(r).getRDate()}</td>
												</tr>
											</c:forEach>
									</tbody>
							</table>
							<div class="form-group">
								<br>
								<button id="clearBtn" onclick="clearBlackList();">해제</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="resetBtn" onclick="resetBlackList();">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
	var url = "";

	function clearBlackList() {

		var checkResult = window.confirm("해당 회원을 블랙리스트에서 해제 하겠습니까?");
		var mno = $('#tb:first td').eq(0).text();
		
		if(checkResult){
			url = "clearBlackList.do?mno="+mno;

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
