<%@
   page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 상세보기</title>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/message.css" rel="stylesheet" />

</head>

<body class="bPopup">

<c:choose>
	<c:when test="${empty member}">
		<script>
			window.location.href="common/error.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="/popUp.write" onfocus="this.blur();">쪽지 보내기</a></span></li>
			<li class=" oldstart"><span class="orange"><a href="/popUp.inbox" onfocus="this.blur();">받은 쪽지함</a></span></li>
			<li class=""><span class="orange"><a href="/popUp.sent" onfocus="this.blur();">보낸 쪽지함</a></span></li>
			<li class=""><span class="orange size3"><a href="/popUp.store" onfocus="this.blur();">쪽지 보관함</a></span></li>
			<li class="oldstart"><span class="orange size2"><a href="/popUp.block" onfocus="this.blur();">쪽지 차단</a></span></li>
		</ul>
	</dd>
</dl>
<div id="noteLogo">
	<img src="/resources/img/mhm_logo.png" alt="" />
</div>
</div>
<div id="noteMain">


<h1 class="note"><strong class="page">　쪽지보기</strong>입니다.</h1>

<div id="noteView">
	<dl class="topInfo">
		<dt>보낸이::</dt>
				<dd class="sender">${message.mNick}</dd>
			<dt>보낸날짜:</dt>
		<dd class="date">${message.meDate}</dd>
	</dl>
	<table class="content" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td class="label">제목</td>
			<td class="value">${message.meTitle}</td>
		</tr>
		<tr class="content">
			<td class="label">내용</td>
			<td class="value">
				<div class="content">
					<div id="contentBody">
						${message.meContent}
					</div>
				</div>
			</td>
		</tr>
	</table>
	<div class="command">
		<a id="aNoteRpl" href="#" onclick="sendReply();" onfocus="this.blur();" class="bttn46">답장</a>
		<a id="aNoteList" href="/popUp.store" onfocus="this.blur();" class="bttn76l">리스트</a>
		<a id="aNoteDelete" href="#" onclick="deleteNote();" onfocus="this.blur();" class="bttn46">삭제</a>
				
	</div>
</div>

</div>

</div>
	</c:otherwise>
</c:choose>



<!-- <script src="/resources/js/message/detail_store.js"></script> -->
<script>
function deleteNote() {
	var ans = confirm("삭제하시겠습니까?");
	if (!ans) return;
	var meId="${message.meId}";
	$.ajax({
		url : '/message.deleteOne',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'meId':meId
	    },
	    success : function(data) {
	    	alert("쪽지를 성공적으로 삭제했습니다!");
	    	window.location.href ="/popUp.store";
	    },
	    error : function() { 
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function sendReply(){
	var url = "/popUp.write?"+$(".sender").text();
	window.location.href = url;
}
</script>
</body>
</html>