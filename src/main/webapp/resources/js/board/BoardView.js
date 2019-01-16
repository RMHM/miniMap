// 댓글 추가 버튼 눌렀을시 추가 div 생성

function updateReply(obj) {
	
	// 다른 버튼 숨기기.
	$(obj).siblings('#delteBtn').css('display', 'none');
	$(obj).siblings('#reinsert').css('display', 'none');
	
	var t = $(obj).parents('tr').find('td').eq(1).find('p').html().trim().replace(/\<br\>/gim, '\n');
	console.log(t)
	$(obj).parents('tr').find('td').eq(1).find('p').remove();
	$(obj).parents('tr').find('td').eq(1).append($('<textarea>').attr({'style':'height:50px; background:white'}).text(t));
	
	// 수정 완료 버튼을 화면 보이게 하기
	$(obj).siblings('#updateBtn2').css('display', 'inline');

	// 수정하기 버튼 숨기기
	$(obj).css('display', 'none');			
	
}

function updateConfirm(obj, bid, bCode) {
	// 댓글의 내용 가져오기
	var content = $(obj).parent().parent().prev().find('textarea').val().replace(/\n/gim, '<br>');
	
	// 댓글의 번호 가져오기
	var cid = $(obj).siblings('input').val();
	
	// 게시글 번호 가져오기
	location.href = "/coment/comentUpdate.do?" + "cid=" + cid + "&bid="
			+ bid + "&ccontent=" + content + "&bCode=" + bCode;
}


function deleteReply(obj, bid, bCode) {
	// 댓글의 번호 가져오기	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		var cid = $(obj).siblings('input').val();

		location.href = "/coment/comentDelete.do" + "?cid=" + cid + "&bCode=" + bCode
	}else{   //취소
	    return;
	}
}

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
		'style' : 'background : white;'
	})
	$td2.append($textArea);
	
  $td3 = $('<td>').attr({'width' : ''});
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
  //$(obj).parents('tr').find('td').eq(1).attr({'colspan' : '2'});
	//$(obj).parents('tr').find('td').eq(2).remove();
}

function reConfirm(obj, bid, mno, bcode) {
	// 댓글의 내용 가져오기

	// 참조할 댓글의 번호 가져오기
	var cref = $(obj).siblings('input[name="recref"]').val();
	var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
	

	var parent = $(obj).parent();
	var grandparent = parent.parent();
	var siblingsTR = grandparent.siblings().last();

	var content = grandparent.siblings().find('textarea[name="recontent"]').val().replace(/\n/gim, '<br>');			

	// writer, replyContent
	// bid, refcid, clevel	
	
	if(content == null || content.length < 1){
		alert('댓글을 입력해 주셔야 합니다.');				
	}else{
		location.href = '/coment/comentAdd2.do' + '?BId=' + bid
		+'&ccontent=' + content + '&mno=' + mno + '&cref=' + cref
				+ '&clevel=' + level + "&bCode=" + bcode;
		
	}
	
}

function sendNote(nick){
	var popUrl = "/popUp.write?"+nick;	//팝업창에 출력될 페이지 URL

	var popOption = "width=765, height=485, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

	window.open(popUrl,"",popOption);
}	



// 신고 버튼 눌렀을 경우
function report(mno, tid){
	var re = $('#insertReport').serializeArray();
	
	if(re.length<5) {
		alert("신고 대상과 신고 사유를 모두 선택해주세요.");
	} else {
		if(re[2].name == 'target_type' && re[2].value == 'M') re[0].value = mno;
		else if(re[2].name == 'target_type' && (re[2].value == 'B' || re[2].value == 'C')) re[0].value = tid;	
		$.ajax({
			url : "/report/insertReport.do",
			data :re,
			contentType: "application/json", 
			dataType : "json",
			success : function(data) {
				alert(data.msg);
			},
			error : function(e) {
				alert("신고 실패");
			},
			complete : function(){
        $('#insertReport')[0].reset();
				$('#btnCancel').click();
			}
		});
		
	}
}
/*
$(function(){
	$('#addReply').click(function(e){
		if($(this).parents('tr').find('textarea').val().trim() == ""){
			alert('댓글 내용을 입력해주세요.')
			$(this).parents('tr').find('textarea').focus();
			e.preventDefault();
		}
	})
	
});*/

