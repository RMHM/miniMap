$(function() {
	$('.remaining').each(function() {
		var $count = $('.count', this);
		var $input = $(this).prev().prev();
		var maximumCount = $count.text() * 1;
		var update = function() {
			var before = $count.text() * 1;
			var now = maximumCount - $input.val().length;
			if (now < 0) {
				var str = $input.val();
				alert('글자 입력수를 초과하였습니다.');
				$input.val(str.substr(0, maximumCount));
				now = 0;
			}
			if (before != now) {
				$count.text(now);
			}
		};
		$input.bind('input keyup paste', function() {
			setTimeout(update, 0)
		});
		update();
	});
});

$(function() {
	$('.remaining2').each(function() {
		var $count = $('.count2', this);
		var $input = $(this).prev().prev();
		var maximumCount = $count.text() * 1;
		var update = function() {
			var before = $count.text() * 1;
			var now = maximumCount - $input.val().length;
			if (now < 0) {
				var str = $input.val();
				alert('글자 입력수를 초과하였습니다.');
				$input.val(str.substr(0, maximumCount));
				now = 0;
			}
			if (before != now) {
				$count.text(now);
			}
		};
		$input.bind('input keyup paste', function() {
			setTimeout(update, 0)
		});
		update();
	});
});

var isScrollUp = false;
var unreadCnt = 0;

var sock = new SockJS("/echo");
sock.onmessage = onMessage;
sock.onclose = onClose;
var today = null;

sock.onopen = function() {
	console.log("tsock open");
	$('#div_chat').animate({
		scrollTop : $('#div_chat').prop('scrollHeight') + 1
	}, 500);
}

$(function() {
	$("#sendBtn").click(function() {
		if ($('#message').val() == '' || $('#message').val() == null) {
			alert('타임라인에 등록할 메세지를 입력해주세요');

		} else {
			if ($("#tag").val() == '' || $('#tag').val() == null) {
				$('#tag').val('제주도');
			}
			if (confirm("정말 게시하시겠습니까?") == false) {
				return false;
			} else {
				console.log("send message.....");
				sendMessage();
				$("#message").val('');
				$('#tag').val('');
				$('.count').text('250');
				$('.count2').text('50');

				if (isScrollUp) {
					unreadCnt++;
					$('#btn_scroll_down').html('↓ ' + unreadCnt);
				}

				if (!isScrollUp) {
					$('#div_chat').animate({
						scrollTop : $('#div_chat').prop('scrollHeight') + 1
					}, 500);
				}
			}

		}

	});
});
function sendMessage() {
	if (sock.readyState === 1) {
		$('#sendBtn').prop('disabled',true);
		sock.send($("#message").val() + "|%%|&" + $("#tag").val());
	} else {
		console.log("메세지 전송 실패(일시적 문제)");
	}

};
function onMessage(evt) {
	var data = evt.data;
	var host = null;
	var strArray = data.split("|%%|&");
	var userName = null;
	var profPath = null;
	var hashTag = null;
	var tId = null;

	if (strArray.length > 1) {
		sessionId = strArray[0];
		message = strArray[1];
		host = strArray[2].substr(1, strArray[2].indexOf(":") - 1);
		userName = strArray[3];
		profPath = strArray[4];
		hashTag = strArray[5];
		tId = strArray[6];
		today = new Date();
		printDate = today.getFullYear() + "/" + today.getMonth() + "/"
				+ today.getDate() + " " + today.getHours() + ":"
				+ today.getMinutes() + ":" + today.getSeconds();

		var ck_host = '${host}';

		var urlProf = "/resources/img/profiles/";
		if (host == ck_host || (host == 0 && ck_host.includes('0:0:'))
				|| (host == 0 && ck_host.includes('127.0.0.1'))) {
			var printHTML = "<li><div class='lastTID' style='display:none'>"
					+ tId
					+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
			printHTML += "<img src='" + urlProf + profPath + "' alt=''></div>";
			printHTML += "<div class='comment-box-me'><div class='comment-head-me'><span class='comment-name '>";
			printHTML += "<a href='#'>" + userName + "&nbsp;(나)"
					+ "</a></span><span>" + printDate + "</span>";
			printHTML += "<a href='#' class='jjokjeeTag'>"
					+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
					+ "</a><a href='#' class='singoTag'>"
					+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
			printHTML += "</div><div class='comment-content'><pre>" + message
					+ "</pre></div>";
			printHTML += "<div class='comment-bottom-me'><i class='fa fa-link'></i>";
			printHTML += "<a href='https://www.google.com/search?q=" + hashTag
					+ "' target='_BLANK'>" + hashTag + "</a>";
			printHTML += "</div></div></div></li>";
			$('.disqusin').append(printHTML);
		} else {
			var printHTML = "<li><div class='lastTID' style='display:none'>"
					+ tId
					+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
			printHTML += "<img src='" + urlProf + profPath + "' alt=''></div>";
			printHTML += "<div class='comment-box'><div class='comment-head'><span class='comment-name '>";
			printHTML += "<a href='#'>" + userName + "</a></span><span>"
					+ printDate + "</span>";
			printHTML += "<a href='#' class='jjokjeeTag'>"
					+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
					+ "</a><a href='#' class='singoTag'>"
					+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
			printHTML += "</div><div class='comment-content'><pre>" + message
					+ "</pre></div>";
			printHTML += "<div class='comment-bottom'><i class='fa fa-link'></i>";
			printHTML += "<a href='https://www.google.com/search?q=" + hashTag
					+ "' target='_BLANK'>" + hashTag + "</a>";
			printHTML += "</div></div></div></li>";
			$('.disqusin').append(printHTML);

		}
		
		$(document).off('click','.jjokjeeTag');
		$(document).off('click','.singoTag');

		$(document).on('click','.jjokjeeTag',function(){
			sendNote($(this).siblings('.comment-name').children('a').text());
		});
		
		$(document).on('click','.singoTag',function(){
			report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));
		});
	} 
	
	
	setTimeout(function() {
		$('#sendBtn').prop('disabled',false);
	}, 10000);
};

