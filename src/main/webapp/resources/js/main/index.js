$(function(){
	
	$.ajax({
		url : "/board/recentBoard.do",
		data : {},
		success : function(result){
			console.log(result)
			$('#thumbs').html('');
			
			if(result.length>0){
				for(var i=0; i<result.length; i++){
					
					var imgPath = result[i].bcontent.substring(result[i].bcontent.indexOf('/resources/img/'), 
							result[i].bcontent.indexOf(String.fromCharCode(34), result[i].bcontent.indexOf('/resources/img/')));
					
					$li = $('<li>').attr({
										'class' : ((i>0)?'item-thumbs ':'')+'col-lg-3'+((i<2)?' design':' photography'),
										'data-id' : 'id-'+i,
										'data-type' : ((i==0)?'web':((i==2)?'icon':'illustrator'))
									});
					$div = $('<div>').attr({'class' : 'item-thumbs'});
					$a = $('<a>').attr({
						'class' : 'hover-wrap fancybox',
						'data-fancybox-group' : 'gallery',
						'title' : result[i].btitle,
						'href' : imgPath
					})
					$span1 = $('<span>').attr({'class' : 'overlay-img'});
					$span2 = $('<span>').attr({'class' : 'overlay-img-thumb font-icon-plus'});
					$a.append($span1).append($span2);
					
					var a = "<br><a href='/board/boardview.do?BId="+ result[i].bid+"'>자세히 보러가기</a>"
					
					$img = $('<img>').attr({
						'src' : imgPath,
						'alt' : result[i].bcontent.replace(/<.*?>/gi, '')+a
					})
					$div.append($a).append($img);
					$li.append($div);
					
					$('#thumbs').append($li);
				}
			} else {
				$('#thumbs').html("<h5>이미지가 포함된 게시물을 등록해보시는건 어떠세요? <a href='/board/boardlist3.do'>게시판 바로가기</a></h5>")
			}
			
			
		},
		error : function(result){
			console.log(result);
		}
	})
	
})