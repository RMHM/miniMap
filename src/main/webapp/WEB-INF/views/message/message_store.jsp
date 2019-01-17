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
<title>쪽지 보관함</title>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/message.css" rel="stylesheet" />

</head>

<body class="bPopup">

<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="/popUp.write" onfocus="this.blur();">쪽지 보내기</a></span></li>
			<li class=" oldstart"><span class="orange"><a href="/popUp.inbox" onfocus="this.blur();">받은 쪽지함</a></span></li>
			<li class=""><span class="orange"><a href="/popUp.sent" onfocus="this.blur();">보낸 쪽지함</a></span></li>
			<li class="selected"><span class="orange size3"><a href="/popUp.store" onfocus="this.blur();">쪽지 보관함</a></span></li>
			<li class="oldstart"><span class="orange size2"><a href="/popUp.block" onfocus="this.blur();">쪽지 차단</a></span></li>
		</ul>
	</dd>
</dl>
<div id="noteLogo">
	<img src="/resources/img/mhm_logo.png" alt="" />
</div>
</div>
<div id="noteMain">


<h1 class="note"><strong class="page">　쪽지 보관함</strong>입니다.</h1>


<div id="noteList">
	<div class="cmdWrap">
		<a id="cmdDelete" class="bttn46" href="#" onclick="deleteNotes();" onfocus="this.blur();">삭제</a>
		<a id="cmdWrite" class="bttn92w" href="/popUp.write" onfocus="this.blur();">쪽지보내기</a>
	</div>

	<div class="list">
	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
		<input type="hidden" name="rurl" value="Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT0JwSXQ5azIzakNQSmRBcFg1Q2ZNSkVLY0NGR2t3clVrTmswK0NYRG1CS3NlWDNsK2ZmVlZUT1ljdUlaSXZ1d2M9"/>
		<input type="hidden" name="set" value=""/>
		<input type="hidden" name="folder" value="store"/>
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="idx_" name="idx_" onfocus="this.blur();"/></th>
				<th class="meid" style="display:none">쪽지번호</th>
				<th class="title">제목</th>
				<th class="nickname">보낸사람</th>
				<th class="date">날짜</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${message}">
					<c:choose>
						<c:when test="${i.readFlag eq 'N'}">
							<tr class="unread">
								<td id="chk"><input type="checkbox" id="index_" class="index_" name="index_"/></td>
								<td id="meid" style="display:none">${i.meId}</td>
								<td><a href="#" onclick="selectDetailStore($(this).parent().siblings('#meid').text());" onfocus="this.blur();">${i.meTitle}</a></td>
								<td>${i.mNick}</td>
								<td>${i.meDate}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="read">
								<td id="chk"><input type="checkbox" id="index_" class="index_" name="index_"/></td>
								<td id="meid" style="display:none">${i.meId}</td>
								<td><a href="#" onclick="selectDetailStore($(this).parent().siblings('#meid').text());" onfocus="this.blur();">${i.meTitle}</a></td>
								<td>${i.mNick}</td>
								<td>${i.meDate}</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<div class="IEFix">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	</form>
	</div>

	<div class="tools">
		<c:out value="${pageBar}" escapeXml="false"/>
	</div>
</div>
</div>

</div>

<!-- <script src="/resources/js/message/message_store.js"></script> -->
<script>

$("#idx_").click(function(){
	if($(this).prop("checked")){
		$("input[name^=index_]").prop('checked', true);
	}else{
		$("input[name^=index_]").prop('checked', false);
	}
});

$("input[name^=index_]").click(function(){
	if($("#idx_").prop("checked")){
		$("#idx_").prop("checked",false);
	}
});

function deleteNotes() {

	var arr=new Array();
	var idx=0;
	$("#chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings('#meid').text())*1;
	});
	
	
	$.ajax({
		url : '/message.delete',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr
	    },
	    success : function(data) {
	    	alert('쪽지를 성공적으로 삭제했습니다!');
	    	window.location.href ="/popUp.store";
	    },
	    error : function() { 
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function selectDetailStore(value){
	var meId=value
	var url="/detail.store?"+meId;
	window.location.href=url;
}
</script>
</body>
</html>