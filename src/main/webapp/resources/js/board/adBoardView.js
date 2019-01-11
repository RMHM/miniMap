// 댓글 추가 버튼 눌렀을시 추가 div 생성
function updateReply(obj) {
	// 현재 위치와 가장 근접한 textarea 접근하기
	var t = $(obj).parents('tr').find('td').eq(1).find('p').html().trim().replace(/\<br\>/gim, '\n');
	console.log(t)
	$(obj).parents('tr').find('td').eq(1).find('p').remove();
	$(obj).parents('tr').find('td').eq(1).append($('<textarea>').attr({'style':'height:50px'}).text(t));

	// 수정 완료 버튼을 화면 보이게 하기
	$(obj).siblings('#updateBtn2').css('display', 'inline');

	// 수정하기 버튼 숨기기
	$(obj).css('display', 'none');
}

// 댓글 수정하기
function updateConfirm(obj, bid, bCode) {
	// 댓글의 내용 가져오기
	var content = $(obj).parent().parent().prev().find('textarea').val().replace(/\n/gim, '<br>');
	
	// 댓글의 번호 가져오기
	var cid = $(obj).siblings('input').val();
	
	// 게시글 번호 가져오기
	location.href = "/coment/comentUpdate.do?" + "cid=" + cid + "&bid="
			+ bid + "&ccontent=" + content + "&bCode=" + bCode;
}

// 댓글 삭제하기
function deleteReply(obj, bid, bCode) {
	// 댓글의 번호 가져오기
	var cid = $(obj).siblings('input').val();

	location.href = "/coment/comentDelete.do" + "?cid=" + cid + "&bCode=" + bCode
}

// 대댓글 작성란 생성
function reComment(obj, bid, bcode, mnick, mno, cid, clevel) {	
	// 클릭한 버튼 숨기기
	$(obj).css('display', 'none');
	
	// 내용 입력 공간 만들기
	// 1
	$tr = $('<tr>').attr({'class' : 'recomment'});
	$td1 = $('<td>').attr({'width' : '10%'});
	$div1 = $('<div>')
	$b = $('<b>').text(mnick);
	$div1.append($b);
	$td1.append($div1);
	
	$td2 = $('<td>').attr({'style' : 'background : transparent;" width="75%'});
	$textArea = $('<textarea>').attr({
		'class' : 'reply-content',
		'name' : 'recontent',
		'style' : 'background : ivory;'
	})
	$td2.append($textArea);
	
	$td3 = $('<td>').attr({'width' : '15%'});
	$div3 = $('<div>').attr({
		'id' : 'btn',
		'style' : 'text-align: center;',
		'align' : 'center'
	});
	
	$hi1 = $('<input>').attr({
		'type' : 'hidden',
		'name' : 'writer',
		'value' : mno
	});
	$hi2 = $('<input>').attr({
		'type' : 'hidden',
		'name' : 'recref',
		'value' : cid
	});
	$hi3 = $('<input>').attr({
		'type' : 'hidden',
		'name' : 'clevel',
		'value' : clevel
	});
	$btn = $('<input>').attr({
		'type' : 'button',
		'class' : 'btn btn-theme',
		'onclick' : 'reConfirm(this, '+bid+', '+mno+','+bcode+');',
		'value' : '댓글추가 완료'
	})
	$div3.append($btn).append($hi1).append($hi2).append($hi3);
	$td3.append($div3);
	
	$tr.append($td1).append($td2).append($td3);
	
	$(obj).parents('tr').after($tr);
	
	// 추가 완료 버튼을 화면 보이게 하기
	$(obj).siblings('.insertConfirm').css('display', 'inline');
	$(obj).parents('tr').find('td').eq(1).attr({'colspan' : '2'});
	$(obj).parents('tr').find('td').eq(2).remove();
}

function reConfirm(obj, bid, mno, bcode) {
	// 댓글의 내용 가져오기

	// 참조할 댓글의 번호 가져오기
	var cref = $(obj).siblings('input[name="recref"]').val();
	var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;

	var parent = $(obj).parent();
	var grandparent = parent.parent();
	var siblingsTR = grandparent.siblings().last();

	var content = grandparent.siblings().find('textarea[name="recontent"]').val();

	location.href = '/coment/comentAdd2.do' + '?BId=' + bid
	+'&ccontent=' + content + '&mno=' + mno + '&cref=' + cref
			+ '&clevel=' + level + "&bCode=" + bcode; 
}

// 신고 버튼 눌렀을 경우
function report(mno, bid){
					
	var re = $('#insertReport').serializeArray();
	if(re[2].name == 'target_type' && re[2].value == 'B') re[0].value = bid;
	else if(re[2].name == 'target_type' && re[2].value == 'M') re[0].value = mno;
	
	if(re.length<5) {
		alert("신고 대상과 신고 사유를 모두 선택해주세요.");
		
	} else {
		$.ajax({
			url : "/report/insertReport.do",
			data :re, 

			contentType: "application/json", 
			dataType : "json",
			success : function() {
				alert("신고접수 완료");

			},
			error : function(e) {
				alert("신고 실패");
			},
			complete : function(){
				$('#btnCancel').click();
			}
		});
		
	}
}