// modal 생성 및 띄워주기
function reportModal(mno, tid, type){
	$('#insertReport').remove();
	
	$form = $('<form>').attr({'method' : 'post', 'id' : 'insertReport'});
	$divFade = $('<div>').attr({
		'class' : 'modal fade',
		'id' : 'report-modal-container',
		'role' : 'dialog',
		'aria-labelledby' : 'myModalLabel',
		'aria-hidden' : 'true'
	})
	$divDialog = $('<div>').attr({'class' : 'modal-dialog', 'role' : 'document'});
	$divContent = $('<div>').attr({'class' : 'modal-content'});
	
	$divHeader = $('<div>').attr({'class' : 'modal-header'});
	$hTitle = $('<h5>').attr({'class' : 'modal-title', 'id' : 'myModalLabel'}).text('신고하시겠습니까?');
	$button = $('<button>').attr({
		'type' : 'button',
		'class' : 'close',
		'data-dismiss' : 'modal'
	}).html('<span aria-hidden="true">×</span>');
	$divHeader.append($hTitle).append($button);
	
	$divBodyAll = $('<div>').attr({'class' : 'modal-body'});
	
	$divHidden = $('<div>');
	$hidden1 = $('<input>').attr({
		'type' : 'hidden',
		'id' : 'target_id',
		'name' : 'target_id'
	})
	$hidden2 = $('<input>').attr({
		'type' : 'hidden',
		'id' : 'report_mno',
		'name' : 'report_mno',
		'value' : mno
	})
	$divHidden.append($hidden1).append($hidden2);
	
	$divBody1 = $('<div>').attr({'class' : 'modal-body'});
	$divContent11 = $('<div>').attr({'class' : 'modal-content'}).append($('<label>').text('신고 대상'));
	$divContent12 = $('<div>').attr({'class' : 'modal-content'});
	$input11 = $('<input>').attr({'type' : 'radio', 'name' : 'target_type', 'value' : 'M' }).after($('<label>').text('작성자'));
	$input12 = null;
	if(type=='B'){
		$input12 = $('<input>').attr({'type' : 'radio', 'name' : 'target_type', 'value' : 'B' }).after($('<label>').text('게시글'));
	} else if(type=='C'){
		$input12 = $('<input>').attr({'type' : 'radio', 'name' : 'target_type', 'value' : 'C' }).after($('<label>').text('댓글'));
	}
	$divBody1.append($divContent11).append($divContent12.append($input11).append($input12));
	
	$divBody2 = $('<div>').attr({'class' : 'modal-body'});
	$divContent21 = $('<div>').attr({'class' : 'modal-content'}).append($('<label>').text('신고 사유'));
	$divContent22 = $('<div>').attr({'class' : 'modal-content'});
	$input21 = $('<input>').attr({'type' : 'radio', 'name' : 'rcode', 'value' : '1' }).after($('<label>').text('욕설'));
	$input22 = $('<input>').attr({'type' : 'radio', 'name' : 'rcode', 'value' : '2' }).after($('<label>').text('도배'));
	$input23 = $('<input>').attr({'type' : 'radio', 'name' : 'rcode', 'value' : '3' }).after($('<label>').text('사칭'));
	$input24 = $('<input>').attr({'type' : 'radio', 'name' : 'rcode', 'value' : '4' }).after($('<label>').text('비방'));
	$input25 = $('<input>').attr({'type' : 'radio', 'name' : 'rcode', 'value' : '5' }).after($('<label>').text('조작'));
	$input26 = $('<input>').attr({'type' : 'radio', 'name' : 'rcode', 'value' : '6' }).after($('<label>').text('기타'));
	$divContent22.append($input21).append($input22).append($input23).append($input24).append($input25).append($input26);
	$divBody2.append($divContent21).append($divContent22);
	
	$divBody3 = $('<div>').attr({'class' : 'modal-body'});
	$divContent31 = $('<div>').attr({'class' : 'modal-content'}).append($('<label>').text('상세 내용'));
	$divContent32 = $('<div>').attr({'class' : 'modal-content'});
	$textarea = $('<textarea>').attr({'name' : 'rdetail', 'id' : 'rdetail', 'rows' : '10', 'style' : 'width:100%; height:100%;'});
	$divBody3.append($divContent31).append($divContent31.append($textarea));
	$divBodyAll.append($divHidden).append($divBody1).append($divBody2).append($divBody3);
	
	$divFooter = $('<div>').attr({'class' : 'modal-footer'});
	$inputBtn1 = $('<input>').attr({
		'type' : 'button',
		'value' : '신고하기',
		'class' : 'btn',
		'id' : 'reportbtn',
		'data-dismiss' : '',
		'onclick' : 'report(' + mno + ', ' + tid +')'
	})
	$inputBtn2 = $('<input>').attr({
		'type' : 'button',
		'id' : 'btnCancel',
		'value' : '취소',
		'class' : 'btn-secondary',
		'data-dismiss' : 'modal'
	})
	$divFooter.append($inputBtn1).append($inputBtn2);
	
	$form.append($divFade.append($divDialog.append($divContent.append($divHeader).append($divBodyAll).append($divFooter))));
	
	$('body').append($form);
	
	$('#report-modal').attr({
		'data-toggle' : 'modal',
		'role' : 'button',
		'href' : '#report-modal-container'	
	})
	
	$('#report-modal').click();
}