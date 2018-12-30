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
<!--  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
 -->


<script>

	$(document).ready(function() {
		var today = new Date();
		console.log(today);
	  var event = [
 	<c:forEach items="${list}" var="list"  varStatus="i"> 
 	{
        "title":'<c:out value="${list.title}" />'
        ,"start":'<c:out value="${list.start}" />'
        ,"end":'<c:out value="${list.end}" />'
        ,"color":'<c:out value="${list.color}" />'
        ,"content":'<c:out value="${list.content}" />'
         ,"sId":'<c:out value="${list.sId}" />' 
    } <c:if test="${!status.last}">,</c:if>
 	</c:forEach>
 	];
	/*   console.log(event); */
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listMonth'
			},
			  eventRender: function(event, element){
		          element.popover({
		              animation:true,
		              delay: 300,
		              content: event.content,
		              trigger: 'hover'
		          });
		        }, 
		         eventAfterRender: function(event, element, view) { 
		         	/* var comp = new Date(event.start) ;
		     		var compEnd = new Date(event.end); */
		         /* console.log(compEnd); */
		/* 			console.log((today>event.start));   */
		         	
		var new_description ='<a href="#">' 
		            + '<strong>후기작성</strong>' + '</a>' 
		            
					if(event.end==null){
		         		if(today>event.start)element.append(new_description);
		         	}else{
		         		if(today>event.end)element.append(new_description);
		         	}
					console.log(event.end);
		        } , 
		        eventClick: function(calEvent, jsEvent, view) {
		
				console.log(calEvent.end);
		    	if(calEvent.end==null){
		    		calEvent.end=calEvent.start
		    	}
		    	  $('#sId').val(calEvent.sId);  
		    	 	$('#sTitle').val(calEvent.title);
		    		$('#sContent').val(calEvent.content);
		    		$('#startDateT').val(calEvent.start.format());
		    		$('#endDateT').val(calEvent.end.format());
		    		$('#sColor').val(calEvent.color);
		    		$('#result').attr("style","display:none");
		    		$('#updateresult').attr("style","display:block");
		    		 $('#insertC').dialog({});
		        },
		          eventMouseover:function(event , jsEvent , view){
		        	/*   console.log(event); */
		          },
		          eventMouseout:function ( event , jsEvent , view ) {
		        	  
		          },
			dayClick : function(date, jsEvent, view) {
 				$('input').empty(); 
 				$('#sId').remove();
				$('#startDateT').val(date.format());
				$('#endDateT').val(date.format());
				$('#result').attr("style","display:block");
	    		$('#updateresult').attr("style","display:none");
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
				<div id="insertC" title="일정 추가" style="display: none">
					<form id="formAction" action="insertSchedule.do" method="post">
						<!-- <div
						class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ui-draggable-handle">
						<span id="ui-id-1" class="ui-dialog-title"> 일정등록</span>

					</div> -->
						<!-- <div id="dialog-message"
						style="width: auto; min-height: 0px; max-height: none; height: auto;"
						class="ui-dialog-content ui-widget-content">
 -->
						<div id="dialog-message"
							style="width: auto; min-height: 0px; max-height: none; height: auto;">

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
								<label> 색상 선택 </label><input type="color" id="sColor"
									name="sColor">
							</div>


						</div>
						<div id="result" style="display: block"
							class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
							<input id="submit" type="submit" value="등록"> <input
								type="button" id="close" value="취소">

						</div>
						<div id="updateresult" style="display: none"
							class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
							<input id="update" type="submit" value="수정" onclick="updateS();">
							<input type="submit" id="del" value="삭제" onclick="deleteS();">

						</div>
				</div>
				<script>
					function updateS(){
						console.log("update실행");
						$('#formAction').attr("action","updateSchedule.do");
					}
					function deleteS(){
						console.log("delete실행");
						$('#formAction').attr("action","deleteSchedule.do");
					}
					</script>
				</form>
			</div>
		</div>
	</div>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>