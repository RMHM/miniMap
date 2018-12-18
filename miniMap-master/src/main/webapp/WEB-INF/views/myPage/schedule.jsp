<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/fullcalendar.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/fullcalendar.print.min.css"
	rel="stylesheet" media="print" />
<script
	src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fullcalendar.min.js"></script>
<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			customButtons : {

				myCustomButton : {

					text : '일정입력',

					click : function(event) {

						onSelectEvent(event);

					}

				}

			},
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listMonth,myCustomButton'
			},
			defaultDate : '2018-03-12',
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			editable : true,
			events : [ {
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
			} ]
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

nav, section, aside {
	float: left;
}

nav {
	width: 100px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
<title>Insert title here</title>

</head>
<body>
	<header> </header>
	<nav>
		<a href="#">쪽지</a><br/> <a href="#">정보수정</a><br/> <a href="#">일정관리</a><br/><a
			href="#">지도</a><br/> <a href="#">작성한글</a> <br/><a href="#">권한요청(기업)</a>

	</nav>
	<section>

		<div id='calendar'></div>

		<div
			class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable"
			tabindex="-1" role="dialog"
			style="position: absolute; height: auto; width: 350px; top: 137px; left: 202px; display: block; z-index: 101;"
			aria-describedby="dialog-message" aria-labelledby="ui-id-1">
			<div
				class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix ui-draggable-handle">
				<span id="ui-id-1" class="ui-dialog-title"> 일정등록</span>
				<button type="button"
					class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close"
					role="button" title="Close">
					<span class="ui-button-icon-primary ui-icon ui-icon-closethick"></span>
					<span class="ui-button-text">Close</span>
				</button>
			</div>
			<div id="dialog-message"
				style="width: auto; min-height: 0px; max-height: none; height: 351px;"
				class="ui-dialog-content ui-widget-content">
				<form>
					<div style="text-align: right;">

						<textarea cols="30" rows="5" id="edited_title" style="width: 98%;"
							maxlength="100"></textarea>
						<div style="margin-bottom: 5px;">

							<span style="float: right;"> 날짜 <input type="text"
								id="datepicker_startdate" style="width: 90px;"
								class="ed hasDatepicker" readonly="readonly">~<input
								type="text" id="datepicker_enddate"
								style="width: 90px; margin-bottom: 4px;"
								class="ed hasDatepicker" readonly="readonly">
							</span>
						</div>
						<div style="margin-bottom: 5px;">
							<span style="float: right;"> </span>
						</div>
						<div style="clear: both;"></div>
						<div style="clear: both; margin: 10px 0 0 0;">
							<span class="dialog_formfield" id="ColorPicker1"><span
								class="ColorBlotch" color="#3DA4B7"
								style="background-color: rgb(61, 164, 183);">&nbsp;</span><span
								class="ColorBlotch" color="#B2CBD1"
								style="background-color: rgb(178, 203, 209);">&nbsp;</span><span
								class="ColorBlotch" color="#517ACC"
								style="background-color: rgb(81, 122, 204);">&nbsp;</span><span
								class="ColorBlotch" color="#D95B44"
								style="background-color: rgb(217, 91, 68);">&nbsp;</span><span
								class="ColorBlotch" color="#FF4E90"
								style="background-color: rgb(255, 78, 144);">&nbsp;</span><span
								class="ColorBlotch" color="#FF0000"
								style="background-color: rgb(255, 0, 0);">&nbsp;</span><span
								class="ColorBlotch" color="#ffbb00"
								style="background-color: rgb(255, 187, 0);">&nbsp;</span><span
								class="ColorBlotch" color="#A0A43E"
								style="background-color: rgb(160, 164, 62);">&nbsp;</span><span
								class="ColorBlotch" color="#C3CB0F"
								style="background-color: rgb(195, 203, 15);">&nbsp;</span></span> <span
								id="ColorSelectionTarget1"
								style="background-color: rgb(61, 164, 183);">&nbsp;</span>
						</div>
						<div style="margin: 15px 0 10px 0;"></div>
					</div>
				</form>
			</div>
			<div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
			<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
			<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
			<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;">
			</div>
			<div
				class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se"
				style="z-index: 90;"></div>
			<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
			<div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;">
			</div>
			<div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
			<div
				class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
				<div class="ui-dialog-buttonset">
					<button type="button"
						class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
						role="button">
						<span class="ui-button-text">저장</span>
					</button>
					<button type="button"
						class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
						role="button">
						<span class="ui-button-text">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</section>
	<aside></aside>
</body>
</html>