$(function(){
	// 게시물 상세보기
	$('article a').click(function(){
		var bid = $(this).parents('article').find('input:hidden').val();
		location.href = '/board/adBoardView.do?bid=' + bid;
	})
	
	$('#btnSearch').click(function(){
		var type = $('#selSearch').val().trim();
		var keyword = $('#txtFind').val().trim();
		
    if(type=="" || keyword == "") {
			alert('검색 유형과 키워드를 모두 입력바랍니다.');
			if(keyword==""){
				$('#txtFind').val('');
				$('#txtFind').focus();
			}
		} else{
			location.href = '/board/adBoard.go?type=' + type + '&keyword=' + keyword;
		}
		
	})
	
})
