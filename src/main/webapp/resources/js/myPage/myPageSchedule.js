var today = new Date();
var event = new Object;
var temper;
var weather;
var todayArr = new Array();
$(function(){
$.ajax({
		url : "/myPage/selectSchedule.do",
		type : "GET",
		success : function(data){
			var content = new Object;
			var list =data.list;
			temper = data.temper;
			weather = data.weather;
			
			/*console.log("msg : " + data.msg);*/
			/*if(data.msg != undefined){
				alert(data.msg);
				location.href="/myPage/selectScheduleNav.do";
			}*/
			var tmpList = [];
			for(var i =0; i<list.length;i++){
				content = {
						title : list[i].title,
						start : list[i].start,
						end : list[i].end +"T23:59:59" ,
						color : list[i].color,
						content : list[i].content,
						sId : list[i].sId
				};
			
				tmpList.push(content);
			
			}
			event = tmpList;
      for(var i =0; i<temper.length;i++){
				todayArr[i] = temper[i].low+"/"+temper[i].high;
			}
		},
		error : function(e){
			console.log(e)
		},
		complete : function(){
			$('#loading').hide();
        getFullcalendar();
			temperarr(today.getMonth()+1,todayArr);
			weaderToday();
			$('.fc-next-button,  .fc-prev-button,  .fc-today-button').click(function(){
				$('#calendar').hide();
				$('#loading').show();
				nextTemper();
			});
		}
	})

})

function nextTemper(){	
		var date = $("#calendar").fullCalendar("getDate");
		var month = new Date(date).getMonth()+1;
		var lastToday = new Date();
	
		$.ajax({
			url : "/myPage/temper.do",
			data : {
				num : month,
			},
			dataType : "json",
			success : function(data) {
				var arrTemper = new Array();
				for(var i = 0; i<data.length;i++){
					arrTemper[i] = data[i].low + "/" + data[i].high;
				}
				console.log("버튼" + arrTemper);
				temperarr(month,arrTemper); 
				
				if((lastToday.getMonth()+1)==month)weaderToday();
			},
			error : function(e) {
				console.log("error" + data);
			},complete : function(){
				$('#loading').hide();
				$('#calendar').show();
			}
			
		});


} 

function getFullcalendar(){
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
            var new_description ='<a href="/board/boardwrite.do?BCode=3">' 
	            + '<strong>후기작성</strong>' + '</a>' 
	            
				if(event.end==null){
	         		if(today>event.start)element.append(new_description);
	         	}else{
	         		if(today>event.end)element.append(new_description);
	         	}
      
	        } , 
	        eventClick: function(calEvent, jsEvent, view) {

	    	if(calEvent.end==null){
	    		calEvent.end=calEvent.start
	    	}
	    	$('#myModalLabel').text('일정수정');
	    	  $('#sId').val(calEvent.sId);  
	    	 	$('#sTitle').val(calEvent.title);
	    		$('#sContent').val(calEvent.content);
	    		$('#startDateT').val(calEvent.start.format());
	    		$('#endDateT').val(calEvent.end.format("YYYY-MM-DD"));
	    		$('#sColor').val(calEvent.color);
	    		$('#result').attr("style","display:none");
	    		$('#updateresult').attr("style","display:block");
	    		  $('#insertC').dialog({}); 
	    		 $('#test').modal('show');
	        },
	          eventMouseover:function(event , jsEvent , view){
	        	   console.log(event); 
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
    		$('#test').modal('show');
    		$('#insertC').dialog({}); 

		},
		defaultDate : new Date(),
		
		navLinks : true, // can click day/week names to navigate views
		businessHours : true, // display business hours
		editable : false,
		eventLimit: true,
		events :event
	});	
}

function weaderToday(){
	var trS = $('thead tr td');
	var tdS = $('#calendar').find('td[data-date]');
	var arr = weather;
	for(var i = 1; i<arr.length; i++){
  var date = new Date();
		date.setDate(date.getDate()+(i+2));
		var re = (date.toISOString().slice(0, 10));
		var we = arr[i]; 
		 var sr = "";
	
		if(we.match(/맑음/))sr = "<img src='/resources/img/weather/sun1.PNG' width='15px';height='15px'>";
		else if(we.match(/흐림/))sr = "<img src='/resources/img/weather/cloud1.PNG' width='15px';height='15px'>";
		else if(we.match(/구름많음/))sr = "<img src='/resources/img/weather/cloud1.PNG' width='15px';height='15px'>";
		else if(we.match(/비/))sr = "<img src='/resources/img/weather/rain1.PNG' width='15px';height='15px'>";
		else if(we.match(/눈/)) sr = "<img src='/resources/img/weather/snow1.PNG' width='15px';height='15px'>"; 
		else sr = "<img src='/resources/img/weather/sunCloud1.PNG' width='15px';height='15px'>";
		console.log(re);
		$('#calendar').find('td[data-date='+re+']').prepend(sr);
	}
}

function temperarr(month,arrT){
	
var arrdate = new Date();

arrdate.setMonth(month-1);
	for(var i =0; i < arrT.length; i++){
		arrdate.setDate(i+1);	
		var re = arrdate.toISOString().slice(0, 10);
		var tem = arrT[i];
		 $('#calendar').find('td[data-date='+re+']').prepend(tem).attr('style','font-size:x-small');
	}
	 
	if(arrdate.getMonth()==month-1 ){
			
			
	}
}

function scheduleTest(){
		 if($('#sTitle').val()==""){
			 alert('내용을 입력하세요');
			 return false;
		 }else if($('#sContent').val()==""){
			 alert('세부내용을 입력하세요');
			 return false;
		 }
		 return true;
}
function updateS(){
	console.log("update실행");
	$('#formAction').attr("action","updateSchedule.do");
}
function deleteS(){
	console.log("delete실행");
	$('#formAction').attr("action","deleteSchedule.do");
}

