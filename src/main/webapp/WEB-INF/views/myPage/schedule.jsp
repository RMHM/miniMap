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
<!-- 
 <link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' /> -->
<!-- <script src='/resources/js/moment.min.js'></script> -->
<!-- <script src='/resources/js/jquery.min.js'></script> -->
<!-- <script src='/resources/js/fullcalendar.min.js'></script> -->

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<!--  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
 -->


<script>

	$(document).ready(function() {
		
		console.log("Test");
		/* console.log(${list.size() }); */
		/*  console.log("${list[0]}");  */
 		/*  <c:forEach items="${list}" var="msg"  varStatus="i">
			 console.log("${msg}"); 
              alert("${msg}"); 
 			
         </c:forEach> 
	  */

	  var event = [
 	<c:forEach items="${list}" var="list"  varStatus="i"> 
 	{
        "title":'<c:out value="${list.title}" />'
        ,"start":"<c:out value="${list.start}" />"
        ,"end":"<c:out value="${list.end}" />"
        ,"color":"<c:out value="${list.color}" />"
        ,"constraint":"<c:out value="${list.constraint}" />"
    } <c:if test="${!status.last}">,</c:if>
 	</c:forEach>
 	];
	  console.log(event);
	

 
 
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listMonth'
			},
			dayClick : function(date, jsEvent, view) {
			
				console.log(date.format());
				$('#insertC').dialog({
			 		
			 		/* buttons:[
			 			{text:"Ok",click:function(){
			 			$(this).dialog("close");
			 			}
			 			},{text:"cancle",click:function(){
			 				$(this).dialog("close");
			 			}}
			 		]  */
				});
			
			/* 	alert("asd"); */
			 /* 	$("#insertC").attr("style", "display:inline-block");  */
		/* 	 $("#insertC").dialog("open");
			 e.preventDefault(); */
			 	/*  $("#insertC").dialog({
			 		autoOpen:true,width:400,modal:true,
			 		buttons:[
			 			{text:"Ok",click:function(){
			 			$(this).dialog("close");
			 			}
			 			},{text:"cancle",click:function(){
			 				$(this).dialog("close");
			 			}}
			 		]
			 	});  */
				/* $('input[type=date]').val(date.format()); */
			},
			defaultDate : new Date(),
		
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			editable : true,
			eventLimit: true,
			events :event
		});

	});
</script>
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
</style>


</head>
<body>


	<div id="wrapper">
		<!-- header 선언 -->
		<c:import url="../common/header.jsp" />
		<div class="container">
			<c:import url="../common/myPageNav.jsp" />
			<div class="col-md-10">

				<div id='calendar'></div>



				<!--  <div id="insertC" class="" tabindex="-1" role="dialog" title = "일정 추가"
				style="position: absolute; height: auto; width: 350px; top: 137px; left: 202px; display: none; z-index: 101;"
				aria-describedby="dialog-message" aria-labelledby="ui-id-1"> -->
 				<div id="insertC" title = "일정 추가" style = "display:none">
				<form action="insertSchedule.do" method="post">
					<!-- <div
						class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ui-draggable-handle">
						<span id="ui-id-1" class="ui-dialog-title"> 일정등록</span>

					</div> -->
					<!-- <div id="dialog-message"
						style="width: auto; min-height: 0px; max-height: none; height: auto;"
						class="ui-dialog-content ui-widget-content">
 -->
 					<div id="dialog-message"
						style="width: auto; min-height: 0px; max-height: none; height: auto;"
						>
 
						<div style="text-align: left;">

							<div>
								<label>제목</label><input type="text" name="sTitle"></input>
							</div>
							<div>
								<div>
									<label>메모</label>
									<div>
										<textarea cols="30" rows="5" id="edited_title" name="sContent"
											name="scontent" style="width: 98%;" maxlength="100"></textarea>
									</div>
								</div>
							</div>

							<div style="margin-bottom: 5px;">

								<label>날짜</label> <input type="date" id="startDateT"
									name="startDateT" style="width: auto;" class="ed hasDatepicker">~<input
									type="date" id="endDateT" name="endDateT"
									style="width: auto; margin-bottom: 4px;"
									class="ed hasDatepicker">

							</div>

							<div style="clear: both;"></div>
							<div>
								<label> 색상 선택 </label><input type="color" name="sColor">
							</div>


						</div>
						<div
							class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
							<input type="submit" value="등록"> <input type="button"
								id="close" value="취소">

						</div>
					</div>
				</form>
			</div>
		<!-- 	<script>
				$("#close").click(function() {
					console.log(this.val);

					$('#insertC').attr("style", "display:none");
				});
			</script>  -->
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>





<%-- 
<script>
	/* 
	$(document).ready(function() { */
/* 	var event = []; */
/* 	$.ajax({
		url : "${pageContext.request.contextPath}/myPage/selectSchedult.do",
		data : {
			mno : 10
		},
		async : false,
		dataType : "json",
		success : function(data) {
			var list = data.list;
			var date = list[0].START_DATE;
			var arr = [];
			for (var i = 0; i < list.length; i++) {

				var start = list[i].START_DATE;
				var end = list[i].END_DATE;
				var rs = moment(start).format('YYYY-MM-DD');
				var es = moment(end).format('YYYY-MM-DD');
				console.log(rs);
				arr[i] = {
					title : list[i].STITLE,
					start : rs,
					end : es,
					color : list[i].SCOLOR,
					constraint : list[i].SCONTENT

				}
			}
			console.log(arr);
			event = arr;
			scheduleList(data.list);
		},
		error : function(jqxhr, textStatus, errorThrown) {
			console.log("ajax 처리 실패");
			//에러로그
			console.log(jqxhr);
			console.log(textStatus);
			console.log(errorThrown);
		}
	});// ajax-end
 */
 
/* 	function scheduleList(list) {

--%>
