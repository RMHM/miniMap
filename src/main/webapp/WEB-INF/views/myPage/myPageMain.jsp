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
<!-- 
<script>
	
	 /* 
	$(document).ready(function() { */
		var event =[];
		 $.ajax({
				url : "${pageContext.request.contextPath}/myPage/selectSchedult.do", 
				data : {mNo:10},
				async: false,
				  dataType: "json",
				  success : function(data){
					  var list = data.list;
		              var date = list[0].START_DATE;
		              var arr = [];
		               for(var i = 0; i<list.length;i++){
		            	
		            	var start = list[i].START_DATE;
		            	var end =  list[i].END_DATE;
		            	var rs = moment(start).format('YYYY-MM-DD');
		           		var es = moment(end).format('YYYY-MM-DD');
		           		console.log(rs);
		            	  arr[i]={	title : list[i].STITLE,
		            			  	start: rs,
		            				end: es,
		            	  			color : list[i].SCOLOR,
		            	  			constraint : list[i].SCONTENT 
		              
		              			}			 
		            	  }  
		              console.log(arr);
		              event=arr;
		              scheduleList(data.list);
		          }, error : function(jqxhr, textStatus, errorThrown){
		              console.log("ajax 처리 실패");
		              //에러로그
		              console.log(jqxhr);
		              console.log(textStatus);
		              console.log(errorThrown);
		          }
			});// ajax-end
			
			function scheduleList(list){
				
			}
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listMonth'
			},
			eventLimit : true, // for all non-agenda views
			defaultDate : today,//'2018-03-12', // today;
			selectable : true,
			selectHelper : true,
			views : {
				month : { // name of view
					titleFormat : 'MMMM YYYY'
				// other view-specific options here
				},
				week : {
					titleFormat : " MMMM D YYYY"
				},
				day : {
					titleFormat : 'D MMM, YYYY'
				}
			},
			dayClick : function(date) {

				$("#insertC").attr("style", "display:inline-block");
				/* 	    $('#datepicker_startdate').val(date.format); */
				$(document).ready(function() {
					$("#datepicker_startdate").val('date.format');

				});
			},

			/* select : function(start, end) {
				/* alert("일정 추가하기"); */
			/* 	console.log(start);
				$("#insertC").attr("style", "display:inline-block");
				console.log("---------");
				console.log(start); */

			/* console.log(start._d);
			console.log(start); */
			/* $('#datepicker_startdate').val(start); */
			/*   <input type="date" id="test"> */

			/* $(document).ready(
			        function(){
			           $("#test").val('2018-01-01');
			        console.log($("#test").val())
			        });
			 */
			/* console.log($('#datepicker_startdate').val); */

			/*}, */
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			editable : false, // mouse 이동
			events : event/* [ {
				title : "test",
				start : "2018-03-14"
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Business Lunch',
				start : '2018-03-03T13:00:00',
				constraint : 'businessHours'
			}, {
				title : 'Meeting',
				start : '2018-03-13T11:00:00',
				constraint : 'availableForMeeting', // defined below
				color : '#257e4a'
			}, {
				title : 'Conference',
				start : '2018-03-18',
				end : '2018-03-20'
			}, {
				title : 'Party',
				start : '2018-03-29T20:00:00'
			},

			// areas where "Meeting" must be dropped
			{
				id : 'availableForMeeting',
				start : '2018-03-11T10:00:00',
				end : '2018-03-11T16:00:00',
				rendering : 'background'
			}, {
				id : 'availableForMeeting',
				start : '2018-03-13T10:00:00',
				end : '2018-03-13T16:00:00',
				rendering : 'background'
			},

			// red areas where no events can be dropped
			{
				start : '2018-03-24',
				end : '2018-03-28',
				overlap : false,
				rendering : 'background',
				color : '#ff9f89'
			}, {
				start : '2018-03-06',
				end : '2018-03-08',
				overlap : false,
				rendering : 'background',
				color : '#ff9f89'
			} ] */
		});

/* 	}); */
</script>

 -->

</head>

<body>
	<!-- 외부파일 선언 -->

	<c:import url="../common/exFile.jsp" />
	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<c:import url="../common/myPageNav.jsp" />
		<%-- <nav style="float: left; width: 100px; height: auto;">
			<a href="#">쪽지</a><br /> <a
				href="${pageContext.request.contextPath}/myPage/myPageMain.do">정보수정</a><br />
			<a href="#">일정관리</a><br /> <a href="#">지도</a><br /> <a href="#">작성한글</a>
			<br /> <a href="#">권한요청(기업)</a>

		</nav> --%>


		<div class="col-sm-8 text-center">
			<!-- <article class="container"> -->
			<!-- <div class="form-horizontal" id="showView"
						style="width: 70%; height: 100%;">
 -->
			<!-- <div class="form-group"> -->
			<!-- <div class="page-header" >-->
			<h1>
				<small>회원 정보 </small>
			</h1>
			<!-- </div> -->

			<div class="form-horizontal" id="updateForm">

				<div class="form-group">
					<label class="col-sm-3 control-label" for="userId">유저아이디</label>
					<%-- <label class="col-sm-3 control-label"for="userId" name="userId"><%=m.getUserId()%> --%>
					</label>
					<div class="col-sm-6">
						<input class="form-control" id="mid" name="mid" readonly type=""
							value="${member.mid}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="password">비밀번호
						입력</label>
					<div class="col-sm-6">
						<input class="form-control" id="mpw" name="mpw" type="password">
					</div>
				</div>
				<div class="form-group">

					<button id="mUpdateMember" onclick="mUpdate();">정보 수정</button>

				</div>
				<script>
					function mUpdate() {

						console.log($('#password').val());
						$
								.ajax({
									url : "${pageContext.request.contextPath}/myPage/passCheck.do",

									data : {
										mid : $('#mid').val(),
										mpw : $('#mpw').val()
									},
									dataType : "json",
									success : function(data) {
										console.log("일치" + data);
										console.log(data.msg);
										if (data.msg) {
											location.href = "${pageContext.request.contextPath}/myPage/updateMemberView.do";
										} else {
											alert("비밀번호가 일치하지 않습니다.");
										}

									},
									error : function(e) {
										console.log("error" + data);
										alert("ajax 실패");

									}

								});

					}
				</script>
			</div>
			<!-- </article> -->
		</div>

		</section>
		<section id="content">
			<div class="container">

				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
			</div>
	</div>
	<!-- footer 선언 -->
	<c:import url="../common/footer.jsp" />

</body>
</html>
