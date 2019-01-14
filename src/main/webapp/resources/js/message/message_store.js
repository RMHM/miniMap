
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

function deleteNotes() {

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
	    	window.location.href ="/popUp.store";
	    },
	    error : function() { 
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function selectDetailStore(value){
	var meId=value
	var url="/detail.store?"+meId;
	window.location.href=url;
}