function onClose(evt) {

}


$('#btn_scroll_down').on('click', function() {
	$('#div_chat').animate({
		scrollTop : $('#div_chat').prop('scrollHeight') + 1
	}, 500);

	$('#btn_scroll_down').html('↓');
	$("#menu_scroll_down").css("opacity", "0.0");
	$("#btn_scroll_down").css("opacity", "0.0");
	$("#btn_scroll_down").attr("disabled", true);
	isScrollUp = false;
	unreadCnt = 0;

});

$("#div_chat")
		.bind(
				'scroll touchmove mousewheel',
				function(e) {

					var delta = e.originalEvent.wheelDelta;
					

					if (delta > 0 && delta != undefined) {
						$("#menu_scroll_down").css("opacity", "1.0");
						$("#btn_scroll_down").css("opacity", "1.0");
						$("#btn_scroll_down").attr("disabled", false);
						isScrollUp = true;
					} else if (delta < 0 && delta != undefined) {
						var scrollHeight = $(this).height();
						var scrollPosition = $(this).height()
								+ $(this).scrollTop();

						if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
							$('#btn_scroll_down').html('↓');
							$("#menu_scroll_down").css("opacity", "0.0");
							$("#btn_scroll_down").css("opacity", "0.0");
							$("#btn_scroll_down").attr("disabled", true);
							isScrollUp = false;
							unreadCnt = 0;
						} else {
							$("#menu_scroll_down").css("opacity", "0.0");
							$("#btn_scroll_down").css("opacity", "0.0");
							$("#btn_scroll_down").attr("disabled", true);
							isScrollUp = false;
						}

					}

					if ($(this).scrollTop() == 0) {
						var lt = $('.lastTID').eq(0).text() * 1;
						var list = loadMore(lt);

						var oldScrollHeight = $('#div_chat').prop(
								'scrollHeight');

						for (var i = 0; i < list.length; i++) {
							if ($(".membernick").text() == (list[i].mnick)) {
								var printHTML = "<li><div class='lastTID' style='display:none'>"
										+ list[i].tid
										+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
								printHTML += "<img src='/resources/img/profiles/"
										+ list[i].profile_path
										+ "' alt=''></div>";
								printHTML += "<div class='comment-box-me'><div class='comment-head-me'><span class='comment-name '>";
								printHTML += "<a href='#'>" + list[i].mnick
										+ "</a>" + "&nbsp;(나)" + "</span><span>"
										+ list[i].tdate + "</span>";
								printHTML += "<a href='#' class='jjokjeeTag'>"
										+ "<img class='jjokjee' src='/resources/img/timeline/jjokjee.png'/>"
										+ "</a><a href='#' class='singoTag'>"
										+ "<img class='singo' src='/resources/img/timeline/singo.png'/></a>";
								printHTML += "</div><div class='comment-content'><pre>"
										+ list[i].tcontent + "</pre></div>";
								printHTML += "<div class='comment-bottom-me'><i class='fa fa-link'></i>";
								printHTML += "<a href='https://www.google.com/search?q="
										+ list[i].hashTag
										+ "' target='_BLANK'>"
										+ list[i].hashTag + "</a>";
								printHTML += "</div></div></div></li>";
								$('.disqusin').prepend(printHTML);
							} else {
								var printHTML = "<li><div class='lastTID' style='display:none'>"
										+ list[i].tid
										+ "</div><div class='comment-main-level'><div class='comment-avatar'>";
								printHTML += "<img src='/resources/img/profiles/"
										+ list[i].profile_path
										+ "' alt=''></div>";
								printHTML += "<div class='comment-box'><div class='comment-head'><span class='comment-name '>";
								printHTML += "<a href='#'>" + list[i].mnick
										+ "</a></span><span>" + list[i].tdate
										+ "</span>";
								printHTML += "<a href='#' class='jjokjee'>"
										+ "<img class='jjokjeeImg' src='/resources/img/timeline/jjokjee.png'/>"
										+ "</a><a href='#' class='singo'>"
										+ "<img class='singoImg' src='/resources/img/timeline/singo.png'/></a>";
								printHTML += "</div><div class='comment-content'><pre>"
										+ list[i].tcontent + "</pre></div>";
								printHTML += "<div class='comment-bottom'><i class='fa fa-link'></i>";
								printHTML += "<a href='https://www.google.com/search?q="
										+ list[i].hashTag
										+ "' target='_BLANK'>"
										+ list[i].hashTag + "</a>";
								printHTML += "</div></div></div></li>";
								$('.disqusin').prepend(printHTML);

							}
						}

						var newScrollHeight = $('#div_chat').prop(
								'scrollHeight');

						$(this).scrollTop(newScrollHeight - oldScrollHeight);
						
						$(document).off('click','.jjokjeeTag');
						$(document).off('click','.singoTag');

						$(document).on('click','.jjokjeeTag',function(){
							sendNote($(this).siblings('.comment-name').children('a').text());
						});
						
						$(document).on('click','.singoTag',function(){
							report(($(this).parent().parent().parents().siblings('.lastTID').text()), ($(this).siblings('.comment-name').children('a').text()));
						});
					}

				});

