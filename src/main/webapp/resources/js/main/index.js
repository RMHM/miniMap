$(function(){
	
	$.ajax({
		url : "/board/recentBoard.do",
		data : {},
		success : function(result){
			
			$('#thumbs').html('');
			
			var imgPath = [];
			var title = [];
			var content = [];
			var bid = [];
			
			for(var i=0; i<result.length; i++){
				bid[i] = result[i].bid;
				imgPath[i] = result[i].bcontent.substring(result[i].bcontent.indexOf('/resources/img/'), 
						result[i].bcontent.indexOf(String.fromCharCode(34), result[i].bcontent.indexOf('/resources/img/')));
				title[i] = result[i].btitle;
				content[i] = result[i].bcontent.replace(/<.*?>/gi, '');
				
				$li = $('<li>').attr({
									'class' : ((i>0)?'item-thumbs ':'')+'col-lg-3'+((i<2)?' design':' photography'),
									'data-id' : 'id-'+i,
									'data-type' : ((i==0)?'web':((i==2)?'icon':'illustrator'))
								});
				$div = $('<div>').attr({'class' : 'item-thumbs'});
				var a = $('<a>').attr({
					'class' : 'hover-wrap fancybox',
					'data-fancybox-group' : 'gallery',
					'title' : result[i].btitle
				})
				$span1 = $('<span>').attr({'class' : 'overlay-img'});
				$span2 = $('<span>').attr({'class' : 'overlay-img-thumb font-icon-plus'});
				$(a).append($span1).append($span2);
				$img = $('<img>').attr({
					'src' : imgPath[i],
					'alt' : content[i]
				})
				$div.append($(a)).append($img);
				$li.append($div);
				
				$('#thumbs').append($li);
				
				$(a).click(function(){
					var id = $(this).parents('li').attr('data-id').substring(3,4);
					
					$div1 = $('<div>').attr({
						'class' : 'fancybox-overlay fancybox-overlay-fixed',
						'style' : 'width: auto; height: auto; display: block;'
					})
					$div2 = $('<div>').attr({
						'class' : 'fancybox-wrap fancybox-desktop fancybox-type-image fancybox-opened',
						'tabindex' : -1,
						'style' : 'width: 800px; height: auto; position: absolute; top: 10%; left: 30%; opacity: 1; overflow: visible;'
					})
					$div3 = $('<div>').attr({
						'class' : 'fancybox-skin',
						'style' : 'padding: 0px; width: auto; height: auto;'
					})
					
					//
					$div31 = $('<div>').attr({'class' : 'fancybox-outer'});
					
					$div311 = $('<div>').attr({
						'class' : 'fancybox-inner',
						'style' : 'overflow: visible; width: 800px; height: 600px;'
					})
					$div311img = $('<img>').attr({
						'class' : 'fancybox-image',
						'src' : imgPath[id],
						'alt' : ''
					})
					$div311.append($div311img);
					
					$div31a1 = $('<a>').attr({
						'class' : 'fancybox-nav fancybox-prev',
						'title' : 'Previous',
						'href' : 'javascript:;'
					});
					$div31a1i = $('<span>').append($('<i>').attr({'class' : 'font-icon-arrow-simple-left'}))
					
					$div31a1.append($div31a1i)
					
					
					$div31a2 = $('<a>').attr({
						'class' : 'fancybox-nav fancybox-next',
						'title' : 'Next',
						'href' : 'javascript:;'
					})
					$div31a2i = $('<span>').append($('<i>').attr({'class' : 'font-icon-arrow-simple-right'}))
					$div31a2.append($div31a2i);
					
					$div31.append($div311).append($div31a1).append($div31a2);
					
					//
					$div32 = $('<div>').attr({'class' : 'fancybox-title fancybox-title-inside-wrap'});
					$div32h = $('<h4>').text(title[id]);
					$div32p1 = $('<p>').text(content[id]);
					$div32p2 = $('<a>').attr({
						'href' : '/board/adBoardView.do?bid='+bid[id]
					}).text('자세히보러가기');
					$div32.append($div32h).append($div32p1).append($div32p2);
					
					//
					$div3a = $('<a>').attr({
						'class' : 'fancybox-item fancybox-close',
						'title' : 'Close'
					});
					$div3ai = $('<i>').attr({'class' : 'font-icon-remove'});
					$div3a.append($div3ai);
					
					$div3.append($div31).append($div32).append($div3a);
					$div2.append($div3);
					$div1.append($div2);
					
					$('body').attr({
						'class' : 'fancybox-lock',
						'style' : 'margin-right: 17px;'
					})
					$('body').append($div1);
					
					// close 누를 시
					$('.fancybox-item.fancybox-close').click(function(){
						$('.fancybox-overlay.fancybox-overlay-fixed').remove();
						$('body').removeClass();
						$('body').removeAttr('style');
					})
					// 좌우버튼
					$('.fancybox-nav').click(function(e){
						var con = $(this).attr('title');
						var obj;
						
						if(con == 'Next') obj = $('#thumbs').find('li[data-id="id-'+((Number(id)+1)%i)+'"]');
						else if(con == 'Previous') obj = $('#thumbs').find('li[data-id="id-'+((Number(id)+(i-1))%i)+'"]');
						
						$('.fancybox-item.fancybox-close').click();
						$(obj).find('a').click()
					})
					
					// 흐릿한 영역 선택시
					$('.fancybox-overlay').click(function(e){
						if($(e.target).hasClass('fancybox-overlay')) $('.fancybox-item.fancybox-close').click();
					})
				})
			}
			
		},
		error : function(result){
			console.log(result);
		}
	})
	
})