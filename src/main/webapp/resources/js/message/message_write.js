	function sendMessage() {
		var fmObj = document.getElementById("fmNoteWrite");
		if (fmObj.nick.value.trim() == '') { alert("받는 사람을 적어주세요."); fmObj.nick.focus(); return; }
		if (fmObj.title.value.trim() == '') { alert("쪽지 제목을 적어주세요."); fmObj.title.focus(); return; }
		if (fmObj.content.value.trim() == '') { alert("쪽지 내용을 적어주세요."); fmObj.content.focus(); return; }
		
		$.ajax({
			url : '/message.write',
		    type : 'post',
		    traditional:true,
		    data : {
		    	'nick':fmObj.nick.value.trim(),
		    	'title':fmObj.title.value.trim(),
		    	'content':fmObj.content.value.trim()
		    },
		    success : function(data) {
		    	if(data=='common/redirect'){
		    		alert('차단한 회원에게는 쪽지를 보낼 수 없습니다.');
			    	window.location.href ="/popUp.write";
		    	}else{
		    		alert('성공적으로 쪽지를 전송했습니다!');
		    		window.location.href ="/popUp.inbox";
		    	}
		    	
		    },
		    error : function() { 
		    	alert('존재하지 않는 회원입니다.');
		   	}
		});
	}
	
	$("#nick").on("keyup", function(){
        var nick = $(this).val().trim();
        
        if(nick.length<1) {
        	$(".guide.error").hide();
        	$(".guide.ok").hide();
        	return;
        	
        } else {
        	
	        $.ajax({
	            url  : "/nick.find",
	            data : { 
	            	"nick":nick
	            },
	            success : function(data){
	                if(data.isUsable==true){
	                    $(".guide.error").hide();
	                    $(".guide.ok").show();
	                } else {
	                    $(".guide.error").show();
	                    $(".guide.ok").hide();
	                }
	            }, error : function(){
	            	console.log("일시적 문제");
	            }
        	});
     	}
	});
	