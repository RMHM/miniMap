
var category = new Object;
var event = new Object;
var weather;

$(function(){
	
	// 날씨 가져오기
	$.ajax({
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
	})
	
	// 제주도 공연전시 api 가져오기
	$.ajax({
		url : "/jeju/jejuContent.do",
		type : "GET",
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
					var coverThumb = (result[i][j].coverThumb == undefined)?"-":result[i][j].coverThumb;
					
					var detail = "";
					detail += "제목 : " + result[i][j].title + "\n\n";
					detail += "내용 : " + description + "\n\n";
					detail += "주최 : " + result[i][j].owner + "\n\n";
					detail += "시작시간 : " + hour + "\n\n";
					detail += "요금  : " + pay + "\n\n";
					detail += "장소  : " + result[i][j].locNames + "\n\n";
					detail += "분류  : " + result[i][j].categoryName + "\n\n";
					detail += "연락처  : " + result[i][j].tel + "\n\n";
					detail += "썸네일 URL  : " + coverThumb + "\n\n";
					
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
			alert(evt.constraint);
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
