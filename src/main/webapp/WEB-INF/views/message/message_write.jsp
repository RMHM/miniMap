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
<title>쪽지 보내기</title>

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
			<li class="selected"><span class="orange"><a href="/popUp.write" onfocus="this.blur();">쪽지 보내기</a></span></li>
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



<form id="fmNoteWrite" name="fmNoteWrite" action="/message.write" method="POST">
<h1 class="note"><strong class="page">　새쪽지쓰기</strong>입니다.</h1>
	<div id="noteWrite">
		<div class="hidden" style="display: none;">
		<input type="hidden" name="rurl" value="http%3A%2F%2Fwww.inven.co.kr%2Fmember%2Fnote%2F"/>
		<input type="hidden" name="toinven" value=""/>
		<input type="hidden" name="reply" value="0"/>
						<input type="hidden" name="noteflag" value="1545579084"/>
				</div>
		<table class="content" border="0" cellpadding="0" cellspacing="0">
		<colgroup><col class="th"/><col class="td"/></colgroup>
							<tr>
				<td class="label">닉네임</td>
				<c:choose>
					<c:when test="${!empty mNick}">
						<td class="value"><input class="nick" type="text" id="nick" name="nick" value="${mNick}"/>
							<span class="guide ok">O</span>
							<span class="guide error">X</span>
						</td>
					</c:when>
					<c:otherwise>
						<td class="value"><input class="nick" type="text" id="nick" name="nick" value=""/>
							<span class="guide ok">O</span>
							<span class="guide error">X</span>
						</td>
					</c:otherwise>
				</c:choose>
				
			</tr>
		

					<tr>
				<td class="label">제목</td>
				<td class="value"><input class="title" type="text" id="title" name="title" value=""/></td>
			</tr>
			<tr>
				<td class="label">내용</td>
				<td class="value">
					<textarea class="content" id="content" name="content"></textarea>
				</td>
			</tr>
				</table>
		<div class="command">
			<a id="aNoteSave" href="#" onclick="sendMessage();" onfocus="this.blur();" class="bttn92w">쪽지보내기</a>
		</div>
	</div>
</form>
</div>

</div>

<script src="/resources/js/message/message_write.js"></script>
</body>
</html>