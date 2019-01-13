function deleteNote() {
	var ans = confirm("삭제하시겠습니까?");
	if (!ans) return;
	var meId="${message.meId}";
	$.ajax({
		url : '/message.deleteOne',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'meId':meId
	    },
	    success : function(data) {
	    	alert("쪽지를 성공적으로 삭제했습니다!");
	    	window.location.href ="/popUp.store";
	    },
	    error : function() { 
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function sendReply(){
	var url = "/popUp.write?"+$(".sender").text();
	window.location.href = url;
}