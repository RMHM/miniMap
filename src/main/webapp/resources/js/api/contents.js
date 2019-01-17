
var category = new Object;
var event = new Object;
var weather;

$(function(){
	
	// 날씨 가져오기
	// 이전에 사용하던거
	/*$.ajax({
		url : "/jeju/jejuWeather.do",
		type : "GET",
		success : function(result){
			console.log(result)
			weather = result;
			getWeather();
			
			$('#calendar .fc-next-button, #calendar .fc-prev-button, #calendar .fc-today-button').click(function(){
				getWeather();
			})
			
		},
		error : function(result){
			console.log(result)
		}
	})*/
	
	// 제주도 공연전시 api 가져오기
	$.ajax({
		url : "/jeju/jejuContent.do",
		success : function(result){
			console.log(result)

			// 상태에 따른 색상 지정
			var selColor = {
				END : "#5F4B8B",
				READY : "#83DCB7",
				ING : "#F08080"
			}
			var selTextColor = {
				END : "#fff",
				READY : "#000",
				ING : "#000"
			}
			// 상태 색상 끝

			// 일정에 대한 내용 보강해야됨
			// description에 들어갈 내용 조정해야됨
			for(var i in result){
				var tmpList = [];
				for(var j=0; j<result[i].length; j++){
					var content = new Object;
					var description = (result[i][j].intro == undefined)?"상세정보 없음":result[i][j].intro;
					var hour = (result[i][j].hour == undefined)?"-":result[i][j].hour;
					var pay = (result[i][j].pay == undefined)?"-":result[i][j].pay;
					var coverThumb = (result[i][j].coverThumb == undefined)?"-":'<img src=' + result[i][j].coverThumb + '></img>';
					
					var lc = '<br><br>'
					var detail = "";
					detail += "<b>제목</b> : " + result[i][j].title + lc;
					detail += "<b>내용</b> : " + description + lc;
					detail += "<b>주최</b> : " + result[i][j].owner + lc;
					detail += "<b>시작시간</b> : " + hour + lc;
					detail += "<b>요금</b>  : " + pay + lc;
					detail += "<b>장소</b>  : " + result[i][j].locNames + lc;
					detail += "<b>분류</b>  : " + result[i][j].categoryName + lc;
					detail += "<b>연락처</b>  : " + result[i][j].tel + lc;
					detail += "<b>행사 포스터</b>  : " + coverThumb + lc;
					
					content = {
							title : result[i][j].title,
							start : result[i][j].start,
							end : result[i][j].end,
							description : description,
							constraint : detail,
							img : result[i][j].coverThumb,
							color : selColor[result[i][j].stat],
							textColor : selTextColor[result[i][j].stat],
							imageurl : '../../resources/img/profiles/default.png'
					};
					tmpList.push(content);
				}
				category[i] = tmpList;
			}
			console.log(category)
			
			
		},
		error : function(result){
			console.log(result);
		},
		complete : function(){
			// 전체 리스트
			var allList = [];
		
			// 카테고리 단위별 분리
			for(var i in category){
				allList = allList.concat(category[i]);

				event[i] = category[i];
			}
			event['all'] = allList;
			$('#loading').hide();
			getFullcalendar(allList)
			
			// 기온 api
			getTemp();
			$('#calendar .fc-next-button, #calendar .fc-prev-button, #calendar .fc-today-button').click(function(){
				$('#calendar').hide();
				$('#loading').show();
				getTemp();
			});
		}
	})

})

// 날씨 가져오기
function getWeather(){
	var jeju = weather['제주'];
	var d = new Date();
	var nd = new Date(d.getFullYear(), d.getMonth(), d.getDate()+1);
	var str = "";
	
	for(var i=0; i<jeju.length; i++){
		if(jeju[i].fcstTime == ((d.getHours()<10)?"0"+d.getHours():d.getHours())+"00" && jeju[i].fcstDate == ""+d.getFullYear()+((d.getMonth()<9)?'0'+(d.getMonth()+1):d.getMonth()+1)+((d.getDate()<10)?'0'+d.getDate():d.getDate())){
			var dFormat = d.getFullYear()+"-"+((d.getMonth()<9)?'0'+(d.getMonth()+1):d.getMonth()+1)+"-"+((d.getDate()<10)?'0'+d.getDate():d.getDate())
			$('#calendar thead td[data-date="'+ dFormat +'"]').prepend('현재기온 : ' + jeju[i].tempValue);
		} else if(jeju[i].fcstTime=="0200" && jeju[i].fcstDate == ""+nd.getFullYear()+((nd.getMonth()<9)?'0'+(nd.getMonth()+1):nd.getMonth()+1)+((nd.getDate()<10)?'0'+nd.getDate():nd.getDate())) {
			if(jeju[i].fcstDate != jeju[i].baseDate) str += "<font color=blue>" + jeju[i].tempValue + "</font>/";
			else {
				var dFormat = nd.getFullYear()+"-"+((nd.getMonth()<9)?'0'+(nd.getMonth()+1):nd.getMonth()+1)+"-"+((nd.getDate()<10)?'0'+nd.getDate():nd.getDate())
				$('#calendar thead td[data-date="'+ dFormat +'"]').prepend("최저기온 : " + jeju[i].tempValue);
				break;
			}
			
		} else if(jeju[i].fcstTime=="1500" && jeju[i].fcstDate == ""+nd.getFullYear()+((nd.getMonth()<9)?'0'+(nd.getMonth()+1):nd.getMonth()+1)+((nd.getDate()<10)?'0'+nd.getDate():nd.getDate())) {
			str += "<font color=red>" + jeju[i].tempValue + "</font>";
			var dFormat = nd.getFullYear()+"-"+((nd.getMonth()<9)?'0'+(nd.getMonth()+1):nd.getMonth()+1)+"-"+((nd.getDate()<10)?'0'+nd.getDate():nd.getDate())
			$('#calendar thead td[data-date="'+ dFormat +'"]').prepend(str);
			break;
		}
	}
	
}

