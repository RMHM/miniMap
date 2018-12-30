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
							<input type="button" value="요청하기"
								onclick="location.href='/myPage/rePermissionClick.do'" />
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
												<td>${list.get(a).getACode()}</td>
												<td>${list.get(a).getMName()}</td>
												<td>${list.get(a).getRequest_date()}</td>
												<c:if test="${!empty l.getGrant_date()}">
													<td>승인</td>
												</c:if>
												<c:if test="${empty l.getGrant_date()}">
													<td>요청중</td>
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
							<script>
								$('tr[id]')
										.click(
												function() {

													var trId = (this).id;
													console.log("-----");
													console.log(trId);
													var idx = $('tr').index(
															this) - 1;
													console.log(idx);

													$
															.ajax({
																url : "${pageContext.request.contextPath}/myPage/selectRequest.do",
																data : {
																	aId : trId
																},
																async : false,
																dataType : "json",
																success : function(
																		data) {
																	var str = data.address
																			.split(",");
																	console
																			.log(str);
																	/*  console.log(data);
																	 console.log(data.aid);
																	 console.log(data.acode);
																	 console.log(data.address);
																	 console.log(data.acontent); */
																	/* 	 console.log(data.aid); */
																	/* 		 $('#num').val(data.aid); */
																	$('#num')
																			.append(
																					(data.aid));
																	$('#aId')
																			.val(
																					trId);
																	$(
																			$(
																					"input:radio[value="
																							+ data.acode
																							+ "]")
																					.val())
																			.attr(
																					"checked",
																					"checked");
																	$(
																			'#sample4_postcode')
																			.val(
																					str[0]);
																	$(
																			'#sample4_roadAddress')
																			.val(
																					str[1]);
																	$(
																			'#sample4_detailAddress')
																			.val(
																					str[2]);
																	$(
																			'#edited_title')
																			.val(
																					data.acontent);

																	$(
																			'#updateRe')
																			.dialog(
																					{
																					/* 		
																							buttons:{
																								
																								"수정": function(){
																									/* console.log(this); */
																					/* 			console.log($(this).find("form"));
																								$("#updateRe").attr("action","${pageContext.request.contextPath}/myPage/updateRePermission.do").submit();
																							},
																							"취소":function(){
																								$(this).dialog("close");
																							}
																					
																						} */

																					});

																},
																error : function(
																		jqxhr,
																		textStatus,
																		errorThrown) {
																	console
																			.log("ajax 처리 실패");

																}
															});

												});
							</script>

							<div id="updateRe" title="요청 정보" style="display: none">
								<!-- <form action="updateRePermission.do" method="post"> -->
								<form id="updateRe" method="post" action="updateRePermission.do">
									<div id="dialog-message"
										style="width: auto; min-height: 0px; max-height: none; height: auto;">


										<div style="text-align: left;">
											<div>
												요청 번호 : <label id="num" name="aId" value=""></label> <input
													type="hidden" id="aId" name="aId" />
											</div>
											<div>

												<input type="radio" id="aCode1" name="aCode" value="1" /><label
													for="aCode1">작성권한</label> <input type="radio" id="aCode2"
													name="aCode" value="2" /><label for="aCode2">파워링크</label>
											</div>

											<div>
												<div>
													<label>주소</label> <input type="text" id="sample4_postcode"
														name="address" placeholder="우편번호"> <input
														type="button" onclick="sample4_execDaumPostcode()"
														value="우편번호 찾기"><br> <input type="text"
														id="sample4_roadAddress" name="address"
														placeholder="도로명주소"> <span id="guide"
														style="color: #999; display: none"></span> <input
														type="text" id="sample4_detailAddress" name="address"
														placeholder="상세주소">
												</div>
											</div>

											<div style="margin-bottom: 5px;">

												<label>내용</label>
												<textarea cols="30" rows="5" id="edited_title"
													name="aContent" name="aContent" style="width: 98%;"
													maxlength="100"></textarea>

											</div>
											<script
												src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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


										</div>
									</div>
									<!-- <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
									 <input type="submit" value="수정">
									 <input type="submit" value="요청취소">
									<button id="updateRe" onclick="deleteRe();"name="delflag"value ="Y">요청취소</button>
									 <input type="button" id="close" value="취소">
									</div> -->
									<div class="form-group">
										<input type="submit" value="수정"> <input type="submit"
											onclick="deleteRe();" value="요청취소"> <input
											type="button" onclick="close();" value="취소">
									</div>

									<script>
										function deleteRe() {
											console.log("삭제 수행");
											$('#updateRe').attr("action",
													"deleteRePermission.do");
										}
									</script>

								</form>

							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
		<c:import url="../common/footer.jsp" />


	</div>
</body>
</html>
