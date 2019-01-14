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
<body class = "bPopup">
	<div id = "webzineBody">


<div id="reportsWrap">
<form id="fmReport" name="fmReport" method="POST">
<div class="hiddenFields">
<input type="hidden" name="rurl" value="_close"/>
</div>
	<div id="reportsBody">
	<div id="mNo" style="display:none">${mNo}</div>
	<div id="mNick" style="display:none">${mNick}</div>
		<dl>
			<dt>쪽지 차단 닉네임</dt>
			<dd><input type="text" name="blocknick" id="blocknick"/>
				<span class="checkNick ok">O</span>
				<span class="checkNick error">X</span>
				<span class="cover"></span>
			</dd>
		</dl>
		<dl>
			<dt>메모</dt>
			<dd><input type="text" name="comment" id="comment" value="" maxlength="100" /></dd>
		</dl>
		<div class="remaining">
			<span class="count">60</span>
		</div>
		<div id="reportsHelp">
			<div id="reportsHelpTop"></div>
			<div id="reportsHelpMid">쪽지 차단할 경우 해당 유저에게 오는 모든 쪽지를 받을 수 없습니다.</div>
			<div id="reportsHelpBot"></div>
		</div>
		<div id="btnReportsSubmit"><a href="#" onclick="banMessage();">차단하기</a></div>
		<div id="btnReportsClose"><a href="#" onclick="window.close();">닫 기</a></div>
	</div>
</form>
</div>
<script src="/resources/js/message/askBlock.js"></script>
	</div>
	</body>
</html>