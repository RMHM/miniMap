

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

function deleteMessage(){
	var arr=new Array();
	var idx=0;
	$("#chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings('#meid').text())*1;
	});
	
	$.ajax({
		url : '/message.delete',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr
	    },
	    success : function(data) {
	    	alert('쪽지를 성공적으로 삭제했습니다!');
	    	window.location.href ="/popUp.inbox";
	    },
	    error : function() {
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function storeMessage(){
	var arr=new Array();
	var idx=0;
	$("#chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings("#meid").text())*1;
	});
	
	$.ajax({
		url : '/message.store',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr
	    },
	    success : function(data) {
	    	alert('보관함에 쪽지를 보관했습니다!');
	    	window.location.href ="/popUp.inbox";
	    },
	    error : function() { 
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function readAllMessage(){
	var nick="${member.mnick}";
	console.log(nick);
	$.ajax({
		url : '/message.allread',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'nick':nick
	    },
	    success : function(data) {
	    	window.location.href ="/popUp.inbox";
	    },
	    error : function() { 
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function selectDetailInbox(value){
	var meId=value
	var url="/detail.inbox?"+meId;
	window.location.href=url;
}