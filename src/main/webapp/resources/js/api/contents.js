var content;

$(function(){
	$.ajax({
		url : "/jeju/jejuContent.do",
		type : "GET",
		success : function(result){
			content = result;
			console.log(content)
		},
		error : function(result){
			console.log(result);
		},
		async : false
	})
	
})