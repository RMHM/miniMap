<%@
   page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 차단</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="/resources/css/message.css" rel="stylesheet" />
</head>
<body class = "bPopup">
	<div id = "webzineBody">


<div id="reportsWrap">
<form id="fmReport" name="fmReport" method="POST">
<div class="hiddenFields">
<input type="hidden" name="rurl" value="_close"/>
</div>
	<div id="reportsBody">
	<div id="mNo" style="display:none">${mNo}</div>
	<div id="mNick" style="display:none">${mNick}</div>
		<dl>
			<dt>쪽지 차단 닉네임</dt>
			<dd><input type="text" name="blocknick" id="blocknick"/>
				<span class="checkNick ok">O</span>
				<span class="checkNick error">X</span>
				<span class="cover"></span>
			</dd>
		</dl>
		<dl>
			<dt>메모</dt>
			<dd><input type="text" name="comment" id="comment" value="" maxlength="100" /></dd>
		</dl>
		<div class="remaining">
			<span class="count">60</span>
		</div>
		<div id="reportsHelp">
			<div id="reportsHelpTop"></div>
			<div id="reportsHelpMid">쪽지 차단할 경우 해당 유저에게 오는 모든 쪽지를 받을 수 없습니다.</div>
			<div id="reportsHelpBot"></div>
		</div>
		<div id="btnReportsSubmit"><a href="#" onclick="banMessage();">차단하기</a></div>
		<div id="btnReportsClose"><a href="#" onclick="window.close();">닫 기</a></div>
	</div>
</form>
</div>
<!-- <script src="/resources/js/message/askBlock.js"></script> -->
<script>
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
</script>
	</div>
	</body>
</html>