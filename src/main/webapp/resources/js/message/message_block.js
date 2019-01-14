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
	$("#chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings('.blocknick').text());
	});
	var mId=$('#mid').text()*1;
	
	$.ajax({
		url : '/message.unblock',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr,
	    	'mId':mId
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

function deleteBlock() {
	var fmObj = document.getElementById("fmNoteData");
	if (!anyChecked(fmObj, "idx_")) { alert("차단 해제할 유저를 선택해 주세요"); return; }

	var ans = confirm("선택된 유저를 차단 해제하시겠습니까?");
	if (!ans) return;

	fmObj.action = 'http://www.inven.co.kr/member/note/block_delete.php';
	fmObj.set.value = 'delete';
	fmObj.submit();
}

function blockMessage(){
	var popUrl = "/block.member";

	var popOption = "width=375, height=265, resizable=no, scrollbars=no, status=no;";

	window.open(popUrl, "", popOption);
}
