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
table {
	text-align : center;
}
button[id*=Btn], button[name*=Btn]{ 
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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
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
						<c:if test="${list.size() gt 0}">
						<p style="font-size:20px; text-align: left;"><b>${list.get(0).getMName()}</b> 님의 권한입니다.</p>
						</c:if>
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
								<c:if test="${list.size() gt 0}">
									<tbody id="tb">
											<c:forEach var="a" begin="0" end="${list.size()-1}" step="1">
												<tr id="code${list.get(a).getACode()}">
													<td>${list.get(a).getMNo()}</td>
													<td>${list.get(a).getACode()}</td>
													<td>${list.get(a).getAName()}</td>
													<td>${list.get(a).getMName()}</td>
													<td>${list.get(a).getRequest_date()}</td>
													<c:set var="atake" value="${list.get(a).getATake()}"/>
													<c:set var="delflag" value="${list.get(a).getDelflag()}"/>
													<c:choose>
														<c:when test="${fn:contains(atake, 'N') and fn:contains(delflag, 'N')}">
															<td><button name="checkBtn">요청확인</button></td>
														</c:when>
														<c:when test="${fn:contains(atake, 'Y') and fn:contains(delflag, 'N')}">
															<td>부여됨</td>
														</c:when>
														<c:when test="${fn:contains(atake, 'N') and fn:contains(delflag, 'Y') }">
															<td style="color:red">거부됨</td>
														</c:when>
													</c:choose>
												</tr>
												<input type="hidden" value="${list.get(a).getMNick()}" id="mnick">
												<input type="hidden" value="${list.get(a).getACode()}" id="aCode">
											</c:forEach>
									</tbody>
								</c:if>
								<c:if test="${list.size() <= 0}">
									<script>
										alert('해당 회원의 권한이 존재하지 않습니다.');
										
										close();
									</script>
								</c:if>
							</table>
						</div>
						<div id="checkList">
						<form class="form-horizontal" id="request" method="post">
							<br><br>
							<div class="raw">
								<div class="form-group">
									<input type="radio" id="aCode1" name="aCode" value="1" /><label for="aCode1">작성권한</label>
									<input type="radio" id="aCode2"  name="aCode" value="2" /><label for="aCode2">파워링크</label>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label" for="request_Date">권한요청일</label>
								<div class="col-sm-6">
									<input class="form-control" id="reqDate" name="reqDate" readonly
										type="date" value="">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="mName">회원 이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="mName" name="mName" readonly
										type="text" value="">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="address" >주소</label>
								<div class="col-sm-6">
									<input type="text" style="width:98%;" id="address" value="" readonly/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="aContent">내용</label>
								<div class="col-sm-6">
									<textarea cols="30" rows="5" id="aContent" name="aContent" 
									style="width: 98%; resize:none;" maxlength="100" readonly></textarea>
								</div>
							</div>
							
							<div id="aCode2Div">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="img">대표 이미지</label>
									<div class="col-sm-6">
									<div class="mainImg"></div>
										<img id="mainImg" src="" alt=""/>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label" for="url">URL</label>
									<div class="col-sm-6">
										<a href="" id="siteUrl" target="_blank"></a>
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">

								<button id="grantBtn" onclick="grant();">승인</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="refuseBtn" onclick="refuse();">거절</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button name="reloadBtn" onclick="window.location.reload()">뒤로가기</button>

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
		
		var mNick = $('#mnick').val();
		var aCode = $('input[name^=aCode]:checked').val();
		
		if(checkResult){
			url = "grantAuthority.do?mnick="+mNick+"&acode="+aCode;
			
			opener.window.location = url;
			
			close();
		} else {
			alert("승인이 취소 되었습니다.")
		}

	}
	function refuse() {
		// 거절 사유 전달해서 쪽지 내용에 추가하기
		var content = window.prompt("거절 사유를 작성해 주세요.");
		var mNick = $('#mnick').val();
		var aCode = $('input[name^=aCode]:checked').val();
		
		if((content != null) && (content != "")){		
			url = "refuseAuthority.do?mnick="+mNick + "&content="+content+"&acode="+aCode
		
			opener.window.location = url;
			
			close();
		} else {
			alert("거절 사유는 필수 사항입니다.");
			refuse();
		} 
	}
	
	$('button[name=checkBtn]').click(function(){
		$('#checkList').show();
		$('.list').hide();
		
		var acode = $(this).parent().siblings().eq(1).text();
		var mno = $(this).parent().siblings().eq(0).text();
		
		$.ajax({
			url : "selectRequestOne.do",
			data : {
				mno : mno,
				acode : acode
			},
			success : function(data){
				
				var imgFile = data.img_file;
				var siteUrl = data.site_url;
				
				if(acode == 1){
					$('#aCode1').attr('checked', 'true');
					$('#aCode2').attr('disabled', 'true');
				} else {
					$('#aCode1').attr('disabled', 'true');
					$('#aCode2').attr('checked', 'true');
					
					if(imgFile != null){
						$('#mainImg').attr('src', '/resources/img/' + imgFile).css('border', '1px solid lightgray');
					} else {
						$('.mainImg').append('대표 이미지가 없습니다.');
					}
					$('#siteUrl').attr('href', siteUrl).text(siteUrl).css('color', 'black');
				}
				
				console.log();				
				
				$('#reqDate').attr('value', moment(data.request_date).format('YYYY-MM-DD'));
				$('#mName').attr('value', data.mname);
				$('#address').attr('value', data.address);
				$('#aContent').text(data.acontent);
				
			}, error : function(data){
				console.log("요청 정보 조회 실패!");
			}
		});
	});
	
	</script>
</body>
</html>
