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
<title>쪽지 차단 설정</title>
<link href="${pageContext.request.contextPath}/resources/css/message.css" rel="stylesheet" />

</head>

<body class="bPopup"><script>INVEN.Popup.resizeWindowBody(747,510);</script>

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
			<li class="selected oldstart"><span class="orange size2"><a href="/popUp.block" onfocus="this.blur();">쪽지 차단 설정</a></span></li>
		</ul>
	</dd>
</dl>
</div>
<div id="noteMain">
<style>
#blockList div.list {margin-top: 8px;}
#blockList div.tbodyscroll{ overflow-y: scroll; height: 367px; clear:both; padding-right:3px;}
#blockList div.list table { width: 521px; overflow: hidden;}
</style>
<script>
function checkAll(fm, prefix, chk) {
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
}
function deleteBlock() {
	var fmObj = document.getElementById("fmNoteData");
	if (!anyChecked(fmObj, "idx_")) { alert("차단 해제할 유저를 선택해 주세요"); return; }

	var ans = confirm("선택된 유저를 차단 해제하시겠습니까?");
	if (!ans) return;

	fmObj.action = 'http://www.inven.co.kr/member/note/block_delete.php';
	fmObj.set.value = 'delete';
	fmObj.submit();
}
function anyChecked(fmObj, prefix) {
	var temp = false;

	var chs = fmObj.getElementsByTagName('INPUT');
	var n = chs.length;
	var prefixn = prefix.length;
	for (var i = 0; i < n; i++) {
		var item = chs.item(i);
		if ((item.getAttribute('name').substring(0, prefixn) == prefix) && (item.checked)) temp = true;
	}
	return temp;
}
</script>
<h1 class="note">　쪽지 차단 목록입니다.</h1>
<div id="blockList">
	<div class="cmdWrap">
		<div class="blockcnt">0 명 차단중 (최대 50명)</div>
		<a id="cmdDelete" class="bttn46" href="javascript:deleteBlock();" onfocus="this.blur();">삭제</a>
		<a id="cmdStore" class="bttn46" href="javascript:INVEN.Links.blockNote();" onfocus="this.blur();">추가</a>
	</div>
<style>
#blockList div.cmdWrap {
width: 535px;
height: auto;
clear: both;
padding-top: 8px;
background: url(http://static.inven.co.kr/image/member/note/dot_3x1_CCCCCC.gif) left top repeat-x;
}
#blockList div.cmdWrap #cmdDelete,
#blockList div.cmdWrap #cmdStore{
	float: right;
	margin-left: 7px;
}
.blockcnt {padding: 4px 0 2px 14px;}
.list table th {border-top: 2px solid #bebebe;}
.list table .chk {width: 20px;}
.list table .blocknick {width: 80px;}
.list table .blockdate {width: 80px;}
.list table .comment {}
.list table th {background-color:#F7F7F7;}
.list table th,
.list table td {padding: 4px 8px 2px 8px; text-align: center; border-bottom: 1px solid #bebebe;}
.list table td.comment {text-align: left; white-space: nowrap;}
</style>
	<div class="list">
	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
		<input type="hidden" name="rurl" value="Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT0JwSXQ5azIzakNQSmRBcFg1Q2ZNSktSWEIyVzI3clV4TUFVYUhGOEhzeVZsR0hTOGhZd29leEhWK3pJTGNjc1E9"/>
		<input type="hidden" name="set" value=""/>
		<input type="hidden" name="folder" value="block"/>
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="idx_" name="idx_" onclick="toggleCheck('fmNoteData','idx_',this);" onfocus="this.blur();"/></th>
				<th class="blocknick">닉네임</th>
				<th class="blockdate">차단 추가일</th>
				<th class="comment">메모</th>
			</tr>
			</thead>
		</table>
		<div class="tbodyscroll">
		<table border="0" cellpadding="0" cellspacing="0">
			<tbody>
						</tbody>
		</table>
		</div>
		<div class="IEFix">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	</form>
	</div>
</div>
<script>
	INVEN.Links.blockNote = function(params) {
		var blockNoteWrite = window.open("http://www.inven.co.kr/member/note/block.php?" + params,"","left=100,top=100,width=375,height=265,resizable=no,scrollbars=no,toolbar=0");
	}
</script></div>

</div>
</body>
</html>