function loadMore(lt) {
	var list = "";
	$.ajax({
		url : '/load.more',
		type : 'post',
		async : false,
		data : {
			'tId' : lt
		},
		success : function(data) {
			list = data;
		},
		error : function(err) {
			console.log("load-more-error");
		}
	});
	return list;
}

function sendNote(nick) {
	var popUrl = "/popUp.write?" + nick;

	var popOption = "width=765, height=485, resizable=no, scrollbars=no, status=no;"; 

	window.open(popUrl, "", popOption);
}

function report(tid,mnick) {
	if (confirm("차단한 타임라인은 자신에게 다시는 보이지 않습니다. 그래도 차단하시겠습니까?") == false) {
		return false;
	} else{
		var myNick=$(".membernick").text();
		var tId=tid;
		var mNick=mnick;
		if(mNick=='사이트관리자'){
			alert("사이트관리자는 차단할 수 없습니다.");
			return false;
		}else if(mNick==myNick){
			alert("자기 자신의 글은 차단할 수 없습니다.");
			return false;
		}else{
			$.ajax({
				url : '/block.timeline',
				type : 'post',
				traditional:true,
				async : false,
				data : {
					'tId' : tId,
					'mNick':mNick
				},
				success : function(data) {
					if(data>0){
						alert("게시글을 차단했습니다.");
						window.location.href ="/echo.do";
					}
				},
				error : function(err) {
					console.log("일시적인 문제가 발생했습니다. 잠시 후 다시 시도해주세요.");
				}
			});
		}
		
	}
}
