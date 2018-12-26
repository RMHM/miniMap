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
			<li class=" oldstart"><span class="orange size2"><a href="/popUp.block" onfocus="this.blur();">쪽지 차단 설정</a></span></li>
		</ul>
	</dd>
</dl>
</div>
<div id="noteMain">


<h1 class="note"><strong class="page">　보관 편지함</strong>입니다.</h1>


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
				<th class="chk"><input type="checkbox" id="idx_" name="idx_" onclick="toggleCheck('fmNoteData','idx_',this);" onfocus="this.blur();"/></th>
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
								<td id="chk"><input type="checkbox" id="idx_" class="idx_" name="idx_"/></td>
								<td id="meid" style="display:none">${i.meId}</td>
								<td><a href="#" onclick="selectDetailStore($(this).parent().siblings('#meid').text());" onfocus="this.blur();">${i.meTitle}</a></td>
								<td>${i.mNick}</td>
								<td>${i.meDate}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="read">
								<td id="chk"><input type="checkbox" id="idx_" class="idx_" name="idx_"/></td>
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
		<div id="notePaging"><span class="basetext"><img class="leftarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_left.gif"> <span class="prevtext">이전</span> <span class="currentpg">1</span> <span class="nexttext">다음</span> <img class="rightarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_right.gif"></span></div>
		
	</div>
</div>
</div>

</div>

<script>
// 전체클릭
/* function checkAll(fm, prefix, chk) {
	var fmObj = document.getElementById(fm);
	var chs = fmObj.getElementsByTagName('INPUT');
	var n = chs.length;
	var prefixn = prefix.length;
	for (var i = 0; i < n; i++) {
		var item = chs.item(i);
		if (item.getAttribute('name').substring(0, prefixn) == prefix) {
			item.checked = chk;
		}
	}
}

function toggleCheck(fm, prefix, obj) {
	checkAll(fm, prefix, obj.checked);
} */



function deleteNotes() {
	/* var fmObj = document.getElementById("fmNoteData");
	if (!anyChecked(fmObj, "idx_")) { alert("삭제할 쪽지를 선택해 주세요"); return; }

	var ans = confirm("선택된 쪽지를 삭제하시겠습니까?");
	if (!ans) return; */

	var arr=new Array();
	var idx=0;
	$("#chk :checked").each(function(){
		arr[idx++]=($(this).parent().siblings('#meid').text())*1;
	});
	
	console.log(arr);
	
	$.ajax({
		url : '/message.delete',
	    type : 'post',
	    traditional:true,
	    data : {
	    	'arr':arr
	    },
	    success : function(data) {
	    	alert('쪽지 삭제 성공');
	    	window.location.href ="/popUp.store";
	    },
	    error : function() { 
	    	// 에러 처리 고민
	    	console.log('error');
	   	}
	});
}

function selectDetailStore(value){
	// 메세지 하나 상세보기
	var meId=value
	console.log("meId::"+meId);
	var url="/detail.store?"+meId;
	console.log("url::"+url);
	window.location.href=url;
}
</script>
</body>
</html>