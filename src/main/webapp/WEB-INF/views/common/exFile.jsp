<%@
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 모든페이지 공통으로 사용할 외부파일만 추가해주세요 -->
<!-- css -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/resources/css/jcarousel.css" rel="stylesheet" />
<link href="/resources/css/flexslider.css" rel="stylesheet" />
<link href="/resources/css/style.css" rel="stylesheet" />

<link href="/resources/css/fullcalendar.min.css" rel="stylesheet" />
<link href="/resources/css/fullcalendar.print.min.css" rel="stylesheet"
	media="print" />

<!-- Load with base style -->
<link rel="stylesheet" href="/resources/css/billboard.css">
<!-- Or load different theme style -->
<link rel="stylesheet" href="/resources/css/theme/insight.css">
<!-- manager page 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager/manager.css"> -->

<!-- Theme skin -->
<link href="/resources/skins/default.css" rel="stylesheet" />

<!-- js -->
<script src='/resources/js/moment.min.js'></script>
<!-- <script src="/resources/js/jquery-3.3.1.min.js"></script> -->
<script src="/resources/js/jquery.js"></script>
<script src='/resources/js/fullcalendar.min.js'></script>
<!-- <script src="/resources/js/jquery.easing.1.3.js"></script> -->
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.fancybox.pack.js"></script>
<script src="/resources/js/jquery.fancybox-media.js"></script>
<script src="/resources/js/google-code-prettify/prettify.js"></script>
<script src="/resources/js/portfolio/jquery.quicksand.js"></script>
<script src="/resources/js/portfolio/setting.js"></script>
<script src="/resources/js/jquery.flexslider.js"></script>
<script src="/resources/js/animate.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<script>

var sock = new SockJS("<c:url value='/notice'/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

sock.onopen=function(){
	console.log("open");
	sendMessage();
}

function sendMessage() {
	
	if(sock.readyState===1){
		setInterval(
			function() {
				sock.send("hdn")
				
		},1000);
	}else{
		console.log("wait...");
		sendMessage();
	}
};

/* function waitForSocketConnection(sock){
	setTimeout(
		function(){
			if(sock.readyState===1){
				console.log("success");
				sendMessage();
			}else{
				console.log("wait...");
				waitForSocketConnection(sock);
			}
		},1000);
	
}; */


	
function onMessage(evt) {
	var data = evt.data;
	
	console.log("data::"+data);
	
	$("#test").text(data);
	/* $('.dropdown-toggle').append(data);
	$('.note').append(data); */

};

function onClose(evt){
	
}

</script>

<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<!-- Step 2) Load billboard.js with style -->
<script src="/resources/js/billboard.js"></script>

