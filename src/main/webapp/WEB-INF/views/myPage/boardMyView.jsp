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
								<small>작성 게시글 </small>
							</h1>
													

				 	</div> 

				</div>
			</div>


		
			
		</div><c:import url="../common/footer.jsp" />
	</div>
</body>
</html>
