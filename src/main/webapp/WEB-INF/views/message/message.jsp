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
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/message.css" rel="stylesheet" />

</head>
<body>

<!-- <div class="container">
	<div class="row">
		<div class="col-sm-3">
			<ul>
				<li>쪽지 보내기</li>
				<li>받은 쪽지함</li>
				<li>보낸 쪽지함</li>
				<li>차단 목록</li>
			</ul>
		</div>
		<div class="col-sm-9">
			상세화면 들어갈 부분
		</div>
	</div>
</div> -->

<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="?folder=write" onfocus="this.blur();">쪽지 보내기</a></span></li>
			<li class="selected oldstart"><span class="orange"><a href="?folder=inbox" onfocus="this.blur();">받은 쪽지함</a></span></li>
			<li class=""><span class="orange"><a href="?folder=sent" onfocus="this.blur();">보낸 쪽지함</a></span></li>
			<li class=" oldstart"><span class="orange size2"><a href="?folder=block" onfocus="this.blur();">쪽지 차단 설정</a></span></li>
		</ul>
	</dd>
</dl>
</div>
<div id="noteMain">


<h1 class="note"><strong class="page">　받은 쪽지함</strong>입니다.(읽지 않은 쪽지: 0통) <a href="javascript:setAllread();" class="allread" onfocus="this.blur();">모두읽음</a></h1>
<div class="selectWrap">
	<select style="float:right;" onchange = "if (this.value) { var url = this.value.split('|'); if (!url[1]) { url[1] = ''; } INVEN.Location.openWin(url[0], url[1]); }">
	<option value="/member/note/index.php?folder=inbox&scale=10" selected>10</option>
	<option value="/member/note/index.php?folder=inbox&scale=30" >30</option>
	<option value="/member/note/index.php?folder=inbox&scale=50" >50</option>
	</select>
		<select style="float:right;" onchange = "if (this.value) { var url = this.value.split('|'); if (!url[1]) { url[1] = ''; } INVEN.Location.openWin(url[0], url[1]); }">
	<option value="/member/note/index.php?folder=inbox&scale=10" selected>전체</option>
	<option value="/member/note/index.php?folder=inbox&scale=10&readst=2" >안읽음</option>
	</select>
	</div>

<div id="noteList">
	<div class="cmdWrap">
		<a id="cmdDelete" class="bttn46" href="javascript:deleteNotes();" onfocus="this.blur();">삭제</a>
				<a id="cmdStore" class="bttn46" href="javascript:storeNotes();" onfocus="this.blur();">보관</a>
				<a id="cmdWrite" class="bttn92w" href="javascript:writeNewNote();" onfocus="this.blur();">쪽지보내기</a>
	</div>

	<div class="list">
	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
		<input type="hidden" name="rurl" value="Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT0JwSXQ5azIzakNQSmRBcFg1Q2ZNSjlhbTFxSURjMmd4K0R0MXFyUmxsbXo0b0NGdHZsV1hFVzc2WU5zVEtvWTg9"/>
		<input type="hidden" name="set" value=""/>
		<input type="hidden" name="folder" value="inbox"/>
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="idx_" name="idx_" onclick="toggleCheck('fmNoteData','idx_',this);" onfocus="this.blur();"/></th>
				<th class="title">제목</th>
				<th class="nickname">보낸사람</th>
				<th class="date">날짜</th>
			</tr>
			</thead>
			<tbody>
						</tbody>
		</table>
		<div class="IEFix">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	</form>
	</div>

	<div class="tools">
		<div id="notePaging"><span class="basetext"><img class="leftarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_left.gif"> <span class="prevtext">이전</span> <span class="currentpg">1</span> <span class="nexttext">다음</span> <img class="rightarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_right.gif"></span></div>
		<form id="noteSearch" name="noteSearch" method="GET" action="/member/note/index.php">
			<input type="hidden" name="folder" value="inbox"/>			<select id="searchWhere" name="s_where">
				<option value="title" > 제 목</option>
				<option value="content" > 내 용</option>
				<option value="titlecontent" > 제목+내용</option>
				<option value="nick" > 닉네임</option>
			</select>
			<input class="word" type="text" id="searchWord" name="s_word" value=""/>
			<input class="submit" type="image" src="http://static.inven.co.kr/image/member/note/bttn_search.gif"/>
		</form>
	</div>
</div>
</div>

</div>

</body>
</html>