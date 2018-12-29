var content = new Object;
var category = new Object;
var event = [];

$(function(){
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
			for(var i in result){
				var tmpList = [];
				for(var j=0; j<result[i].length; j++){
					content = {
							title : result[i][j].title,
							start : result[i][j].start,
							end : result[i][j].end,
							constraint : (result[i][j].intro == undefined)?"상세정보 없음":result[i][j].intro,
							color : selColor[result[i][j].stat],
							textColor : selTextColor[result[i][j].stat]
					};
					tmpList.push(content);
//					event.push(content);
				}
				category[i] = tmpList;
			}
			console.log(category)
		},
		error : function(result){
			console.log(result);
		},
		complete : function(){
			var allList = [];
			// 전체 선택 버튼
			$allBtn = $('<input>').attr({
				type : "button",
				id : "all",
				value : "전체"
			})
			$('#calDiv').append($allBtn).append('<br>')
			$('#all').click(function(){
				console.log(this.value);
				console.log(allList)
				$('#calendar').fullCalendar('removeEvents')
					$('#calendar').fullCalendar('addEventSource', allList)
			})
			// 카테고리별 버튼
			for(var i in category){
				allList = allList.concat(category[i]);
				$rd = $('<input>').attr({
					type : 'button',
					id : i,
					value : i
				})
				$('#calDiv').append($rd).append('<br>')
				
				$('#'+i).click(function(){
					console.log(this.value)
					console.log(category[this.value])
					$('#calendar').fullCalendar('removeEvents')
					$('#calendar').fullCalendar('addEventSource', category[this.value])

				})
				
			}
			getFullcalendar(allList)
		},
		async : false
	})
	
})

function getFullcalendar(evt){
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay,listMonth'
		},
		dayClick : function(date, jsEvent, view) {
		
			console.log(date.format());
			$('#insertC').dialog({
		 		
			});
		
		},
		defaultDate : new Date(),
	
		navLinks : true, // can click day/week names to navigate views
		businessHours : true, // display business hours
		editable : false,
		eventLimit: true,
		events : evt
	});
}