// 캘린더 띄우기
function getFullcalendar(evt){
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'btnAll, btnExhibit, btnShow'
			//right : 'month,agendaWeek,agendaDay,listMonth'
		},
		dayClick : function(date, jsEvent, view) {
			console.log(date.format());
		},
		// 이벤트 hover
		eventRender: function(eventObj, $el) {
			$el.popover({
				title: eventObj.title,
				content: eventObj.description,
				trigger: 'hover',
				placement: 'top',
				container: 'body'
			});
		},
		// 이벤트 click
		eventClick : function(evt){
			console.log(evt.constraint);
			eventDetail(evt.constraint)
		},
		// 우상단 분류 버튼
		customButtons : {
			btnAll : {
				text : '전체',
				click : function(){
					$('#calendar').fullCalendar('removeEvents')
					$('#calendar').fullCalendar('addEventSource', event['all'])
				}
			},
			btnExhibit : {
				text : '공연',
				click : function(){
					$('#calendar').fullCalendar('removeEvents')
					$('#calendar').fullCalendar('addEventSource', event['공연'])
				}
			},
			btnShow : {
				text : '전시',
				click : function(){
					$('#calendar').fullCalendar('removeEvents')
					$('#calendar').fullCalendar('addEventSource', event['전시'])
				}
			}
			
		},
		defaultDate : new Date(),

		navLinks : false, // can click day/week names to navigate views
		businessHours : true, // display business hours
		editable : false,
		eventLimit: true,
		events : evt
	});
}

// 기온 가져오기
function getTemp(){
	var date = $("#calendar").fullCalendar("getDate");
	var year = new Date(date).getFullYear();
	var month = new Date(date).getMonth()+1;
	var baseForm = year + "-" + ((month<10)?"0"+month:month) + "-";
	
	$.ajax({
		url : "/myPage/temper.do",
		type : "get",
		data : {
			"num" : month
		},
		dataType : "json",
		success : function(result){
			for(var i=0; i<result.length; i++){
				var tmp = baseForm + ((i<9)?"0"+(i+1):(i+1));
				$('#calendar thead td[data-date="' + tmp + '"] span')
				.before("<font color=red>" + result[i].high + "</font>/<font color=blue>" + result[i].low + "</font>");
			}
		},
		error : function(result){
			console.log(result);
		},
		complete : function(){
			$('#loading').hide();
			$('#calendar').show();
		}
	})
}

function eventDetail(txt){
	$('#evtDetail').remove();
	$('#evt-modal-a').remove();
	$form = $('<form>').attr({"id":"evtDetail"});
	$divFade = $('<div>').attr({
		'class' : 'modal fade',
		'id' : 'evt-modal',
		'role' : 'dialog',
		'aria-labelledby' : 'myModalLabel',
		'aria-hidden' : 'true'
	})
	$divDialog = $('<div>').attr({'class' : 'modal-dialog', 'role' : 'document'});
	$divContent = $('<div>').attr({'class' : 'modal-content'});
	
	$divHeader = $('<div>').attr({'class' : 'modal-header'});
	$button = $('<button>').attr({
		'type' : 'button',
		'class' : 'close',
		'data-dismiss' : 'modal'
	}).html('<span aria-hidden="true">×</span>');
	$hTitle = $('<h5>').attr({'class' : 'modal-title', 'id' : 'myModalLabel'}).text('전시공연 상세정보');
	$divHeader.append($button).append($hTitle);
	
	$divBodyAll = $('<div>').attr({'class' : 'modal-body'});
	
	$divBody1 = $('<div>').attr({'class' : 'modal-body'});
	$divContent11 = $('<div>').attr({'class' : 'modal-content'}).append($('<label>').text('상세내용'));
	$divContent12 = $('<div>').attr({'class' : 'modal-content'}).append($('<p>').html(txt));
	
	$divBody1.append($divContent11).append($divContent12);
	
	$divBodyAll.append($divBody1);
	
	$divFooter = $('<div>').attr({'class' : 'modal-footer'});
	$inputBtn1 = $('<input>').attr({
		'type' : 'button',
		'value' : '되돌아가기',
		'class' : 'btn',
		'id' : 'btnBack',
		'data-dismiss' : 'modal'
	})
	
	$divFooter.append($inputBtn1);
	
	$form.append($divFade.append($divDialog.append($divContent.append($divHeader).append($divBodyAll).append($divFooter))));
	
	$a = $('<a>').attr({
		'id' : 'evt-modal-a',
		'data-toggle' : 'modal',
		'role' : 'button',
		'href' : '#evt-modal'
	})
	
	$('body').append($form).append($a.hide());
	
	$a.click();
}