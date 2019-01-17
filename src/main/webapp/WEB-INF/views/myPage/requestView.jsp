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
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<div class="container">
			<c:import url="../common/myPageNav.jsp" />


			<div class="col-md-10">

				<div class="container-fluid">
					<div class="row">
						<div class="list">
							<input type="button" value="요청하기" onclick="request();" />
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>작성자</th>
										<th>요청날짜</th>
										<th>승인여부</th>
									</tr>
								</thead>


								<tbody id="tb">
									<c:if test="${!empty list }">
										<c:forEach var="a" begin="0" end="${list.size()-1 }" step="1">
											<tr id="${list.get(a).getAId()}">
												<td>${list.get(a).getAId()}</td>
												<td>${list.get(a).getAName()}</td>
												<td>${list.get(a).getMName()}</td>
												<td>${list.get(a).getRequest_date()}</td>
												<c:if test="${list.get(a).getDelflag() eq 'Y'.charAt(0) }">
													<td>요청 취소</td>
												</c:if>
												<c:if test="${list.get(a).getDelflag() eq 'N'.charAt(0) }">
													
												<c:if test="${!empty list.get(a).getGrant_date()}">
													<td>승인</td>
												</c:if>
												<c:if test="${empty list.get(a).getGrant_date()}">
													<td>요청중</td>
												</c:if>
												</c:if>
											</tr>

										</c:forEach>


									</c:if>
									<c:if test="${empty list }">

										<tr>
											<td colspan="4" align="center">요청 내역이 없습니다.</td>

										</tr>

									</c:if>
								</tbody>
							</table>
							<form id="updateReF" method="post" action="rePermission.do" enctype = "multipart/form-data">

							<div class="modal fade" id="test" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
						<div class="modal-dialog" role="document" >
							<div class="modal-content" >
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">요청하기
									<button type="button" class="modal-title close"data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
									</h5>
								</div>
								<div class="modal-body">
								<div style="text-align: left;">
								<input type="hidden" id="aId" name="aId">
								</div>
									
									<div>
										<div align="center">
											<input type="radio" id="aCode1" name="aCode" value="1"/>
											<label for="aCode1">작성권한</label> 
											<input type="radio" id="aCode2"name="aCode" value="2" />
											<label for="aCode2">파워링크</label>

										</div>
									</div>
								
									<div>
										<label>주소</label>
										<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br/>
										<input type="text" id="sample4_postcode"name="address" value="" placeholder="우편번호"  required readonly> 
										<input type="text" id="sample4_roadAddress" name="address" value="" placeholder="도로명주소"   readonly> 
										<span id="guide" style="color: #999; display: none"></span> <br/>
										<input type="text" id="sample4_detailAddress" name="address" style="width:100%;" placeholder="상세주소" value="" required >

									</div>
									<br/>
									<div id = "beUrl">
										<label> 사이트주소 </label>
										<input class="" id="site_url" name="site_url"
										type="url"value="http://" style="width: 100%;" required>

									</div>
									<br/>
									<div id ="" >
									<label>기업 사진</label>
									<input class="" id="reImg" name="reImg" onchange="readURL(this);" type="file" value="${authority.img_file}" >
									 <img id = "beimg" src="/resources/img/authority/${authority.img_file}" width="10%" heigh="10%">
									</div>
									<br/>
									<div>
										<div>
											<label>메모</label>
											<div>
												<textarea cols="30" rows="5" id="aContent" name="aContent"
													name="scontent" style="width: 100%;" maxlength="100" value=""></textarea>
											</div>
										</div>
									</div>
						
								</div>
								<div id="result" class="modal-footer">
									<input  type="submit" value="요청"class="btn btn-primary" onclick="insertRe();">
									<button class="btn btn-secondary" data-dismiss="modal">취소</button>
								</div>
								<div class="modal-footer" id="updateresult"
									style="display: none">
									<input id="updateresult" type="submit" class="btn btn-primary"
										value="수정" onclick="updateRe();"> 
										<input type="submit" id="del" class="btn btn-primary" value="요청취소" onclick="deleteRe();">
									<button class="btn btn-secondary" data-dismiss="modal"> 취소</button>
								</div>
							</div>
						</div>
					</div>
					</form>
							
							
							<script>
							$('#aContent').val("사업자 등록번호 : 00-00-0000 \n 기타 요청 사항 : 사항을 적어주세요.");
								$('tr[id]').click(function(){
									if(($(this).children('td:eq(4)').text())=="요청 취소"){
										alert("취소된 요청입니다.");
									}else{
										trId = (this).id;
										var idx = $('tr').index(this) - 1;
													
											$.ajax({
												url : "${pageContext.request.contextPath}/myPage/selectRequest.do",
												data : {
													aId : trId
												},
												async : false,
												dataType : "json",
												success : function(data) {
													var str = data.address.split(",");
													console.log(data);
													$('#num').empty();
													$('#num').append((data.aid));
													$('#aId').val(trId);
													$($("input:radio[value="+ data.acode+ "]").attr("checked","checked"));
													$('#sample4_postcode').val(str[0]);
													$('#sample4_roadAddress').val(str[1]);
													$('#sample4_detailAddress').val(str[2]);
													$('#aContent').val(data.acontent);
													$('#site_url').val(data.site_url);
													/*  $('#beimg').attr("src","/resources/img/authority/"${authority.img_file}); */ 
													
													$('#result').attr("style","display:none");
										    		$('#updateresult').attr("style","display:block");
													$('#test').modal('show');

												},
												error : function(
														jqxhr,
														textStatus,
														errorThrown) {
													console.log("ajax 처리 실패");

												}
											});
										}
								});
							</script>

							

						</div>
					</div>
				</div>
			</div>

		</div>
		<c:import url="../common/footer.jsp" />
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		function readURL(input) { 
		
				var reader = new FileReader(); 
				reader.onload = function (e) {
					$('#beimg').attr('src', e.target.result); 
				} 
				reader.readAsDataURL(input.files[0]); 
			console.log("read : " + reader.readAsDataURL(input.files[0]));		
		} 
		function request(){
			$('input').empty(); 
			$('#aId').remove();
			$('#result').attr("style","display:block");
    		$('#updateresult').attr("style","display:none");

			$('#test').modal('show');
		}
		function insertRe(){
			$('#updateReF').attr("action","rePermission.do");
		}
		function updateRe() {
			$('#updateReF').attr("action","updateRePermission.do");
		}
		function deleteRe() {
			$('#updateReF').attr("action","deleteRePermission.do");
		}
		</script>
		<!-- 주소 스크립트 -->
		<script>
			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			function sample4_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(
									data) {
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
		
		<script>
		
		$(document).ready(function() {
		if(${msg!=null})alert("${msg}");
		});
		</script>


	</div>
</body>
</html>
