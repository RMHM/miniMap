$(function(){
	// 게시물 상세보기
	$('article a').click(function(){
		var bid = $(this).parents('article').find('input:hidden').val();
		location.href = '/board/adBoardView.do?bid=' + bid;
	})
	
	$('#btnSearch').click(function(){
		var type = $('#selSearch').val().trim();
		var keyword = $('#txtFind').val().trim();
		
		if(type=="") alert('검색 유형을 선택하세요.');
		else if(txt == "") alert('검색할 키워드를 입력하세요.');
		else{
			location.href = '/board/adBoardView.do?bid=' + bid;
		}
		
	})
	
})
