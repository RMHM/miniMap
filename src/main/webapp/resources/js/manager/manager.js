// managerPage 용
$(document).ready(function() {
$("#content div").hide(); // Initially hide all content
$('#resultArea').hide();
$("#tabs li:first").attr("id","current"); // Activate first tab
$("#content div:first").fadeIn(); // Show first tab content

$('#tabs a').click(function(e) {
    e.preventDefault();        
    $("#content div").hide(); //Hide all content
    $("#tabs li").attr("id",""); //Reset id's
    $(this).parent().attr("id","current"); // Activate this
    $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
});

$.ajax({
	url : 'statistics.do',
	success : function(data){
		
		var chart = bb.generate({
		    bindto: "#chart1",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "pie",
		        columns: [
		            ["여성 회원", data[0]["여성 회원수"]],
		            ["남성 회원", data[0]["남성 회원수"]],
		            ["기타", data[0]["기타 회원수"]]
		        ]
		    }
		});
		
		var chart = bb.generate({
		    bindto: "#chart2",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "pie",
		        columns: [
		            ["10대", data[1]["10대 회원수"]],
		            ["20대", data[1]["20대 회원수"]],
		            ["30대", data[1]["30대 회원수"]],
		            ["40대", data[1]["40대 회원수"]],
		            ["기타", data[1]["기타 회원수"]]
		        ]
		    }
		});
		
		var chart = bb.generate({
		    bindto: "#chart3",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "bar",
		        columns: [
		            ["전체 회원수", data[2]["전체 회원수"]],
		            ["현재 회원수", data[2]["현재 회원수"]],
		            ["탈퇴 회원수", data[2]["탈퇴 회원"]]
		        ]
		    }
		});
		
		// 일별로 여러개 조회해서 불러올 것
		/*var chart = bb.generate({
		    bindto: "#chart4",
		    data: {
		        type: "bar",
		        columns: [
		            ["총 방문자", data[0]],
		            ["오늘 방문자", data[1]],
		            ["평균 방문자", data[2]]
	         ]
		    }
		});*/
		
		// 일별로 여러개 조회해서 불러올 것
		/*var chart = bb.generate({
		    bindto: "#chart4",
		    data: {
		        type: "bar",
		        columns: [
		            ["총 방문자", data[0]],
		            ["오늘 방문자", data[1]],
		            ["평균 방문자", data[2]]
	         ]
		    }
		});*/
		
		/*var chart = bb.generate({
		    bindto: "#chart4",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "line",
		        columns: [
		            
	         ]
		    }
		});*/
		
		var chart = bb.generate({
		    bindto: "#chart4",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "bar",
		        columns: [
		        	["전체 게시글", data[3]["전체 게시글 수"]],
		        	["자유 게시판", data[3]["자유 게시글 수"]],
		            ["정보 공유 게시판", data[3]["정보공유 게시글 수"]],
		            ["여행 후기 게시판", data[3]["여행후기 게시글 수"]],
		            ["질문 게시판", data[3]["질문 게시글 수"]],
		        	["게시판별 오늘 게시글", data[4]["자유"], data[4]["정보공유"],data[4]["여행후기"], data[4]["질문"]]
	         ]
		    }
		});
		
		chart.transform("line", "게시판별 오늘 게시글");
		
		$('div[id^="chart"').attr('style', 'position: relative; display:block; float:left; margin: 30px;');
			
	}, error : function(data){
		console.log("회원 조회 실패!! \n data : " + data);
	}
});

