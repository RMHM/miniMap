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
</head>
<body class = "bPopup">
	<div id = "webzineBody">

<style>
	#reportsWrap {
		width: 100%;
		height: auto;
		display: block;
	}
	#reportsWrap form {
		display:inline;
	}
	#reportsWrap form .hiddenFields {
		display:none;
	}
	#reportsTop {
		width: 100%;
		height: 38px;
		background: #09A8B6 url(http://static.inven.co.kr/image/play/reports/bg_pia_reports_top.gif) repeat-x left top;
		display: block;
	}
	#reportsTop h3{
		display:inline;
		float: left;
		margin: 10px 0 0 10px;
		padding-left: 30px;
		padding-top: 2px;
		color: #FFF;
		font-weight: bold;
		font-size: 9pt;
		background: url(http://static.inven.co.kr/image/play/reports/icon_pia_reports_redcard.gif) no-repeat left top;
	}
	#reportsBody {
		float: left;
		display: inline;
		margin-top: 4px;
		width: 100%;
		height: auto;
		font-size: 9pt;
		border-top: 1px solid #CACACA;
		padding-bottom: 15px;
	}
	#reportsDotline {
		margin: 1 0 1 0;
		width: 100%;
		height: 1px;
		overflow: hidden;
		background: url(/resources/img/message/dot8.gif) repeat-x left top;
	}
	#reportsBody dl{
		width: 100%;
		margin: 0;
		padding: 8px 0 6px;
		float: left;
		display: inline;
		background: url(/resources/img/message/dot8.gif) repeat-x left bottom;
	}
	#reportsBody dt{
		float: left;
		display: inline;
		margin-left:7px;
		text-indent: 8px;
		width: 112px;
		_width: 132px;
		padding: 4px 0 2px 0;
		background: url(/resources/img/message/dot9.gif) no-repeat left 9px;
		font-weight: bold;
	}
	#reportsBody dd{
		float: left;
		display: inline;
	}
	#reportsBody dd span{
		padding: 0;
		float: left;
		display: inline;
	}
	#reportsBody dd ul{
		margin: 0;
		padding: 0;
		float: left;
		display: inline;
	}
	#reportsBody dd li{
		display:inline;
		float:left;
		line-height:1.5;
	}
	#reportsBody dd li span{
		margin-left : 5px;
	}
	#reportsBody dd li label{
		margin-right:10px;
	}

	#reportsBody textarea {
		margin: 5px 0 0 6px;
		width: 97%;
		height: 132px;
		float: left;
		display: inline;
		border: 1px solid #C4CAD1;
	}
	#reportsHelp {
		margin: 5px 0 0 6px;
		width: 97%;
		height: auto;
		float: left;
		display: inline;
		background: #F2F2F2;
	}
	#reportsHelpMid {
		padding: 10px;
		height: auto;
		float: left;
		display: block;
		line-height: 20px;
		color: #555;
	}
	#btnReportsSubmit {
		margin: 19px 0 0 10px;
		width: 93px;
		height: 25px;
		background: url(http://static.inven.co.kr/image/play/reports/btn_pia_reports_submit.gif) no-repeat left top;
		float: left;
		display: inline;
	}
	#btnReportsSubmit a {
		width:58px;
		height:19px;
		_width:93px;
		_height:25px;
		padding-left: 35px;
		padding-top: 6px;
		color: #000;
		font-weight: normal;
		font-size: 9pt;
		background: url(http://static.inven.co.kr/image/play/reports/icon_pia_reports_redcard.gif) no-repeat 10px 4px;
		float: left;
		display: inline;
		text-decoration:none;
	}
	#btnReportsClose {
		display: inline;
		float: right;
		margin:19px 10px 0;
		width: 93px;
		height: 25px;
	}
	#btnReportsClose a {
		display: inline;
		float: left;
		width:93px;
		height:19px;
		_height:25px;
		background: url(http://static.inven.co.kr/image/play/reports/btn_pia_reports_submit.gif) no-repeat left top;
		text-align:center;
		padding-top: 6px;
		color: #000;
		font-weight: normal;
		font-size: 9pt;
		text-decoration:none;
	}
</style>
<script>
	var memberBlockNote = window.memberBlockNote || {};
	memberBlockNote.create = function() {
		var obj = new memberBlockNote.object();
		return obj;
	}
	memberBlockNote.object = function() {
		data = new Array();
		var reloadTime = 3;
		var frmObj = false;
				var blockXmlObj = INVEN.Xml.create("POST", "http://www.inven.co.kr/member/note/block.xml.php", true);
				var returnurl = '';
		this.init = init;
		function init(objName, rurl) {
			frmObj = document.getElementById(objName);
			returnurl = rurl;
		}
		this.request = request;
		function request(act) {
			data['act'] = act;
			data['out'] = 'xml';
			switch(act) {
				case 'save':
					data['blocknick'] = frmObj.blocknick.value;
					data['comment'] = frmObj.comment.value;
					data['act'] = act;
					break;
			}
			blockXmlObj.print = listProcess;
			blockXmlObj.request(data);
		}
		function listProcess(xmlObj){
			var lists = xmlObj.responseXML.getElementsByTagName("resultdata")[0];
			var message = lists.getElementsByTagName("message")[0].firstChild.nodeValue;
			if (message == '1') {
				returnAction();
			} else {
				alert(message);
			}
		}
		this.save = save;
		function save() {
			if (frmObj.blocknick.value == '') { alert("차단할 유저의 닉네임을 입력해 주세요"); frmObj.nick.focus(); return; }
			request('save');
		}
		function returnAction() {
			if (confirm('차단되었습니다. 차단창을 닫습니다.')) {
				if (window.opener) window.opener.location.reload();
				window.close();
			}
		}
	}
</script>
<div id="reportsWrap">
<form id="fmReport" name="fmReport" method="POST">
<div class="hiddenFields">
<input type="hidden" name="rurl" value="_close"/>
</div>
	<div id="reportsTop">
		<h3>쪽지 차단하기</h3>
	</div>
	<div id="reportsBody">
		<dl>
			<dt>쪽지 차단 닉네임</dt>
			<dd><input type="text" name="blocknick" id="blocknick" value=""  onKeyPress="if (event.keyCode==13){ memberBlockNote1.save();event.returnValue=false}" /></dd>
		</dl>
		<dl>
			<dt>메모</dt>
			<dd><input type="text" name="comment" id="comment" value="" maxlength="100"  onKeyPress="if (event.keyCode==13){ memberBlockNote1.save();event.returnValue=false}" /></dd>
		</dl>
		<div id="reportsHelp">
			<div id="reportsHelpTop"></div>
			<div id="reportsHelpMid">쪽지 차단할 경우 해당 유저와는 쪽지를 주고 받을 수 없으며, 최대 50명까지 차단할 수 있습니다.</div>
			<div id="reportsHelpBot"></div>
		</div>
		<div id="btnReportsSubmit"><a href="javascript:void(0);" onclick="memberBlockNote1.save();">차단하기</a></div>
		<div id="btnReportsClose"><a href="javascript:void(0);" onclick="window.close();">닫 기</a></div>
	</div>
</form>
</div>
<script>
	var memberBlockNote1 = memberBlockNote.create();
	memberBlockNote1.init('fmReport','_close','');
</script>
	</div>
	</body>
</html>