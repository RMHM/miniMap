var socket = new SockJS("/notice");
socket.onmessage = onMsg;
socket.onclose = onCls;

socket.onopen=function(){
	console.log("open");
	sendMsg();
}

function sendMsg() {
	
	if(socket.readyState===1){
		setInterval(
			function() {
				socket.send("hdn")
				
		},1000);
	}else{
		console.log("wait...");
		sendMsg();
	}
};
	
function onMsg(evt) {
	var data = Number(evt.data);
	
	if(data!=0){
		$('.newMsg').html("<b style='color:red'>"+data+"</b>")
	}else{
		$('.newMsg').html("<b style='position:absolute; left:-2000px; color:white;'>"+data+"</b>")
	}
};

function onCls(evt){
	
}