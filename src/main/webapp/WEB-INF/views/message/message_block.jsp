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
<title>쪽지 차단</title>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="/resources/css/message.css" rel="stylesheet" />

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
			<li class=""><span class="orange size3"><a href="/popUp.store" onfocus="this.blur();">쪽지 보관함</a></span></li>
			<li class="selected oldstart"><span class="orange size2"><a href="/popUp.block" onfocus="this.blur();">쪽지 차단</a></span></li>
		</ul>
	</dd>
</dl>
<div id="noteLogoBlock">
	<img src="/resources/img/mhm_logo.png" alt="" />
</div>
</div>
<div id="noteMain">

<h1 class="note">　쪽지 차단 목록입니다.</h1>
<div id="blockList">
	<div id="mid" style="display:none;">${member.mno}</div>
	<div class="cmdWrap">
		<div class="blockcnt">${totalContents} 명 차단중 </div>
		<a id="cmdDelete" class="bttn46" href="#" onclick="deleteBlock();" onfocus="this.blur();">삭제</a>
		<a id="cmdStore" class="bttn46" href="#" onclick="blockMessage();" onfocus="this.blur();">추가</a>
	</div>
	<div class="listB">
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="idx_" name="idx_" onfocus="this.blur();"/></th>
				<th class="blocknick">닉네임</th>
				<th class="blockdate">차단 추가일</th>
				<th class="comment">메모</th>
			</tr>
			</thead>
		</table>
		<div class="tbodyscroll">
		<table border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<c:forEach var="i" items="${block}">
					<tr>
						<td class="chk"><input type="checkbox" id="index_" name="index_" onfocus="this.blur();"/></td>
						<td class="blocknick">${i.block_mNick}</td>
						<td class="blockdate">${i.block_date}</td>
						<td class="comment">${i.block_note}</td>
					</tr>
				</c:forEach>
						
			</tbody>
		</table>
	</div>
	
	<div class="toolsBlock">
		<c:out value="${pageBar}" escapeXml="false"/>
	</div>
</div>
</div>

</div>
<!-- <script src="/resources/js/message/message_block.js"></script> -->
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

function deleteBlock(){
	var arr=new Array();
	var idx=0;
	$(".chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings('.blocknick').text());
	});
	var mNo=$('#mid').text()*1;
	
	$.ajax({
		url : '/message.unblock',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr,
	    	'mNo':mNo
	    },
	    success : function(data) {
	    	alert('차단을 해제했습니다.');
	    	window.location.href ="/popUp.inbox";
	    },
	    error : function() {
	    	alert("일시적인 문제입니다. 잠시 후 다시 시도해주세요.");
	   	}
	});
}

function blockMessage(){
	var popUrl = "/block.member";

	var popOption = "width=375, height=185, resizable=no, scrollbars=no, status=no; fullscreen=no; tollbar=no; menubar=no;";

	window.open(popUrl, "", popOption);
}

</script>
</body>
</html>