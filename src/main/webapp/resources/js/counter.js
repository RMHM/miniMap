$(function(){
	counter();
	timer = setInterval(function(){
		counter();
	}, 3000, 1000*60*5)
})

function counter(){
	$.ajax({
		url : "/manager/visitCount.do",
		success : function(result){
			for(var i=0; i<$('.counter').length; i++){
				$('.counter').eq(i).attr('data-count', result[i]);
			}
			
			$('.counter').each(function() {
				var $this = $(this)
				var countTo = $this.attr('data-count');

				$({countNum : $this.text()}).animate({
					countNum : countTo
				},
				{
					duration : 3000,
					easing : 'linear',
					step : function() {
						$this.text(Math.floor(this.countNum));
					},
					complete : function() {
						$this.text(this.countNum);
						//alert('finished');
					}

				});
			});
		},
		error : function(result){
			console.log(result);
		}
	})
}