$("#idx_").click(function(){
	if($(this).prop("checked")){
		$("input[name^=index_]").prop('checked', true);
	}else{
		$("input[name^=index_]").prop('checked', false);
	}
});

$("input[name^=index_]").click(function(){
	if($("#idx_").prop("checked")){
		$("#idx_").prop("checked",false);
	}
});

function deleteBlock(){
	var arr=new Array();
	var idx=0;
	$(".chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings('.blocknick').text());
	});
	var mNo=$('#mid').text()*1;
	
	$.ajax({
		url : '/message.unblock',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr,
	    	'mNo':mNo
	    },
	    success : function(data) {
	    	alert('차단을 해제했습니다.');
	    	window.location.href ="/popUp.inbox";
	    },
	    error : function() {
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function blockMessage(){
	var popUrl = "/block.member";

	var popOption = "width=375, height=185, resizable=no, scrollbars=no, status=no; fullscreen=no; tollbar=no; menubar=no;";

	window.open(popUrl, "", popOption);
}
