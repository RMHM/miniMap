$(document).ready(function(){
	$('#blocknick').focus();
});

$(function() {
	$('.remaining').each(function() {
		var $count = $('.count', this);
		var $input = $('#comment');
		var maximumCount = $count.text() * 1;
		var update = function() {
			var before = $count.text() * 1;
			var now = maximumCount - $input.val().length;
			if (now < 0) {
				var str = $input.val();
				alert('글자 입력수를 초과하였습니다.');
				$input.val(str.substr(0, maximumCount));
				now = 0;
			}
			if (before != now) {
				$count.text(now);
			}
		};
		$input.bind('input keyup paste', function() {
			setTimeout(update, 0)
		});
		update();
	});
});


$("#blocknick").on("keyup", function(){
    var nick = $(this).val().trim();
    
    if(nick.length<1) {
    	$(".checkNick.error").hide();
    	$(".checkNick.ok").hide();
    	return;
    	
    } else {
    	
    	$('.cover').hide();
    	
        $.ajax({
            url  : "/nick.find",
            data : { 
            	"nick":nick
            },
            success : function(data){
                if(data.isUsable==true){
                    $(".checkNick.error").hide();
                    $(".checkNick.ok").show();
                } else {
                    $(".checkNick.error").show();
                    $(".checkNick.ok").hide();
                }
            }, error : function(){
            	console.log("일시적 문제");
            }
    	});
 	}
});

function banMessage(){
	
	var mNick=$('#blocknick').val().trim();
	
	if(mNick=='사이트관리자'){
		alert('사이트관리자는 차단할 수 없습니다.');
	}else if(mNick==$('.mNick').text()){
		alert('자기 자신은 차단할 수 없습니다.');
	}else{
		
		var mNo=$('#mNo').text()*1;
		var content=$('#comment').val();
		
		console.log(mNo+" "+mNick+" "+content);
		
		$.ajax({
			url : '/message.ban',
		    type : 'post',
		    traditional:true,
		    data : {
		    	'mNo':mNo,
		    	'mNick':mNick,
		    	'content':content
		    },
		    success : function(data) {
		    	alert('쪽지를 차단했습니다.');
		    	opener.parent.location.reload();
		    	window.close();
		    },
		    error : function() {
		    	alert("해당하는 회원이 존재하지 않습니다.");
		   	}
		});
	}
}