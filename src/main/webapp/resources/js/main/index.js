$(function() {

	$.ajax({
		url : "/board/recentBoard.do",
		data : {
			'bCode' : 3,
			'maxNum' : 4
		},
		success : function(result) {
			console.log(result)
			$('#thumbs').html('');

			if (result.length > 0) {
				for (var i = 0; i < result.length; i++) {

					var imgPath = result[i].bcontent.substring(result[i].bcontent.indexOf('/resources/img/'), result[i].bcontent.indexOf(String.fromCharCode(34), result[i].bcontent.indexOf('/resources/img/')));

					$li = $('<li>').attr(
							{
								'class' : ((i > 0) ? 'item-thumbs '
										: '')
										+ 'col-lg-3'
										+ ((i < 2) ? ' design'
												: ' photography'),
												'data-id' : 'id-' + i,
												'data-type' : ((i == 0) ? 'web'
														: ((i == 2) ? 'icon'
																: 'illustrator'))
							});
					$div = $('<div>').attr({
						'class' : 'item-thumbs'
					});
					$a = $('<a>').attr({
						'class' : 'hover-wrap fancybox',
						'data-fancybox-group' : 'gallery',
						'title' : result[i].btitle,
						'href' : imgPath
					})
					$span1 = $('<span>').attr({
						'class' : 'overlay-img'
					});
					$span2 = $('<span>').attr({
						'class' : 'overlay-img-thumb font-icon-plus'
					});
					$a.append($span1).append($span2);

					var a = "<br><a href='/board/boardview.do?BId=" + result[i].bid + "'>자세히 보러가기</a>"

						$img = $('<img>').attr(
								{
									'src' : imgPath,
									'alt' : result[i].bcontent.replace(/<.*?>/gi, '') + a
								})
								$div.append($a).append($img);
					$li.append($div);

					$('#thumbs').append($li);
				}
			} else {
				$('#thumbs')
				.html(
				"<h5>이미지가 포함된 게시물을 등록해보시는건 어떠세요? <a href='/board/boardlist3.do'>게시판 바로가기</a></h5>")
			}

		},
		error : function(result) {
			console.log(result);
		}
	})

})

/*$(document).ready(function() {

	$.ajax({
		url : "letus/see.timeline",
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			$.each(data, function(i) {
				var dataList = data[i];
				var showTL = "<div class='col-lg-12'>";
				showTL += "<img src='/resources/img/profiles/"
					+ dataList.profile_path + "' style='position:absolute; width:150px; height:150px; left:30px; top:20px;'/>";
				showTL += "<div style='position:absolute; left:100px; bottom:0px;'><strong>" + dataList.mnick + "</strong></div>";
				showTL += "<div style='position:absolute; left:198px; bottom:-55px;'><img src='/resources/img/timeline/dlgTail.png' style='width:40x; height:40px;'/></div>";
				showTL += "<div style='background:white; width:50%; height:150px; position:absolute; left:230px; bottom:-170px;'><span style='margin-top:10px; margin-bottom:10px;'>" + dataList.tcontent + "</span></div>";
				showTL += "</div>";
				
				//
				$allDiv = $('<div>').attr({'class':'col-lg-12'});
				$img = $('<img>').attr({
						'src' : '/resources/img/profiles/' + dataList.profile_path,
						'style' : 'position:absolute; width:150px; height:150px; left:30px; top:20px;'
					})
				$div1 = $('<div>').attr({
					'style' : 'position:absolute; left:100px; bottom:0px;'
				}).append($('<strong>').text(dataList.mnick))
				$div2 = $('<div>').attr({
					'style' : 'position:absolute; left:198px; bottom:-55px;'
				}).append($('<img>').attr({'src':'/resources/img/timeline/dlgTail.png', 'style':'width:40x; height:40px;'}))
				$div3 = $('<div>').attr({'style':'background:white; width:50%; height:150px; position:absolute; left:230px; bottom:-170px;'})
					.append($('<span>').attr({'style':'margin-top:10px; margin-bottom:10px;'}).text(dataList.tcontent));
				
				$allDiv.append($img).append($div1).append($div2).append($div3);
				
//				$('#siltaja').append(showTL);
//				$('#siltaja').append($allDiv);
				
			});

			$("#siltaja").trigger("click");
		}
	});

});*/

/*$(document).ready(function(){

	$(document).on('click','#siltaja',function(){
		$('#siltaja').flipbox({
			vertical : true,
			autoplay : true,
			autoplayWaitDuration : 4000,
			autoplayPauseOnHover : false,
			animationDuration : 1000,
			animationEasing : 'ease'
		});
	})

});*/


$(document).ready(function() {
	$.ajax({
		url : "/board/recentBoard.do",
		data : {
			"bCode" : 5,
			"maxNum" : 10
		},
		success : function(result){
			console.log(result)
			if(result.length > 0){
				result.forEach(function(data){
					var str = "/resources/img";
					var start = 0;
					var imgList = [];
					
					var begin = data.bcontent.indexOf(str);
					var end = data.bcontent.indexOf(String.fromCharCode(34), begin);
					var imgName = data.bcontent.substring(begin, end);
					var tmpTxt = data.bcontent.replace(/<\/p>/gim, '\n').replace(/<.*?>/gim, '').replace(/\n/gim, '<br>').replace(/^(<br>)*/, '');
					var num = 100;
					var content = tmpTxt.substr(0, ((tmpTxt.length>num)?num:tmpTxt.length)) + "<br>";
					$link = $('<a>').attr({"href":"/board/adBoardView.do?bid="+data.bid}).text("상세보기")
					
					$allDiv = $('<div>').attr({'class':'col-lg-12'});
					$div1 = $('<div>').attr({
						'class':'col-lg-12'
					}).append($('<strong>').html(data.btitle));
					$rowDiv = $('<div>').attr({'class' : 'row'})	
					$div2 = $('<div>').attr({
						'class':'col-lg-6',
						'style' : ''
					}).append($('<img>').attr({'src' : imgName, 'style' : 'width:100%; height:180px;'}));
					$div3 = $('<div>').attr({'style':'background:white; width:100%%; height:auto', 'class':'col-lg-6'})
						.append($('<span>').attr({'style':''}).append(content).append($link));
					
					$rowDiv.append($div2).append($div3)
					$allDiv.append($div1).append($rowDiv);
					
					$('#boardDiv').append($allDiv);
				})
				
				$('#boardDiv').flipbox({
					vertical : true,
					autoplay : true,
					autoplayWaitDuration : 2000,
					autoplayPauseOnHover : false,
					animationDuration : 1000,
					animationEasing : 'ease'
				});
			} else {
				$('#boardDiv').append("현재 등록된 게시물이 없습니다.<br>손쉽고 편리한 광고 등록 어떠신가요?")
			}
			
			
		},
		error : function(result){
			console.log(result);
		}
	})
})

/*$(function() {
	$('#siltaja').flipbox({
		vertical : true,
		autoplay : true,
		autoplayWaitDuration : 1000,
		autoplayPauseOnHover : false,
		animationDuration : 400,
		animationEasing : 'ease'
	});
});*/