$('#tabs > li a').click(function(){
   mtype = $(this).attr("value");
   num = $(this).attr("name");
   
   console.log(mtype);
   console.log(num);

   $.ajax({
     url : 'selectMemberList.do',
     data : {
        mtype : mtype
    },
    success : function(data){
        
		$table = $('#tab'+num+' table tbody');
		
		$table.empty();
		
		for(var i in data){
			var $tdMno = $('<td id="mno">').text(data[i].mno);
			var $trBoard = $('<tr>');
			var $tdMid = $('<td>').text(data[i].mid);
			var $tdMname = $('<td>').text(data[i].mname);
			var $tdEmail = $('<td>').text(data[i].email);
			
			if(mtype == "m"){
				if(data[i].gender != null){
					var $tdGender = $('<td>').text(data[i].gender);
				} else {
					var $tdGender = $('<td>').text("-");
				}
				
				if(data[i].age != 0){
					var $tdAge = $('<td>').text(data[i].age);
				} else {
					var $tdAge = $('<td>').text("-");
				}
				
				var $tdJoinDate 
				= $('<td>').text(moment(new Date(data[i].joinDate)).format('YYYY-MM-DD'));
			
				if(data[i].dropDate == null){
					var $tdDropDate = $('<td>').text("정상");		
				} else {
					var $tdDropDate = $('<td>').text("탈퇴");
					$tdDropDate.css('color', 'red');
				}
				
				$trBoard.append($tdMno).append($tdMid).append($tdMname).append($tdEmail).append($tdGender).append($tdAge)
				.append($tdJoinDate).append($tdDropDate);	
				
				$table.append($trBoard);
			
			} else if(mtype == "c"){

				var aname = data[i].aname;
				
				if(typeof aname == "string"){
					aname = data[i].aname.substr(0,4);
				} else {
					aname = "권한 없음"
				}
				
				console.log(aname);
				
				var $tdAuthority = $('<td name="aname">').text(aname);
				var $tdGrantDate = $('<td>').text(moment(new Date(data[i].grantDate)).format('YYYY-MM-DD'));
				
				if(data[i].atake == "Y"){
					$tdAuthority = $('<td>').text(aname);
				} else if(data[i].reqDate != null && data[i].atake == "N" && data[i].delflag == "N") {
					$tdAuthority = $('<td>').text(aname);
					$tdGrantDate = $('<td name="aname">').html("<button name='requestBtn'>요청확인</button>") 
				} else if(data[i].reqDate == null) {
					$tdAuthority = $('<td>').text("권한 없음");
					$tdGrantDate = $('<td>').text("-");
				} else if (data[i].delflag == "Y"){
					$tdAuthority = $('<td>').text("요청 거부");
					$tdGrantDate = $('<td>').text("-");
					
					$tdAuthority.css('color', 'red');
				}
				
				var $tdJoinDate 
				= $('<td>').text(moment(new Date(data[i].joinDate)).format('YYYY-MM-DD'));
			
				if(data[i].dropDate == null){
					var $tdDropDate = $('<td>').text("정상");		
				} else {
					var $tdDropDate = $('<td>').text("탈퇴");
					$tdDropDate.css('color', 'red');
				}

				$trBoard.append($tdMno).append($tdMid).append($tdMname).append($tdEmail)
				.append($tdAuthority).append($tdGrantDate).append($tdJoinDate).append($tdDropDate);	
				
				$table.append($trBoard);
				
			} else {
				
				if(data[i].gender != null){
					var $tdGender = $('<td>').text(data[i].gender);
				} else {
					var $tdGender = $('<td>').text("-");
				}
				
				if(data[i].age != 0){
					var $tdAge = $('<td>').text(data[i].age);
				} else {
					var $tdAge = $('<td>').text("-");
				}
				
				if(data[i].dropDate == null){
					var $tdDropDate = $('<td>').text("정지");
					$tdDropDate.css('color', 'red');
				} else {
					var $tdDropDate = $('<td>').text("탈퇴");
					$tdDropDate.css('color', 'red');
				}
				
				var today = moment(new Date()).format('YYYY-MM-DD');
				var endDate = moment(new Date(data[i].endDate)).format('YYYY-MM-DD');
				
				var $tdEndDate = $('<td>').text(endDate);
			
				var $tdReason = $('<td>').text(data[i].reason);
				
				if(endDate > today){
					var $tdClear = $('<td>').html('<button name="clearBlackBtn">해제</button>');
				} else {
					var $tdClear = $('<td>').text('해제됨');
				}
				
				$trBoard.append($tdMno).append($tdMid).append($tdMname).append($tdEmail)
				.append($tdGender).append($tdAge).append($tdDropDate).append($tdEndDate)
				.append($tdReason).append($tdClear);	
				
				$table.append($trBoard);
			}
		
		}
		
		$('button[name="requestBtn"]').click(function(){
			 var mno = $(this).parent().siblings().eq(0).text();
			 window.open("grantPermission.go?mno="+mno, "승인 페이지", "width=600, height=600");
		});
		
		$('button[name="clearBlackBtn"]').click(function(){
			var mno = $(this).parent().siblings().eq(0).text();
			window.open("selectBlackList.go?mno="+mno, "블랙리스트 해제", "width=600, height=600");
		});
		
    $('#tab' + num + ' table tbody').children().mouseenter(function () {
		$(this).children().css({'background':'rgba(221, 221, 221, 0.685)'});
		$(this).children().click(function () {
			var mno = $(this).parent().children().eq(1).text()
		});
			
	}).mouseleave(function () {
		$(this).children().css({'background':'white'});
	});
    
    }, error : function(data){
		console.log("회원 조회 실패!! \n data : " + data);
	}
  });
  
  $.ajax({
	url : 'statistics.do',
	success : function(data){
		
		var chart = bb.generate({
		    bindto: "#chart1",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "pie",
		        columns: [
		            ["여성 회원", data[0]["여성 회원수"]],
		            ["남성 회원", data[0]["남성 회원수"]],
		            ["기타", data[0]["기타 회원수"]]
		        ]
		    }
		});
		
		var chart = bb.generate({
		    bindto: "#chart2",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "pie",
		        columns: [
		            ["10대", data[1]["10대 회원수"]],
		            ["20대", data[1]["20대 회원수"]],
		            ["30대", data[1]["30대 회원수"]],
		            ["40대", data[1]["40대 회원수"]],
		            ["기타", data[1]["기타 회원수"]]
		        ]
		    }
		});
		
		var chart = bb.generate({
		    bindto: "#chart3",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "bar",
		        columns: [
		            ["전체 회원수", data[2]["전체 회원수"]],
		            ["현재 회원수", data[2]["현재 회원수"]],
		            ["탈퇴 회원수", data[2]["탈퇴 회원"]]
		        ]
		    }
		});
		
		// 일별로 여러개 조회해서 불러올 것
		/*var chart = bb.generate({
		    bindto: "#chart4",
		    data: {
		        type: "bar",
		        columns: [
		            ["총 방문자", data[0]],
		            ["오늘 방문자", data[1]],
		            ["평균 방문자", data[2]]
	         ]
		    }
		});*/
		
		/*var chart = bb.generate({
		    bindto: "#chart4",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "line",
		        columns: [
		            
	         ]
		    }
		});*/
		
		var chart = bb.generate({
		    bindto: "#chart4",
		    size: {
		        height: 360,
		        width: 480
		    },
		    data: {
		        type: "bar",
		        columns: [
		        	["전체 게시글", data[3]["전체 게시글 수"]],
		            ["오늘 자 게시글", data[3]["오늘 등록된 게시글"]],
		        	["자유 게시판", data[3]["자유 게시글 수"]],
		            ["정보 공유 게시판", data[3]["정보공유 게시글 수"]],
		            ["여행 후기 게시판", data[3]["여행후기 게시글 수"]],
		            ["질문 게시판", data[3]["질문 게시글 수"]]
	         ]
		    }
		});
		
		$('div[id^="chart"').attr('style', 'position: relative; display:block; float:left; margin: 30px;');
				
		}, error : function(data){
			console.log("회원 조회 실패!! \n data : " + data);
		}
	});
  
});

