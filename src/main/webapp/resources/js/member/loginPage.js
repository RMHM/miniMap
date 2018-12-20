$(function(){
	$('#btLogin').click(function(e){
		var result = null;
		
		if($('#mid').val().length<4) {
			alert('아이디를 4자 이상 입력하세요.');
			e.preventDefault();
		}
		else if($('#mpw').val().length<4) {
			alert('비밀번호를 4자 입력하세요');
			e.preventDefault();
		}
	})
	
	$('#btFind').click(function(){
		location.href = "/member/infoFindPage.go";
	})
})