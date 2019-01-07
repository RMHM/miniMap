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
							<small>권한 요청</small>
						</h1>
						<form class="form-horizontal" id="request" method="post" enctype = "multipart/form-data" onsubmit="return check()">
							<div class="raw">
									<div class="form-group">
									<div class="btn-group">
	
										<input type="radio" id="aCode1" name="aCode" value="1" checked="checked"onclick="reperBtn();"/><label for="aCode1">작성권한</label>
										<input type="radio" id="aCode2"  name="aCode" value="2" onclick="powerBtn();"/><label for="aCode2">파워링크</label>
									</div>
								</div>
							
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="mName">회원 이름</label>
								<div class="col-sm-6">
									<input class="form-control" id="mName" name="mName" readonly
										type="text" value="${member.mname}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="address">주소</label> </label>
								<div class="col-sm-6">


									<input class="form-control" type="text" id="sample4_postcode" placeholder="우편번호"name="address" readonly>
									<input type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기"><br> <input type="text"
										id="sample4_roadAddress" name="address" placeholder="도로명주소">
									<!--  <input
									type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
									<span id="guide" style="color: #999; display: none"></span> <input
										type="text" id="sample4_detailAddress" name="address"
										placeholder="상세주소">
									<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="aContent">내용</label>
								</label>
								<div class="col-sm-6">

									<textarea cols="30" rows="5" id="edited_title" name="aContent"
										name="aContent" style="width: 98%;" maxlength="100"></textarea>
								</div>
							</div>
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
								//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
								function sample4_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var roadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ''; // 참고 항목 변수

													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraRoadAddr += (extraRoadAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraRoadAddr !== '') {
														extraRoadAddr = ' ('
																+ extraRoadAddr
																+ ')';
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById('sample4_postcode').value = data.zonecode;
													document
															.getElementById("sample4_roadAddress").value = roadAddr;
				
													var guideTextBox = document
															.getElementById("guide");
													// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
													if (data.autoRoadAddress) {
														var expRoadAddr = data.autoRoadAddress
																+ extraRoadAddr;
														guideTextBox.innerHTML = '(예상 도로명 주소 : '
																+ expRoadAddr
																+ ')';
														guideTextBox.style.display = 'block';

													} else if (data.autoJibunAddress) {
														var expJibunAddr = data.autoJibunAddress;
														guideTextBox.innerHTML = '(예상 지번 주소 : '
																+ expJibunAddr
																+ ')';
														guideTextBox.style.display = 'block';
													} else {
														guideTextBox.innerHTML = '';
														guideTextBox.style.display = 'none';
													}
												}
											}).open();
								}
							</script>

							<div class="form-group" id = "powerUrl" style="display:none">
								<label class="col-sm-3 control-label" for="site_url">사이트 주소</label>
								<div class="col-sm-6">
									<input class="form-control" id="site_url" name="site_url" style="display:none"
										type="url"  pattern="https://" value="">
								</div>
								
							
							</div>
							<div class="form-group" id = "powerImg">
								<label class="col-sm-3 control-label" for="reImg">대표 이미지</label>
								<div class="col-sm-6">
									<img id = "imc" src="/resources/img/authrity/">
									<input class="form-check-input" id="reImg" name="reImg" onchange="readURL(this);"
										type="file" value="">
								</div>
							</div>
							<script> 
							function reperBtn(){
								$('#powerUrl,#powerImg').attr("style","display:none");
							}
							function powerBtn(){
								$('#powerUrl,#powerImg').attr("style","display:block");
							}
							
							function readURL(input) { 
							
								var reader = new FileReader(); 
								reader.onload = function (e) {
									$('#imc').attr('src', e.target.result); 
									} 
								reader.readAsDataURL(input.files[0]); 
							}
							
							
							function check(){
								
								if(('#sample4_postcode').val==null){
								alert("주소를 입력하세요.");
								return false
								}else if($('#powerImg').val==null){
						     		alert("대표이미지를 등록하세요.");
						     		return false
								}else if($('#powerUrl').val==null){
									alert("사이트 주소를 작성하세요.")
								}
						     	
						     	return true;
						   
							}
							</script>

							
							<div class="form-group">

								<button id="mUpdateMember" onclick="request();">요청하기</button>

								<button id="back" onclick="back();">취소</button>

							</div>
						</form>
					</div>

				</div>

			</div>
		</div>




	</div>
	<c:import url="../common/footer.jsp" />
	</div>
	<script>
		function request() {
		
			$('#request')
					.attr("action",
							"${pageContext.request.contextPath}/myPage/rePermission.do");

		}
		function back() {
			$('#request').attr("action", "/myPage/myPageMain.do");

		}
	</script>
</body>
</html>