$('#search').click(function(){
   
   var keyword = $('#keyword').val()
   
   if(keyword == null || keyword == ""){
	   alert("검색어를 입력해주세요.");
	   $('#keyword').focus();
   } else {
	   
	   $('#resultArea').show();
	   $('#listArea').hide();
	   
	   $.ajax({
		   url : 'searchMember.do',
		   data : {
			   condition : $('#searchCondition').val(),
			   keyword : keyword
		   },
		   success : function(data){
			   
			   $table = $('#resultArea table tbody');
			   
			   $table.empty();
			   
			   if(data.length == 0){
				   var $trBoard = $('<tr>');
				   var $tdNull = $('<td colspan="9">').text("검색 결과가 없습니다.");
				   
				   $trBoard.append($tdNull);
				   
				   $table.append($trBoard);
				   
			   } else{
				   
				   for(var i in data){
					   
					   if(data[i].mtype == "M"){
						   var $tdMtype = $('<td>').text("일반");	
					   } else {
						   var $tdMtype = $('<td>').text("기업");	
					   }	
					   var $tdMno = $('<td id="mno">').text(data[i].mno);
					   var $trBoard = $('<tr>');
					   var $tdMid = $('<td>').text(data[i].mid);
					   var $tdMname = $('<td>').text(data[i].mname);
					   var $tdEmail = $('<td>').text(data[i].email);
					   
					   if(data[i].gender != null){
						   var $tdGender = $('<td>').text(data[i].gender);
					   } else {
						   var $tdGender = $('<td>').text("-");
					   }
					   
					   if(data[i].age != 0){
						   var $tdAge = $('<td>').text(data[i].age);
					   } else {
						   var $tdAge = $('<td>').text("-");
					   }
					   
					   var $tdJoinDate 
					   = $('<td>').text(moment(new Date(data[i].joinDate)).format('YYYY-MM-DD'));
					   
					   if(data[i].dropDate == null){
						   var $tdDropDate = $('<td>').text("정상");		
					   } else {
						   var $tdDropDate = $('<td>').text("탈퇴");
						   $tdDropDate.css('color', 'red');
					   }
					   
					   $trBoard.append($tdMtype).append($tdMno).append($tdMid).append($tdMname).append($tdEmail).append($tdGender).append($tdAge)
					   .append($tdJoinDate).append($tdDropDate);	
					   
					   $table.append($trBoard);
					   
				   }
			   }
			   
		   }, error : function(data){
			   var $trBoard = $('<tr>');
			   var $tdNull = $('<td colspan="5">').text("검색 결과가 없습니다.");
			   
			   $trBoard.append($tdNull)
			   
		   }
	   });
   }
});
});