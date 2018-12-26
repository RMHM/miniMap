/* 인벤 초기화 */
try { document.domain = 'inven.co.kr'; } catch(e) { }
var INVEN = window.INVEN || {};
//var loginPage = 'http://www.inven.co.kr/www/login.php'; //로그인 페이지 주소임. 변경하지 말것.
var loginPage = 'https://member.inven.co.kr/user/scorpio/mlogin'; //로그인 페이지 주소임. 변경하지 말것.

var logoutUrl = 'https://member.inven.co.kr/user/scorpio/logout';
//var logoutUrl = 'https://login.inven.co.kr/user/pro/logout';
//var logoutUrl = 'http://www.inven.co.kr/logout.php';


/* 이벤트 관련 */
	function addEvent(obj, ev, fn) {
		/*
		if (navigator.userAgent.indexOf("MSIE") > -1) { // 파폭이면
			if (ev.substr(0,2) != 'on') ev = 'on' + ev;
			obj.attachEvent(ev,fn);
		} else {
			if (ev.substr(0,2) == 'on') ev = ev.substr(2,(ev.length) - 2);
			obj.addEventListener(ev,fn,true);
		}*/
		// IE 11 Edge 모드 부터 attachEvent는 addEventListener로 완전히 변경되었음
		if (obj.addEventListener) {
			if (ev.substr(0,2) == 'on') ev = ev.substr(2, (ev.length) - 2);
			obj.addEventListener(ev, fn, true);
		} else if (obj.attachEvent) {
			if (ev.substr(0,2) != 'on') ev = 'on' + ev;
			obj.attachEvent(ev, fn);
		}
	}

	function removeEvent(obj, ev, fn) {
		/*
		if (navigator.userAgent.indexOf("MSIE") > -1) { // 파폭이면
			if (ev.substr(0,2) != 'on') ev = 'on' + ev;
			obj.detachEvent(ev,fn);
		} else {
			if (ev.substr(0,2) == 'on') ev = ev.substr(2,(ev.length) - 2);
			obj.removeEventListener(ev,fn,true);
		}*/
		// IE 11 Edge 모드 부터 detachEvent는 removeEventListener로 완전히 변경되었음
		if (obj.removeEventListener) {
			if (ev.substr(0,2) == 'on') ev = ev.substr(2, (ev.length) - 2);
			obj.removeEventListener(ev, fn, true);
		} else if (obj.detachEvent) {
			if (ev.substr(0,2) != 'on') ev = 'on' + ev;
			obj.detachEvent(ev, fn);
		}
	}

/* 로그인 */
	function login(mode) {
		var fm = document.createElement("FORM");
		fm.style.display = 'none';
		fm.action = loginPage;
		fm.method = "POST";
		var iurl = document.createElement("INPUT");
		iurl.type = "hidden";
		iurl.name = "url";
		iurl.value = location.href;
		fm.appendChild(iurl);
		if (document.getElementById('inven-verification') && document.getElementById('inven-verification').content) {
			var verifyObj = document.createElement("INPUT");
			verifyObj.type = "hidden";
			verifyObj.name = "weblogin";
			verifyObj.value = document.getElementById('inven-verification').content;
			fm.appendChild(verifyObj);
		}
		if (mode) {
			var popt = document.createElement("INPUT");
			popt.type = "hidden";
			popt.name = "mode";
			popt.value = mode;
			fm.appendChild(popt);
		}
		if (!document.body) {
			document.write("<body></body>");
		}
		document.body.appendChild(fm);
		fm.submit();
		return false;
	}
	function requireLogin(mode) {
		if (confirm("로그인이 필요한 서비스입니다.\n\n로그인 하시겠습니까?")) {
			login(mode);
		}
	}

	function loginWrite(idx,iskin) {
		var fm = document.createElement("FORM");
		fm.style.display = 'none';
		fm.action = loginPage;
		fm.method = "POST";
		var iurl = document.createElement("INPUT");
		iurl.type = "hidden";
		iurl.name = "url";
		if (idx) {
			var temp = "http://www.inven.co.kr/board/powerbbs.php?come_idx="+idx+"&query=write&iskin="+iskin;
		} else {
			var temp = location.href;
			temp = temp.replace('&query=list','&query=write');
			temp = temp.replace('&query=view','&query=write');
		}
		iurl.value = temp;
		fm.appendChild(iurl);
		if (document.getElementById('inven-verification') && document.getElementById('inven-verification').content) {
			var verifyObj = document.createElement("INPUT");
			verifyObj.type = "hidden";
			verifyObj.name = "weblogin";
			verifyObj.value = document.getElementById('inven-verification').content;
			fm.appendChild(verifyObj);
		}
		if (!document.body) {
			document.write("<body></body>");
		}
		document.body.appendChild(fm);
		fm.submit();
		return false;
	}

	function logout() {
		var fm = document.createElement("FORM");
		fm.style.display = 'none';
		fm.action = logoutUrl;
		fm.method = "POST";
		var iurl = document.createElement("INPUT");
		iurl.type = "hidden";
		iurl.name = "s_url";
		iurl.value = location.href;
		fm.appendChild(iurl);
		document.body.appendChild(fm);
		fm.submit();
		return false;
	}

	function headOutloginShowExpend(obj) {
		obj = getObj(obj);
		var expendStyle = getObj('comHeadOutloginExpend').style;
		if (expendStyle.display == 'inline') {
			INVEN.Layer.hide('comHeadOutloginExpend', 'iframe');
		} else {
			if ((navigator.userAgent.indexOf("Chrome") > -1) && (navigator.userAgent.indexOf("Windows") > -1)) {
				if (INVEN.Ad.site == 'maple') {
					INVEN.Layer.show('comHeadOutloginExpend', 'e-400', 'n+5', 'iframe', true, obj);
				} else {
					INVEN.Layer.show('comHeadOutloginExpend', 'e-400', 'n+18', 'iframe', true, obj);
				}
				getObj('comHeadOutloginExpend').className = 'comHeadOutloginExpendT2';
			} else if ((navigator.userAgent.indexOf("Opera") > -1)) {
				INVEN.Layer.show('comHeadOutloginExpend', 'e-400', 'n+18', 'iframe', true, obj);
				getObj('comHeadOutloginExpend').className = 'comHeadOutloginExpendT2';
			} else {
				INVEN.Layer.show('comHeadOutloginExpend', 'w+0', 'n+18', 'iframe', true, obj);
			}
		}
	}
	function headOutloginShow(obj, type) {
		obj = getObj(obj);
		var boosterObj = INVEN.Booster.create();
		boosterObj.init();
		boosterObj.setDefaultGradeSplit(10);
		sinBooster = boosterObj.getSinBooster();
		var useBooster = true;
		var timeOut = new Array();
		while (timeOut.length) {
			clearTimeout(timeOut.pop());
		}
		var startPoint = -30;
		var endPoint = 0;
		if (type == 'hide') {
			startPoint = 0;
			endPoint = -30;
		}
		if (useBooster) {
			for (var i = 0; i < sinBooster.length; i++) {
				tempValue = parseInt(startPoint + (sinBooster[i] * (endPoint - startPoint)), 10);
				var fn2 = makeFn2(tempValue);
				timeOut.push(setTimeout(fn2, 20 * i));
			}
		} else {
			imageObj.style.marginLeft = endPoint + 'px';
			frameObj.style.marginLeft = endPoint + 'px';
		}
		function makeFn2(boosterValue) {
			var fn = function() {
				obj.style.marginTop = boosterValue + 'px';
			}
			return fn;
		}
	}

/* 쿠키 관련 */
	function getCookie(cookieName){
		thisCookie = document.cookie.split("; ");
		for(i=0; i<thisCookie.length; i++){
			if(cookieName == thisCookie[i].split("=")[0]){
				return thisCookie[i].split("=")[1];
			}
		}
		return "";
	}

	function setCookie(cookieName, value, expiretime, timetype) {
		var testText = '' + expiretime;
		var timetype = typeof timetype !== 'undefined' ? timetype : 'h';
		if (expiretime) {
			var expiredate = '';
			if (expiretime == 'infinite') {
				expiredate = 'Tue, 12 Dec 2999 23:59:59 UTC ';
			} else if (testText.search(new RegExp(':', 'g')) > -1) {
				expiredate = expiretime;
			} else {
				var todayDate = new Date();
				if (timetype == 'm') {
					expiretime = expiretime * 60 * 1000;
					todayDate.setTime(todayDate.getTime() +  expiretime);
				} else {
					todayDate.setHours(todayDate.getHours() +  expiretime);
				}
				expiredate = todayDate.toGMTString();
			}
			document.cookie = cookieName + "=" + escape(value) + "; path=/; expires=" + expiredate + "; domain=.inven.co.kr;";
		} else {
			document.cookie = cookieName + "=" + escape(value) + "; path=/; domain=.inven.co.kr;";
		}
	}

/* 기타 */
	function nothing() { }
	function checking() { alert("점검중입니다."); }
	function notready() { alert("준비중입니다."); }

	function getNavigator() {
		switch (navigator.appName) {
			case "Microsoft Internet Explorer": return "IE";
			case "Netscape": return "NN";
			case "Opera": return "OP";
			default: return null;
		}
	}

	function trim(string) {
		if (string.constructor == String) {
			string = string.replace(/^\s*/, "").replace(/\s*$/, "");
		} else if (string.constructor == Array) {
			for (key in string) {
				string[key] = trim(string[key]);
			}
		}
		return string;
	}

	function toInteger(value) {
		var temp = value;
		temp = '' + temp;
		temp = trim(temp);
		temp = temp.replace(/[^0-9\-\.].*$/, '');
		temp = temp == '' ? 0 : parseInt(temp, 10);
		return temp;
	}

	function getObj(obj) {
		if (obj.constructor == Array) {
			var temp = new Array();
			for (key in obj) {
				temp[key] = getObj(obj[key]);
			}
			return temp;
		} else if (typeof(obj) == 'object') {
			return obj;
		} else if (typeof(obj) == 'string') {
			return document.getElementById(obj);
		} else {
			return false;
		}
	}

	function createObj(tag, name) {
		if (name) {
			try {
				switch (tag.toLowerCase()) {
					case 'input': var obj = document.createElement("<" + tag + " name=" + name + " />"); break;
					default: var obj = document.createElement("<" + tag + " name=" + name + "></" + tag + ">"); break;
				}
			} catch(e) {
				var obj = document.createElement(tag);
				obj.name = name;
			}
		} else {
			var obj = document.createElement(tag);
		}
		return obj;
	}

	function splitAssoc(query, sep1, sep2, decode) {
		if (!query) { return new Array(); }
		var returnQuery = new Array();
		if (query.constructor == Array) {
			return query;
		} else if (typeof(query) == 'string') {
			var tempArray = query.split(sep1);
			for (var i = 0; i < tempArray.length; i++) {
				var tempOne = tempArray[i];
				var tempArrayOne = tempOne.split(sep2);
				if (decode) {
					try {
						returnQuery[tempArrayOne[0]] = decodeURIComponent(tempArrayOne[1]);
					} catch (e) {
						returnQuery[tempArrayOne[0]] = tempArrayOne[1];
					}
				} else {
					returnQuery[tempArrayOne[0]] = tempArrayOne[1];
				}
			}
		}
		return returnQuery;
	}

/* 좌표 계산 */
	INVEN.Coordination = window.INVEN.Coordination || {};
	INVEN.Coordination.object = function() {
		this.x = 0;
		this.y = 0;
	}
	INVEN.Coordination.create = function() {
		var obj = new INVEN.Coordination.object();
		return obj;
	}
	INVEN.Coordination.getAbsPos = function(obj) {
		var offsetCheck = new Array();
		var count = 0;
		var original = obj;
		obj = getObj(obj);
		var x = 0;
		var y = 0;
		while ((obj) && (obj != document.body)) {
			x += obj.offsetLeft;
			y += obj.offsetTop;
			if (obj.clientLeft) x += obj.clientLeft;
			if (obj.clientTop) y += obj.clientTop;
			obj = obj.offsetParent;

			offsetCheck[count++] = obj.offsetParent;
		}
		if ((count > 2) && (offsetCheck[0] == offsetCheck[1])){
			x -= original.offsetLeft;
			y -= original.offsetTop;
		}

		var pos =INVEN.Coordination.create();
		pos.x = x;
		pos.y = y;
		return pos;
	}

	INVEN.Coordination.getRelPos = function(obj) {
		obj = getObj(obj);

		var x = 0;
		var y = 0;
		var styleVal = '';
		while ((obj != document)) {
			if (obj.currentStyle) styleVal = obj.currentStyle.position;
			else if (window.getComputedStyle) styleVal = window.getComputedStyle(obj, "").getPropertyValue('position');
			if (styleVal == 'absolute') {
				x += obj.offsetLeft;
				y += obj.offsetTop;
			}
			obj = obj.parentNode;
		}
		var pos =INVEN.Coordination.create();
		pos.x = x;
		pos.y = y;
		return pos;
	}

/* 환경변수 */
	INVEN.browser = getNavigator();

/* 인벤링크 */
	INVEN.Links = window.INVEN.Links || {};

	INVEN.Links.myCharacter = function() {
		var charWin = window.open('https://member.inven.co.kr/user/scorpio/change/','mycharacter','left=100,top=10,width=750,height=600,resizable=no,scrollbars=yes, toolbar=0');
		charWin.focus();
	}
	INVEN.Links.myNotes = function() {
		var noteWin = window.open('http://www.inven.co.kr/member/note/','mynotes','left=100,top=100,width=747,height=494,resizable=yes,scrollbars=no, toolbar=0');
		noteWin.focus();
	}
	INVEN.Links.newNotes = function() {
		var noteWin = window.open('http://www.inven.co.kr/member/note/?asnew=1','mynotes','left=100,top=100,width=747,height=494,resizable=yes,scrollbars=no, toolbar=0');
		if (!noteWin || noteWin.closed || typeof noteWin.closed == 'undefined') {
			alert("새로운 쪽지가 있지만 팝업이 차단되었습니다.\n\n우편함을 다시 열거나 팝업 차단을 해제 해주세요.");
		} else {
			noteWin.focus();
		}
	}
	INVEN.Links.myNotesConfirm = function(winObj, isNew) {
		if (winObj.innerHeight == 0) {
			alert((isNew ? "새로운 쪽지가 있지만 " : "") + "팝업이 차단되었습니다.\n\n우편함을 다시 열거나 팝업 차단을 해제 해주세요.");
			winObj.close();
		}
	}
	INVEN.Links.myInven = function() {
		var invenWin = window.open('http://www.inven.co.kr/member/inventory/','myinventory','left=100,top=10,width=693,height=700,resizable=yes,scrollbars=yes, toolbar=0');
		invenWin.focus();
	}
	INVEN.Links.mySkill = function() {
		var skillWin = window.open('http://www.inven.co.kr/member/skill/','myskills','left=100,top=10,width=500,height=700,resizable=yes,scrollbars=yes, toolbar=0');
		skillWin.focus();
	}
	INVEN.Links.myScrap = function() {
		var scrapWin = window.open('http://www.inven.co.kr/member/scrap/','myscrap','left=100,top=10,width=933,height=787,resizable=yes,scrollbars=yes, toolbar=0');
		scrapWin.focus();
	}
	INVEN.Links.invenMarket = function() {
		//var market_window = window.open('http://www.inven.co.kr/kboard/market/market_list_item.php','market','height=740,width=810,scrollbars=1')
		var market_window = window.open('http://www.inven.co.kr/town/market/','market','height=100,width=100,scrollbars=yes,resizable=yes')
		market_window.focus();
	}
	INVEN.Links.signIn = function() {
		var regWin = window.open("https://member.inven.co.kr/user/scorpio/join/","register","toolbar=0,scrollbars=yes,resizable=0,width=750,height=700, top=100, left=100");
		//var regWin = window.open("https://member.inven.co.kr/m/join/","register","toolbar=0,scrollbars=yes,resizable=0,width=750,height=700, top=100, left=100"); //임시모바일용
		regWin.focus();
	}
	INVEN.Links.myArticle = function() {
		var articleWin = window.open('http://www.inven.co.kr/member/inventory/myarticle.php','myArticle','left=100,top=10,width=693,height=700,resizable=yes,scrollbars=yes, toolbar=0');
		articleWin.focus();
	}
	INVEN.Links.eventPopup = function() {
		var eventWin = window.open('http://www.inven.co.kr/event/common/','invenevent','left=100,top=100,width=710,height=494,resizable=yes,scrollbars=no, toolbar=0');
		eventWin.focus();
	}
	INVEN.Links.findIdPw = function() {
		//아이디/비번찾기 막을때
		//var findWin = window.open("http://www.inven.co.kr/board/powerbbs.php?come_idx=228&query=view&l=103&iskin=webzine");
		var fm = document.createElement("FORM");
		fm.style.display = 'none';
		fm.action = 'https://member.inven.co.kr/user/scorpio/find/info';
		fm.method = "POST";
		fm.target = "m_reg";
		if (document.getElementById('inven-verification') && document.getElementById('inven-verification').content) {
			var verifyObj = document.createElement("INPUT");
			verifyObj.type = "hidden";
			verifyObj.name = "weblogin";
			verifyObj.value = document.getElementById('inven-verification').content;
			fm.appendChild(verifyObj);
		}
		if (!document.body) {
			document.write("<body></body>");
		}
		document.body.appendChild(fm);

		var findWin = window.open("","m_reg","toolbar=0,scrollbars=0,resizable=0,width=750,height=700, top=100, left=100");
		fm.submit();
		findWin.focus();
		return false;
	}
	INVEN.Links.reportArticle = function(params) {
		var repWin = window.open("http://www.inven.co.kr/common/report/report.php?" + params,"","left=100,top=100,width=596,height=480,resizable=no,scrollbars=no,toolbar=0");
	}
	INVEN.Links.viewImage = function(file, loc) {
		if (!loc) loc = "";
		var url = "http://www.inven.co.kr/common/image/viewer.php?loc=" + loc + "&file=" + encodeURIComponent(file);
		window.open(url,"","left=0,top=0,width=100,height=100,resizable=yes,scrollbars=no, toolbar=0");
	}
	INVEN.Links.sendNote = function(nick, condition) {
		if (!condition) { condition = ''; }
		condition = splitAssoc(condition, ',', '->');
		condition['folder'] = 'write';
		condition['nick'] = nick;

		var url = 'http://www.inven.co.kr/member/note/';
		var link = INVEN.QueryMaker.getLink(url, condition, 'clear');
		//INVEN.Location.openWin(link, 'popup', 'name=mynotes,left=100,top=100,width=100,height=100,resizable=no,scrollbars=no, toolbar=0');
		var noteWin = window.open(link,'mynotes','left=100,top=100,width=747,height=494,resizable=yes,scrollbars=no, toolbar=0');
		noteWin.focus();
	}
	INVEN.Links.viewProfile = function(nick) {
		var url = "http://www.inven.co.kr/member/inventory/view_inventory.php?nick=" + encodeURIComponent(nick);
		var invenInventory = window.open(url,'invenInventory','width=690,height=250,toolbar=no,scrollbars=yes,resizable=yes');
		invenInventory.focus();
	}
	INVEN.Links.playAfreeca = function(url) {
		var oRunAfreeca = window.open(url, 'oRunAfreeca', 'left=10,top=10,width=10,height=10,marginwidth=0,margnheight=0,resizable=1,scrollbars=no');
		oRunAfreeca.focus();
	}
	INVEN.Links.ageVerification = function() {
		location.replace('https://member.inven.co.kr/user/aquarius/di/');
	}
	INVEN.Links.ageVerificationMobile = function() {
		location.replace('https://member.inven.co.kr/user/aquarius/di/');
	}

/* Ready State */
	INVEN.ReadyState = window.INVEN.ReadyState || {};
	INVEN.ReadyState.list = window.INVEN.ReadyState.list || new Array();
	INVEN.ReadyState.add = function(fn) {
		var n = INVEN.ReadyState.list.length;
		var exist = false;
		for (var i = 0; i < n; i++) {
			if (INVEN.ReadyState.list[i] == fn) { exist = true; }
		}
		if (!exist) { INVEN.ReadyState.list.push(fn); }
	}
	INVEN.ReadyState.exec = function() {
		var n = INVEN.ReadyState.list.length;
		for (var i = 0; i < n; i++) {
			INVEN.ReadyState.list[i]();
		}
	}

/* Location */
	/* Initialize */
		INVEN.Location = window.INVEN.Location || {};
	/* openWin */
		INVEN.Location.openWin = function(url, target, opt) {
			if (!opt) opt = "";
			if (!target) { target='_self'; }
			switch (target) {
				case 'popup':
					var defopt = splitAssoc('name=,left=100,top=100,width=100,height=100,resizable=no,scrollbars=no,location=no,toolbar=no', ',', '=');
					var opts = opt.split(",");
					for (var i in opts) {
						var optx = opts[i].split("=");
						defopt[optx[0]] = optx[1];
					}
					popOption = "left="+defopt["left"]+",top="+defopt["top"]+",width="+defopt["width"]+",height="+defopt["height"];
					popOption += ",resizable="+defopt["resizable"]+",scrollbars="+defopt["scrollbars"]+",toolbar="+defopt["toolbar"];
					popOption += ",location="+defopt["location"];

					window.open(url,defopt["name"],popOption);
					break;
				case '_blank':
					window.open(url);
					break;
				case '_self':
					location.href = url;
					break;
				default:
					window.open(url, target);
			}
		}
	/* getSiteRootPath */
		INVEN.Location.getSiteRootPath = function(path) {
			if (!path) path = location.href;
			var matches = path.match(/http:\/\/([^.]*).inven.co.kr\/?([^\/]*)\/?/);
			var temp = "/";
			if (!matches) {
				var matches = path.match(/http:\/\/inven.co.kr\/([^\/]*)\/?/);
				if (matches) temp += matches[1] + "/";
			} else {
				if (matches[1] == 'www') temp += matches[2] + "/";
			}
			return temp;
		}

/* 쿼리 생성기 */
	INVEN = window.INVEN || {};
	INVEN.QueryMaker = window.INVEN.QueryMaker || {};
	INVEN.QueryMaker.virtualHref = window.INVEN.QueryMaker.virtualHref || location.href.toString();
	INVEN.QueryMaker.objects = window.INVEN.QueryMaker.objects || new Array();
	INVEN.QueryMaker.create = function() {
		var n = INVEN.QueryMaker.objects.length;
		INVEN.QueryMaker.objects[n] = new INVEN.QueryMaker.object();
		return INVEN.QueryMaker.objects[n];
	}
	INVEN.QueryMaker.object = function() {
		var optionArray = new Array();
		this.setDefalutOption = function(changeOption) {
			optionArray['default'] = INVEN.QueryMaker.getOptionArray(changeOption, '->', ',');
		}
		this.getLink = function(file, change, changeOption) {
			optionArray['option'] = INVEN.QueryMaker.getOptionArray(changeOption, '->', ',');
			optionArray['option'] = mergeOption();
			return INVEN.QueryMaker.getLink(file, change, optionArray['option']);
		}
		function mergeOption() {
			var finalOptionArray = new Array();
			var defaultKey = 0;
			var optionKey = 0;
			var processKey = 0;
			switch (optionArray['default']['type']) {
				case 'leave': defaultKey = 20; break;
				case 'remove': defaultKey = 30; break;
				case 'clear': defaultKey = 40; break;
				default: processKey = 10; break;
			}
			switch (optionArray['option']['type']) {
				case 'leave': optionKey = 2; break;
				case 'remove': optionKey = 3; break;
				case 'clear': processKey = 4; break;
				default: processKey = 1; break;
			}
			if (!processKey) {
				processKey = defaultKey + optionKey;
			}
			switch (processKey) {
				case 1:
				case 43:
					finalOptionArray = optionArray['default'];
					break;
				case 4:
				case 10:
				case 32:
				case 42:
					finalOptionArray = optionArray['option'];
					break;
				case 22:
				case 33:
					finalOptionArray = optionArray['default'];
					for (var key in optionArray['option']['value']) {
						finalOptionArray['value'][key] = true;
					}
					break;
				case 23:
					finalOptionArray = optionArray['default'];
					for (var key in optionArray['option']['value']) {
						finalOptionArray['value'][key] = false;
					}
					break;
			}
			return finalOptionArray;
		}
	}
	INVEN.QueryMaker.getOptionArray = function(query, sep1, sep2) {
		if (!query) { return new Array(); }
		returnOption = new Array();
		if (query.constructor == Array) {
			return query;
		} else if (typeof(query) == 'string') {
			var optionArray = query.split(sep1);
			returnOption['type'] = optionArray[0];
			if (optionArray[1]) {
				var queryArray = optionArray[1].split(sep2);
				var queryArrayTemp = new Array();
				var valueLen = queryArray.length;
				for (var i = 0; i < valueLen; i++) {
					queryArrayTemp[queryArray[i]] = true;
				}
				returnOption['value'] = new Array();
				returnOption['value'] = queryArrayTemp;
			} else if (returnOption['type'] != 'clear') {
				return new Array();
			}
		}
		return returnOption;
	}
	INVEN.QueryMaker.setVirtualHref = function(file) {
		INVEN.QueryMaker.virtualHref = file;
	}
	INVEN.QueryMaker.resetVirtualHref = function() {
		INVEN.QueryMaker.virtualHref = location.href.toString();
	}
	INVEN.QueryMaker.addVirtualCondition = function(change) {
		INVEN.QueryMaker.virtualHref = INVEN.QueryMaker.getLink(INVEN.QueryMaker.virtualHref, change);
	}
	INVEN.QueryMaker.getLink = function(file, change, changeOption) {
		if (!change) {
			change = '';
		}
		function processQuery(file, change, changeOption) {
			var queryArray = new Array();
			var queryStart = '';
			queryArray = getUrl();
			queryArray['current'] = splitAssoc(queryArray['current'], '&', '=', true);
			if (change.constructor == Array) {
				queryArray['change'] = change;
			} else {
				queryArray['change'] = splitAssoc(change, ',', '->');
			}
			queryArray['option'] = INVEN.QueryMaker.getOptionArray(changeOption, '->', ',');
			var finalQueryArray = getFinalQueryArray(queryArray);
			var query = getArrayFromQuery(finalQueryArray);
			if (queryArray['file'] && query) {
				queryStart = '?';
			}
			var finalUrl = queryArray['file'] + queryStart + query;
			return finalUrl;
		}
		function getUrl() {
			var returnQuery = new Array();
			var url = INVEN.QueryMaker.virtualHref ? INVEN.QueryMaker.virtualHref : location.href.toString();
			var temp = url.split('#');
			url = temp[0];
			var temp = url.split('?');
			if (!file) {
				file = temp[0];
			}
			returnQuery['file'] = file;
			returnQuery['current'] = temp[1];
			return returnQuery;
		}
		function getFinalQueryArray(queryArray) {
			var finalArray = new Array();
			switch (queryArray['option']['type']) {
				case 'remove':
					finalArray = removeQuery(queryArray);
					break;
				case 'leave':
					finalArray = leaveQuery(queryArray);
					break;
				case 'clear':
					finalArray = queryArray['change'];
					break;
				default:
					finalArray = queryArray['current'];
					break;
			}
			for (var changeKey in queryArray['change']) {
				//if (queryArray['change'][changeKey].constructor == Array) {
				//	finalArray[changeKey] = queryArray['change'][changeKey].join(',');
				//} else {
					finalArray[changeKey] = queryArray['change'][changeKey];
				//}
			}
			return finalArray;
		}
		function removeQuery(queryArray) {
			for (var removeKey in queryArray['option']['value']) {
				if (queryArray['option']['value'][removeKey]) {
					queryArray['current'][removeKey] = false;
				}
			}
			return queryArray['current'];
		}
		function leaveQuery(queryArray) {
			var tempQueryArray = new Array();
			for (var leaveKey in queryArray['option']['value']) {
				if (queryArray['option']['value'][leaveKey]) {
					tempQueryArray[leaveKey] = queryArray['current'][leaveKey];
				}
			}
			return tempQueryArray;
		}
		function getArrayFromQuery(queryArray) {
			var finalQueryArray = new Array();
			for (queryKey in queryArray) {
				if (queryArray[queryKey]) {
					finalQueryArray.push(queryKey + '=' + encodeURIComponent(queryArray[queryKey]));
				}
			}
			var finalQuery = finalQueryArray.join('&');
			return finalQuery;
		}
		return processQuery(file, change, changeOption);
	}

/* Common Nick Print */
	/* Initialise */
		var INVEN = window.INVEN || {};
		INVEN.NickMenuHandler = window.NickMenuHandler || {};
	/* Handler */
		INVEN.NickMenuHandler.create = function() {
			var tempObj = new INVEN.NickMenuHandler.object();
			return tempObj;
		}
		INVEN.NickMenuHandler.object = function() {
			/* Privates */
				var menus = new Array();
				var insObj = this;
			/* Menu Functions */
				this.addMenu = function(menucode, caption, link) {
					menus[menucode] = new Array();
					menus[menucode]['caption'] = caption;
					menus[menucode]['link'] = link;
				}
			/* Print Menu */
				function printMenu(ulObj, key, value, nick) {
					var liObj = document.createElement('li');
					liObj.className = key;
						var aObj = document.createElement('a');
						aObj.href = 'javascript:nothing();';
						if (key == 'close') {
							aObj.onclick = hideLayer;
							aObj.appendChild(document.createTextNode('닫기'));
						} else {
							aObj.onclick = function() { menuClicked(key, value, nick); };
							aObj.appendChild(document.createTextNode(value['caption']));
						}
						liObj.appendChild(aObj);
					ulObj.appendChild(liObj);
				}
			/* Menu Clicked */
				function menuClicked(key, value, nick) {
					if (value['link']) {
						var url = value['link'] + encodeURIComponent(nick);
					}
					INVEN.Location.openWin(url, 'popup');
				}
			/* Show */
				this.show = function(nick) {
					var layerObj = getObj('comPrintNickMenu');
					if (!layerObj) {
						layerObj = document.createElement("DIV");
						layerObj.id = 'comPrintNickMenu';
						document.body.appendChild(layerObj);
					} else if (layerObj.parentNode != document.body) {
						layerObj.parentNode.removeChild(layerObj);
						document.body.appendChild(layerObj);
					}
					clearMenu(layerObj);
					INVEN.Layer.show(layerObj, 5, 5, false, false);
					var ulObj = document.createElement('ul');
					for (var key in menus) {
						var value = menus[key];
						if (value) {
							printMenu(ulObj, key, value, nick);
						}
					}
					var closeMenu = new Array();
					printMenu(ulObj, 'close');
					layerObj.appendChild(ulObj);
					addEvent(document,'onmouseup',hideLayer);
				}
			/* Hide */
				function hideLayer() {
					removeEvent(document,'onmouseup',hideLayer);
					var layerObj = getObj('comPrintNickMenu');
					INVEN.Layer.hide(layerObj);
				}
			/* Clear */
				function clearMenu(obj) {
					var chs = obj.childNodes;
					var n = chs.length;
					for (var i = n - 1; i >= 0; i--) {
						obj.removeChild(chs[i]);
					}
				}
		}

/* Floating Alert */
	INVEN.FloatingAlert = window.INVEN.FloatingAlert || {};
	INVEN.FloatingAlert.create = function() {
		var obj = new INVEN.FloatingAlert.object();
		obj.init();
		return obj;
	}
	INVEN.FloatingAlert.object = function() {
		var layerObj = null;
		var layerIframeObj = null;
		var textWrapObj = null;
		var layerOutTimer = 0;
		var layerOutDelay = 10000;
		var textLimit = 0;
		var textCache = new Array();
		var ready = false;
		var layerTargetX = null;
		var layerTargetY = null;

		this.init = function() {
			addEvent(window, 'onload', setReady);
			//INVEN.ReadyState.add(forceReady);
		}

		function setReady() {
			removeEvent(window, 'onload', setReady);
			if (!layerObj) {
				layerObj = document.createElement("DIV");
				layerObj.id = 'comFloatAlert';
				layerObj.style.display = 'none';
				textWrapObj = document.createElement("UL");
				textWrapObj.className = 'textlist';
				layerObj.appendChild(textWrapObj);
				document.body.appendChild(layerObj);
			}
			ready = true;
		}

		function checkIframeObj() {
			if (!layerIframeObj) {
				layerIframeObj = document.createElement("IFRAME");
				layerIframeObj.src = 'about:blank';
				layerIframeObj.style.display = 'none';
				layerIframeObj.frameBorder = 0;
				layerIframeObj.style.position = "absolute";
				layerIframeObj.style.styleFloat = "left";
				layerIframeObj.style.display = "none";
				document.body.appendChild(layerIframeObj);
			}
		}

		function forceReady() {
			setReady();
		}
		this.forceReady = forceReady;

		this.setTextLimit = function(count) { textLimit = count; }

		function addText(text, fade) {
			if (!ready) {
				setTimeout(function() { addText(text, fade); }, 1000);
				return;
			}
			var temp = new Array();
			temp['object'] = document.createElement("LI");
			temp['object'].appendChild(document.createTextNode(text));
			textWrapObj.appendChild(temp['object']);
			temp['hideFn'] = function() { hideText(temp); }
			temp['object'].onclick = temp['hideFn'];
			temp['hideTimeout'] = 0;
			if (fade > 0) {
				showAlert(true);
				temp['hideTimeout'] = setTimeout(temp['hideFn'], fade);
			} else {
				showAlert(false);
			}
			textCache.push(temp);
			limitText();
		}
		this.addText = addText;

		function limitText() {
			if (textLimit > 0) {
				if (textCache.length > textLimit) {
					for (var i = 0; i < textCache.length - textLimit; i++) {
						var temp = textCache.shift();
						if (temp['hideTimeout']) { clearTimeout(temp['hideTimeout']); temp['hideTimeout'] = 0; }
						if (temp['object'] && temp['object'].parentNode) {
							temp['object'].parentNode.removeChild(temp['object']);
						}
					}
				}
			}
		}

		function hideText(textObj) {
			obj = textObj['object'];
			if (textObj['hideTimeout']) { clearTimeout(textObj['hideTimeout']); textObj['hideTimeout'] = 0; }
			if (!obj) { return; }
			var parentObj = obj.parentNode;
			parentObj.removeChild(obj);
			var n = parentObj.getElementsByTagName("LI").length;
			if (n == 0) {
				hideAlert();
			}
		}

		function showAlert(preserve) {
			if (!preserve) { preserve = false; }
			if ((layerTargetY === null) && (layerObj.style.display == 'none')) {
				layerObj.style.visibility = 'hidden';
				layerObj.style.display = 'inline';
				var height = layerObj.offsetHeight + toInteger(layerObj.style.borderBottomWidth) + toInteger(layerObj.style.borderTopWidth);
				layerObj.style.top = height * (-1);
				layerObj.style.visibility = 'visible';
				showInventory(false);
				layerTargetY = 0;
				showAlertProcess();
			}
			if (layerOutTimer) { window.clearTimeout(layerOutTimer); }
			if (!preserve) {
				layerOutTimer = setTimeout(hideAlert, layerOutDelay);
			}
		}

		function syncIframeStyle() {
			if (!layerObj || !layerIframeObj) { return; }
			checkIframeObj();
			if (layerObj.style.display == 'none') {
				layerIframeObj.style.display = 'none';
			} else {
				layerIframeObj.style.zIndex = layerObj.style.zIndex - 1;
				layerIframeObj.style.left = layerObj.offsetLeft;
				layerIframeObj.style.top = layerObj.offsetTop;
				layerIframeObj.style.width = layerObj.offsetWidth;
				layerIframeObj.style.height = layerObj.offsetHeight + 50;
				layerIframeObj.style.display = 'inline';
			}
		}

		function showAlertProcess() {
			if (layerTargetY === null) { return; }
			var top = layerObj.offsetTop;
			var modeY = 0;
			switch (true) {
				case (layerTargetY > top): modeY = +1; break;
				case (layerTargetY < top): modeY = -1; break;
			}
			layerObj.style.top = top + modeY;
			if (modeY != 0) {
				setTimeout(showAlertProcess, 0);
			} else {
				layerTargetY = null;
			}
			if ((modeY == 0) && (top < 0)) {
				layerObj.style.display = 'none';
				showInventory(true);
			}
			syncIframeStyle();
		}

		function hideAlert() {
			if (layerOutTimer) { window.clearTimeout(layerOutTimer); }
			var height = layerObj.offsetHeight + toInteger(layerObj.style.borderBottomWidth) + toInteger(layerObj.style.borderTopWidth);
			layerTargetY = height * (-1);
			showAlertProcess();
		}

		function showInventory(show) {
			var temp = getObj("comHeadlink");
			if (!temp) { return; }
			temp = temp.getElementsByTagName("SELECT")[0];
			if (!temp) { return; }
			temp.style.visibility = show ? 'visible' : 'hidden';
		}


	}

	INVEN.FloatingAlert.HeadBlind = INVEN.FloatingAlert.create();
	INVEN.FloatingAlert.HeadBlind.setTextLimit(5);

/* TEMPORARY */
	// DIR_PATH를 구함
	function getDirPath(path) {
		if (!path) path = location.href;
		var temp = '';
		var matches = path.match(/http:\/\/([^.]*).inven.co.kr\/?([^\/]*)\/?/);
		if (!matches) {
			var matches = path.match(/http:\/\/inven.co.kr\/([^\/]*)\/?/);
			temp = (matches) ? matches[1] : 'www';
		} else {
			temp = (matches[1] == 'www') ? matches[2] : matches[1];
		}
		return temp;
	}
	// 현재 주소에 따라 최상위 절대경로 추출
	function getSiteRootPath(path) {
		if (!path) path = location.href;
		var matches = path.match(/http:\/\/([^.]*).inven.co.kr\/?([^\/]*)\/?/);
		var temp = "/";
		if (!matches) {
			var matches = path.match(/http:\/\/inven.co.kr\/([^\/]*)\/?/);
			if (matches) temp += matches[1] + "/";
		} else {
			if (matches[1] == 'www') temp += matches[2] + "/";
		}
		return temp;
	}

/* ClipBoard Copy */
	function clipboadCopy(text) {
		if ((getNavigator() == 'IE') && window.clipboardData) {
			if (window.clipboardData.setData("Text", text)) {
				alert('복사되었습니다');
			} else {
				clipboadCopyFalse(text);
			}
		} else {
			clipboadCopyFalse(text);
		}
		function clipboadCopyFalse(text) {
			var floatObj = document.getElementById('clipboardCoryForNoneIE');
			if (!floatObj) {
				var divObj = document.createElement('DIV');
				divObj.id = 'clipboardCoryForNoneIE';
				divObj.style.position = 'absolute';
				divObj.style.left = 0;
				divObj.style.top = 0;
				divObj.style.display = 'none';
				divObj.style.styleFloat = 'left';
				divObj.style.cssFloat = 'left';
				divObj.style.width = '300px';
				divObj.style.backgroundColor = 'white';
				divObj.style.border = '1px solid black';
				divObj.style.padding = '5px';
				var labelObj = document.createElement('label');
				labelObj.style.clear = 'both';
				labelObj.style.display = 'inline';
				labelObj.style.styleFloat = 'left';
				labelObj.style.cssFloat = 'left';
				labelObj.innerHTML = '아래 내용을 복사해주세요.';
				var textareaObj = document.createElement('textarea');
				textareaObj.style.clear = 'both';
				textareaObj.style.display = 'inline';
				textareaObj.style.stylefloat = 'left';
				textareaObj.style.CSSfloat = 'left';
				textareaObj.style.width = '300px';
				textareaObj.style.height = '100px';
				var inputObj = document.createElement('input');
				inputObj.style.clear = 'both';
				inputObj.style.display = 'inline';
				inputObj.style.stylefloat = 'left';
				inputObj.style.CSSfloat = 'left';
				inputObj.style.border = '1px solid black';
				inputObj.style.width = '300px';
				inputObj.style.marginTop = '5px';
				inputObj.type = 'button';
				inputObj.value = '닫기';
				inputObj.onclick = function() {
					INVEN.Layer.hide('clipboardCoryForNoneIE');
				}
				divObj.appendChild(labelObj);
				divObj.appendChild(textareaObj);
				divObj.appendChild(inputObj);
				floatObj = divObj;
				document.body.appendChild(floatObj);
			}
			var textObj = INVEN.Html.getChildNodes(floatObj, 'textarea', true)[0];
			textObj.value = text;
			INVEN.Layer.show(floatObj, 'm+10', 'm+10', false, true);
		}
	}

/* ONCLICK FOR HREF */
	function onclickHref(e, fn) {
		function getEvent(eventObj) {
			if (navigator.userAgent.indexOf("MSIE") > -1) {
				return event;
			} else {
				return eventObj;
			}
		}
		e = getEvent(e);
		if (e.ctrlKey == true || e.shiftKey == true) {
			return true;
		} else {
			fn();
			return false;
		}
	}

/* SYSTEM */
	/* Initialize */
		INVEN.System = window.INVEN.System || {};
	/* Report */
		INVEN.System.reportPost = function(system, indexs) {
			var url = 'http://www.inven.co.kr/common/report/report.php';
			var condition = new Array();
			condition['rcidx'] = system;
			if (indexs.constructor != Array) {
				indexs = splitAssoc(indexs, ',', '->');
			}
			for (var key in indexs) {
				condition[key] = indexs[key];
			}
			var link = INVEN.QueryMaker.getLink(url, condition, 'clear');
			INVEN.Location.openWin(link, 'popup', "scrollbars=no");
		}

/* BOOK MARK */
	INVEN.invenBookmark = window.INVEN.invenBookmark || {};
	INVEN.invenBookmark.onloadCheck = false;
	INVEN.invenBookmark.initLayer = function() {
		INVEN.invenBookmark.onloadCheck = true;
		removeEvent(window, 'onload', INVEN.invenBookmark.initLayer);
	}
	addEvent(window, 'onload', INVEN.invenBookmark.initLayer);
	INVEN.invenBookmark.openBookmark = function(obj, xpos, ypos) {
		if (INVEN.invenBookmark.onloadCheck) {
			var bookmarkObj = getObj('invenBookmark');
			if (!bookmarkObj) {
				bookmarkObj = INVEN.invenBookmark.loadBookmark();
			}
			if (bookmarkObj.style.display == 'inline') {
				var bookmarkFormObj = getObj('invenBookmarkForm');
				if (bookmarkFormObj) {
					bookmarkFormObj.style.display = 'none';
				}
				INVEN.Layer.hide(bookmarkObj,true);
			} else {
				if (obj) {
					obj = getObj(obj);
					if (!xpos) {
						xpos = 'e+5f';
					}
					if (!ypos) {
						ypos = 'n+0f';
					}
					INVEN.Layer.show(bookmarkObj, xpos, ypos, false, true, obj);
				} else {
					INVEN.Layer.show(bookmarkObj, 0, 0, false, true);
				}
			}
		} else {
			alert('페이지 로딩이 완료되어야 사용 가능합니다.');
		}
	}
	INVEN.invenBookmark.closeBookmark = function(bookmarkObj) {
		var bookmarkFormObj = getObj('invenBookmarkForm');
		if (bookmarkFormObj) {
			bookmarkFormObj.style.display = 'none';
		}
		INVEN.Layer.hide(bookmarkObj,true);
	}
	INVEN.invenBookmark.loadBookmark = function() {
		var bookmarkObj = getObj('invenBookmark');
		if (bookmarkObj) {
			document.body.removeChild(bookmarkObj);
		}
		function makeMenu() {
			var bookmarkMenuObj = createObj('div');
			bookmarkMenuObj.className = 'bookmarkMenu';
			var ulObj = createObj('ul');
			var liObj1 = createObj('li');
			var aObj1 = createObj('a');
			aObj1.href = 'javascript:nothing();';
			aObj1.innerHTML = '[제목순 정렬]';
			liObj1.appendChild(aObj1);
			//ulObj.appendChild(liObj1);
			var liObj2 = createObj('li');
			var aObj2 = createObj('a');
			aObj2.href = 'javascript:nothing();';
			aObj2.innerHTML = '[시간순 정렬]';
			liObj2.appendChild(aObj2);
			//ulObj.appendChild(liObj2);
			var liObj3 = createObj('li');
			liObj3.className = 'right';
			var aObj3 = createObj('a');
			aObj3.href = 'javascript:nothing();';
			aObj3.onclick = function() {
				INVEN.invenBookmark.addAction();
			}
			aObj3.innerHTML = '[즐겨찾기 추가]';
			liObj3.appendChild(aObj3);
			ulObj.appendChild(liObj3);
			bookmarkMenuObj.appendChild(ulObj);
			return bookmarkMenuObj;
		}
		var bookmarkObj = createObj('div');
		bookmarkObj.id = 'invenBookmark';
		var bookmarkBodyObj = createObj('div');
		bookmarkBodyObj.className = 'invenBookmarkBody';
		var headTitleObj = createObj('h3');
		headTitleObj.className = 'bookmarkTitle';
		headTitleObj.innerHTML = '내 즐겨찾기';
		bookmarkBodyObj.appendChild(headTitleObj);
		var closeObj = createObj('div');
		closeObj.className = 'close';
		var aObj = createObj('a');
		aObj.href = 'javascript:nothing();';
		aObj.onclick = function() {
			INVEN.invenBookmark.closeBookmark(bookmarkObj);
		}
		aObj.innerHTML = '닫기';
		closeObj.appendChild(aObj);
		bookmarkBodyObj.appendChild(closeObj);
		var tempObj = makeMenu();
		bookmarkBodyObj.appendChild(tempObj);
		var listObj = createObj('div');
		listObj.className = 'bookmarkList loading';
		bookmarkBodyObj.appendChild(listObj);
		var ulObj = createObj('ul');
		ulObj.bookmarkObj = bookmarkObj;
		INVEN.invenBookmark.loadList(ulObj);
		listObj.appendChild(ulObj);
		bookmarkObj.listObj = ulObj;
		bookmarkBodyObj.appendChild(listObj);
		var tempObj = makeMenu();
		tempObj.className = 'bookmarkMenu bookmarkMenuNoBorder';
		bookmarkBodyObj.appendChild(tempObj);
		bookmarkObj.appendChild(bookmarkBodyObj);
		document.body.appendChild(bookmarkObj);
		return bookmarkObj;
	}
	INVEN.invenBookmark.loadList = function(ulObj) {
		var bookmarkObj = ulObj.bookmarkObj;
		if (!ulObj.iframeObj) {
			var iframeObj = createObj('iframe', 'invenBookmarkGetList');
			ulObj.iframeObj = iframeObj;
			ulObj.iframeObj.style.display = 'none';
			bookmarkObj.appendChild(iframeObj);
			addEvent(ulObj.iframeObj, 'onload', function() {
				var bookmarkData = new Array();
				var documentObj = ulObj.iframeObj.contentWindow ? ulObj.iframeObj.contentWindow : ulObj.iframeObj.contentDocument;
				bookmarkData = documentObj.bookmarkData;
				INVEN.invenBookmark.makeList(ulObj, bookmarkData);
				ulObj.parentNode.className = 'bookmarkList';
			});
		}
		var d = new Date();
		ulObj.iframeObj.src = 'http://www.inven.co.kr/town/bookmark/bookmark_getlist.php?dummy='+(d.getTime()/1000);
	}
	INVEN.invenBookmark.makeList = function(ulObj, bookmarkData) {
		INVEN.Html.removeChildAll(ulObj);
			if (bookmarkData.length <= 0) {
				var tempArray = new Array();
				tempArray['bookmarkcode'] = 0;
				tempArray['subject'] = '저장된 즐겨찾기가 없습니다.';
				bookmarkData.push(tempArray);
			}
			for (var i = 0; i < bookmarkData.length; i++) {
				var dataOne = bookmarkData[i];
				var liObj = createObj('li');
				function fn1(obj) {
					var fn = function() {
						INVEN.invenBookmark.overAction(obj);
					}
					return fn;
				}
				function fn2(code, subject) {
					var fn = function() {
						INVEN.invenBookmark.modifyAction(code, subject);
					}
					return fn;
				}
				function fn3(code) {
					var fn = function() {
						INVEN.invenBookmark.deleteAction(code);
					}
					return fn;
				}
				var spanObj1 = createObj('span');
				spanObj1.className = 'title';
				if (dataOne['bookmarkcode']) {
					var aObj1 = createObj('a');
					aObj1.href = dataOne['link'];
					aObj1.innerHTML = dataOne['subject'];
					aObj1.className = 'title';
					aObj1.title = dataOne['subject'];
					spanObj1.appendChild(aObj1);
					liObj.appendChild(spanObj1);
					var spanObj2 = createObj('span');
					spanObj2.className = 'menu';
					var aObj3 = createObj('a');
					aObj3.href = 'javascript:nothing();';
					aObj3.innerHTML = 'M';
					aObj3.title = '수정';
					aObj3.onclick = fn2(dataOne['bookmarkcode'], dataOne['subject']);
					aObj3.className = 'menu';
					spanObj2.appendChild(aObj3);
					var aObj4 = createObj('a');
					aObj4.href = 'javascript:nothing();';
					aObj4.innerHTML = 'D';
					aObj4.title = '삭제';
					aObj4.className = 'menu';
					aObj4.onclick = fn3(dataOne['bookmarkcode']);
					spanObj2.appendChild(aObj4);
					liObj.appendChild(spanObj2);
				} else {
					spanObj1.innerHTML = dataOne['subject'];
					liObj.appendChild(spanObj1);
				}
				liObj.onmouseover = fn1(liObj);
				ulObj.appendChild(liObj);
			}
	}
	INVEN.invenBookmark.loadForm = function() {
		var bookmarkFormObj = getObj('invenBookmarkForm');
		if (!bookmarkFormObj) {
			bookmarkFormObj = createObj('div');
			bookmarkFormObj.id = 'invenBookmarkForm';
			var divBodyObj = createObj('div');
			divBodyObj.className = 'invenBookmarkFormBody';
			var iframeObj = createObj('iframe', 'invenBookmarkFormSubmit');
			iframeObj.style.display = 'none';
			bookmarkFormObj.iframeObj = iframeObj;
			var formObj = createObj('form');
			formObj.id = 'invenBookmarkForm1';
			formObj.name = 'invenBookmarkForm1';
			formObj.action = '';
			formObj.method = 'POST';
			formObj.target = 'invenBookmarkFormSubmit';
			bookmarkFormObj.formObj = formObj;
			var inputHiddenObj1 = createObj('input');
			inputHiddenObj1.type = 'hidden';
			inputHiddenObj1.name = 'url';
			bookmarkFormObj.urlObj = inputHiddenObj1;
			var inputHiddenObj2 = createObj('input');
			inputHiddenObj2.type = 'hidden';
			inputHiddenObj2.name = 'code';
			bookmarkFormObj.codeObj = inputHiddenObj2;
			var labelObj = createObj('label');
			bookmarkFormObj.labelObj = labelObj;
			var inputObj1 = createObj('input');
			inputObj1.type = 'text';
			inputObj1.name = 'subject';
			inputObj1.className = 'bookmarktext';
			bookmarkFormObj.subjectObj = inputObj1;
			/*
			var inputObj2 = createObj('input');
			inputObj2.type = 'submit';
			inputObj2.className = 'bookmarksubmit';
			inputObj2.value = '추가';
			*/
			var inputObj2 = createObj('span');
			inputObj2.className = 'bookmarksubmit';
			inputObj2.innerHTML = '추가';
			bookmarkFormObj.submitObj = inputObj2;
			formObj.appendChild(labelObj);
			formObj.appendChild(inputObj1);
			formObj.appendChild(inputObj2);
			formObj.appendChild(inputHiddenObj1);
			formObj.appendChild(inputHiddenObj2);
			divBodyObj.appendChild(iframeObj);
			divBodyObj.appendChild(formObj);
			bookmarkFormObj.appendChild(divBodyObj);
			document.body.appendChild(bookmarkFormObj);
		}
		bookmarkFormObj.iframeObj.onload = nothing;
		return bookmarkFormObj;
	}
	INVEN.invenBookmark.addAction = function() {
		var bookmarkFormObj = INVEN.invenBookmark.loadForm();
		if (bookmarkFormObj) {
			bookmarkFormObj.style.display = 'inline';
		}
		bookmarkFormObj.labelObj.innerHTML = '[추가] 제목을 입력해주세요.';
		bookmarkFormObj.submitObj.innerHTML = '추가';
		bookmarkFormObj.subjectObj.value = INVEN.invenBookmark.getDefaultSubject();
		bookmarkFormObj.urlObj.value = INVEN.invenBookmark.getNowLink();
		bookmarkFormObj.formObj.action = 'http://www.inven.co.kr/town/bookmark/bookmark_add.php';
		bookmarkFormObj.submitObj.onclick = fnAddSubmit();
		bookmarkFormObj.formObj.onsubmit = fnAddSubmit();

		function fnAddSubmit() {
			var fn = function() {
				if (bookmarkFormObj.urlObj.value.replace(/ /g,"") < 1) {
					alert('주소를 가져오는데 실패했습니다.');
				} else if (bookmarkFormObj.subjectObj.value.replace(/ /g,"") < 1) {
					alert('제목을 입력해주세요.');
				} else {
					var fn1 = function() {
						var bookmarkObj = getObj('invenBookmark');
						INVEN.invenBookmark.loadList(bookmarkObj.listObj);
					}
					var fn2 = false;
					fn2 = function() {
						bookmarkFormObj.style.display = 'none';
						setTimeout(fn1, 500);
						removeEvent(bookmarkFormObj.iframeObj, 'onload', fn2);
					}
					addEvent(bookmarkFormObj.iframeObj, 'onload', fn2);
					bookmarkFormObj.formObj.submit();
				}
				return false;
			}
			return fn;
		}
		INVEN.Layer.show(bookmarkFormObj, 0, 0, false, true);
		bookmarkFormObj.subjectObj.focus();
	}
	INVEN.invenBookmark.modifyAction = function(code, subject) {
		var bookmarkFormObj = INVEN.invenBookmark.loadForm();
		if (bookmarkFormObj) {
			bookmarkFormObj.style.display = 'inline';
		}
		bookmarkFormObj.labelObj.innerHTML = '[수정] 제목을 입력해주세요.';
		bookmarkFormObj.submitObj.innerHTML = '수정';
		bookmarkFormObj.subjectObj.value = subject;
		bookmarkFormObj.codeObj.value = code;
		bookmarkFormObj.formObj.action = 'http://www.inven.co.kr/town/bookmark/bookmark_modify.php';
		bookmarkFormObj.submitObj.onclick = fnModSubmit();
		bookmarkFormObj.formObj.onsubmit = fnModSubmit();

		function fnModSubmit() {
			var fn = function() {
				if (!code) {
					alert('주소를 가져오는데 실패했습니다.');
				} else if (bookmarkFormObj.subjectObj.value.replace(/ /g,"") < 1) {
					alert('제목을 입력해주세요.');
				} else {
					var fn1 = function() {
						var bookmarkObj = getObj('invenBookmark');
						INVEN.invenBookmark.loadList(bookmarkObj.listObj);
					}
					var fn2 = false;
					fn2 = function() {
						bookmarkFormObj.style.display = 'none';
						setTimeout(fn1, 500);
						removeEvent(bookmarkFormObj.iframeObj, 'onload', fn2);
					}
					addEvent(bookmarkFormObj.iframeObj, 'onload', fn2);
					bookmarkFormObj.formObj.submit();
				}
				return false;
			}
			return fn;
		}

		INVEN.Layer.show(bookmarkFormObj, 0, 0, false, true);
		bookmarkFormObj.subjectObj.focus();
	}
	INVEN.invenBookmark.deleteAction = function(code) {
		var bookmarkFormObj = INVEN.invenBookmark.loadForm();
		if (bookmarkFormObj) {
			bookmarkFormObj.style.display = 'none';
		}
		bookmarkFormObj.codeObj.value = code;
		bookmarkFormObj.formObj.action = 'http://www.inven.co.kr/town/bookmark/bookmark_delete.php';
		var fn1 = function() {
			if (!code) {
				alert('주소를 가져오는데 실패했습니다.');
			} else {
				var fn1 = function() {
					var bookmarkObj = getObj('invenBookmark');
					INVEN.invenBookmark.loadList(bookmarkObj.listObj);
				}
				var fn2 = false;
				fn2 = function() {
					setTimeout(fn1, 500);
					removeEvent(bookmarkFormObj.iframeObj, 'onload', fn2);
				}
				addEvent(bookmarkFormObj.iframeObj, 'onload', fn2);
			}
			return false;
		}
		if (confirm('삭제하시겠습니까?')) {
			fn1();
			bookmarkFormObj.formObj.submit();
		}
	}
	INVEN.invenBookmark.overAction = function(obj) {
		obj = getObj(obj);
		obj.className = 'showMenu';
		obj.onmouseout = function() {
			INVEN.invenBookmark.outAction(obj);
		}
	}
	INVEN.invenBookmark.outAction = function(obj) {
		obj = getObj(obj);
		obj.className = '';
	}
	if (!INVEN.invenBookmark.defaultSubject) {
		INVEN.invenBookmark.defaultSubject = '';
	}
	INVEN.invenBookmark.getDefaultSubject = function() {
		if (!INVEN.invenBookmark.defaultSubject) {
			INVEN.invenBookmark.defaultSubject = document.title;
		}
		return INVEN.invenBookmark.defaultSubject;
	}
	INVEN.invenBookmark.getNowLink = function() {
		return location.href;
	}

/* POPVOTE */
	INVEN.popvote = window.INVEN.popvote || {};
	INVEN.popvote.open = function(obj, voteidx, popw, poph, xpos, ypos, skin, col) {
		var invenVoteObj = getObj('comInvenVote_'+voteidx);
		if (!invenVoteObj) {
			if (!popw) popw = 470;
			if (!poph) poph = 500;
			if (!xpos) xpos = 0;
			if (!ypos) ypos = 0;
			if (!skin) skin = 'W470_GRAY1';
			if (!col) col = 1;
			invenVoteObj = createObj('div', 'comInvenVote_'+voteidx);
			invenVoteObj.id = 'comInvenVote_'+voteidx;
			invenVoteObj.className = 'popVote popVote_w470';
			invenVoteObj.style.width = popw+'px';
			invenVoteObj.style.height = poph+'px';
			var ifrObj = createObj('iframe','iVote_'+voteidx);
			ifrObj.setAttribute('id','iVote_'+voteidx);
			//ifrObj.setAttribute('frameborder','0');
			ifrObj.frameBorder = 0;
			ifrObj.setAttribute('scrolling','no');
			ifrObj.style.width = popw+'px';
			ifrObj.style.height = poph+'px';
			ifrObj.src = 'http://www.inven.co.kr/common/invenvote/print_form.php?vidx='+voteidx+'&skin='+skin+'&col='+col+'&popup=1';
			invenVoteObj.appendChild(ifrObj);
		}
		if (invenVoteObj.style.display == 'inline') {
			INVEN.Layer.hide(invenVoteObj,true);
		} else {
			INVEN.Layer.show(invenVoteObj, xpos, ypos, true, true, obj, true);
		}
	}
	INVEN.popvote.hide = function(voteidx) {
		var invenVoteObj = getObj('comInvenVote_'+voteidx);
		INVEN.Layer.hide(invenVoteObj,true);
	}
	INVEN.popvote.setHeight = function(voteidx, dynheight) {
		var invenVoteObj = getObj('comInvenVote_'+voteidx);
		var ifrObj = getObj('iVote_'+voteidx);
		invenVoteObj.style.height = parseInt(dynheight) + 10;
		ifrObj.style.height = parseInt(dynheight) + 10;
	}

/* QUICKLINK */
	INVEN.quickLink = window.INVEN.quickLink || {};
	INVEN.quickLink.openQuickLink = function(obj, xpos, ypos) {
		var qucklinkObj = getObj('comHeadQuickLink');
		if (qucklinkObj.style.display == 'inline') {
			INVEN.Layer.hide(qucklinkObj,true);
		} else {
			INVEN.Layer.show(qucklinkObj, xpos, ypos, true, true, obj, false);
		}
	}

/* QUICKLINK_NEW*/
	INVEN.quickLink.openQuickLinkNew = function(obj, xpos, ypos) {
		var qucklinkObj = getObj('comHeadQuickLink');
        
       // var h=window.innerHeight  || document.documentElement.clientHeight || document.body.clientHeight;
       var r =  (window.innerWidth - document.body.clientWidth);
       //console.log(r);

		if (qucklinkObj.style.display == 'inline') {
			INVEN.Layer.hide(qucklinkObj,true);  
        	$('body').removeClass('quicklink15');
        	$('body').removeClass('quicklink16');
        	$('body').removeClass('quicklink17');
        	$('body').removeClass('quicklink18');
	        $('#comHeadQuickLink .backdrop').removeAttr('style');       	  	
   
		} else {
			INVEN.Layer.show(qucklinkObj, xpos, ypos, true, true, obj, false); 
        	$('body').addClass('quicklink'+r); 
        	$('#comHeadQuickLink .backdrop').attr('style','overflow-y: scroll;');   
		}
	}
/* LEFTFOLDING */
	INVEN.LeftMenu = window.INVEN.LeftMenu || {};
	INVEN.LeftMenu.unfolding = function(obj) {
		var bObj = INVEN.Html.getParentByClassName(obj, 'bttnfolding');
		var pObj = bObj.parentNode;
		var menus = pObj.getElementsByTagName('LI');
		var n = menus.length;
		for (var i=0; i<n; i++) {
			INVEN.Html.removeClass(menus[i], 'folding');
		}
		pObj.removeChild(bObj);
	}

/* BOARD */
	INVEN.searchBoard = function(comeidx, name, keyword, iskin, target) {
		// 폼 만들기
			var fObj = document.createElement('form');
			fObj.method = 'get';
			fObj.action = 'http://www.inven.co.kr/board/powerbbs.php';
			fObj.style.display = 'none';
			if (target) {
				fObj.target = target;
			}
		// comeidx 만들기
			var cInput = document.createElement('input');
			cInput.name = "come_idx";
			cInput.value = comeidx;
			fObj.appendChild(cInput);
		// 검색 종류 만들기
			var nInput = document.createElement('input');
			nInput.name = "name";
			nInput.value = name;
			fObj.appendChild(nInput);
		// 검색 내용 만들기
			var sInput = document.createElement('input');
			sInput.name = "keyword";
			sInput.value = keyword;
			fObj.appendChild(sInput);
		// iskin이 있으면 정의
			if (iskin) {
				var iInput = document.createElement('input');
				iInput.name = "iskin";
				iInput.value = iskin;
				fObj.appendChild(iInput);
			}
		// 폼 붙이기
			document.body.appendChild(fObj);
		// 폼 submit
			fObj.submit();
		// 폼
			document.body.removeChild(fObj);
	}

/* 날짜 유효성 체크 */
	INVEN.checkdate = function(year, month, day) {
		year = typeof(year) == 'number' ? year : (typeof(year) == 'string' ? (parseInt(year, 10) || 0) : 0);
		if (year >= 1 && year <= 32767) {
			month = typeof(month) == 'number' ? month : (typeof(month) == 'string' ? (parseInt(month, 10) || 0) : 0);
			if (month >= 1 && month <= 12) {
				day = typeof(day) == 'number' ? day : (typeof(day) == 'string' ? (parseInt(day, 10) || 0) : 0);
				if (day >= 1 && day <= (new Date(new Date(year, month, 1) - 86400000).getDate())) {
					return true;
				}
			}
		}
		return false;
	}

/* IMAGE UPLOAD URL */
	INVEN.getImageUploadUrl = function(imgPath) {
		if (typeof(imgPath) == 'string' && imgPath.length > 0) {
			var img = imgPath.replace(/^\s*http:\/\/upload[2]?\.inven\.co\.kr\/upload\//, '').replace(/^\s+/, '').replace(/\s+$/, '');
			if (img.length > 0 && !(/^http[s]?:\/\//).test(img)) {
				var p = (/^\/?(2[0-9]{3})\/([0-9]{2})\/([0-9]{2})\/.+/).exec(img);
				if (p && INVEN.checkdate(p[1], p[2], p[3]) && (typeof(p[1]) == 'number' ? p[1] : (typeof(p[1]) == 'string' ? (parseInt(p[1], 10) || 0) : 0)) >= 2015) {
					return 'http://upload2.inven.co.kr/upload/'+img.replace(/^[\/]/, '');
				} else {
					return 'http://upload.inven.co.kr/upload/'+img.replace(/^[\/]/, '');
				}
			}
			return imgPath;
		}
		return '';
	}

/* ARRAY INPUT */
	function arrayInput(array, keys, value) {
		var keys = keys.constructor == Array ? keys : keys.split(':');
		if (keys.length > 1) {
			var key = keys.shift();
			array[key] = array[key] || [];
			array[key] = arrayInput(array[key], keys, value);
		} else if (keys.length == 1) {
			var key = keys.shift();
			array[key] = value;
		}
		return array;
	}

/* IE9 *Body Resize */
	function ie9ResizeBodyWidth(site) {
		var isie9=(/msie 9/i).test(navigator.userAgent);
		if (isie9) {
			var bodyObj = document.body;
			var subBodyObj = getObj(site+'Body');
			if (bodyObj && subBodyObj) {
				if ((bodyObj.offsetWidth%2) == (subBodyObj.offsetWidth%2)) {
					subBodyObj.style.marginRight = subBodyObj.style.marginRight+1;
				}
			}
		}
	}

/* Copy Url to ClibBoard */
	function resultClipBoard(rVar, cliptext) {
		if (rVar) {
			alert("클립보드에 복사되었습니다.");
		} else {
			alert("복사 실패하였습니다.(아래내용) \n\n"+cliptext);
		}
	}

	/**
	* INVEN Html Handling Script
	*/
	/* INITIALIZE */
		var INVEN = window.INVEN || {};
		INVEN.Html = INVEN.Html || {};

	/* CSS CLASS FUNCTION */
		/* 특정 클래스가 있는지 검사 */
			INVEN.Html.existClass = function(obj, cname) {
				if (obj.className == cname) { return true; }
				if (obj.className.search(new RegExp("^"+cname+" ","g")) > -1) { return true; }
				if (obj.className.search(new RegExp(" "+cname+"$","g")) > -1) { return true; }
				if (obj.className.search(new RegExp(" "+cname+" ","g")) > -1) { return true; }
				return false;
			}
		/* 특정 클래스를 교체 */
			INVEN.Html.replaceClass = function(obj, from, to) {
				if (obj.className == from) {
					obj.className = to;
				} else {
					obj.className = obj.className.replace(new RegExp("^"+from+" ","g"),to+" ");
					obj.className = obj.className.replace(new RegExp(" "+from+"$","g")," "+to);
					obj.className = obj.className.replace(new RegExp(" "+from+" ","g")," "+to+" ");
				}
			}
		/* 특정 클래스를 제거 */
			INVEN.Html.removeClass = function(obj, cname) {
				obj.className = obj.className.replace(new RegExp("^"+cname+" ","g"),"");
				obj.className = obj.className.replace(new RegExp(" "+cname+"$","g"),"");
				obj.className = obj.className.replace(new RegExp(" "+cname+" ","g")," ");
				if (trim(obj.className) == cname) { obj.className = ''; }
			}

	/* DOM FUNCTION */
		/* 특정 태그로 상위 노드 검색 */
			INVEN.Html.getParentByTagName = function(obj, tagName) {
				var temp = obj.parentNode;
				tagName = tagName.toLowerCase();
				while (temp.tagName.toLowerCase() != tagName) {
					temp = temp.parentNode;
					if ((temp == document.body) || (temp == document)) { return null; }
				}
				return temp;
			}
			INVEN.Html.getParentNode = INVEN.Html.getParentByTagName;
		/* 특정 클래스로 상위 노드 검색 */
			INVEN.Html.getParentByClassName = function(obj, className) {
				var temp = obj.parentNode;
				while (!INVEN.Html.existClass(temp, className)) {
					temp = temp.parentNode;
					if ((temp == document.body) || (temp == document)) { return null; }
				}
				return temp;
			}
		/* 특정 태그로 하위 노드 검색 */
			INVEN.Html.getChildNodes = function(obj, tag, childOnly) {
				obj = getObj(obj);
				if (!obj) { return null; }
				if (!tag) { tag = '*'; }
				tag = tag.toUpperCase();
				var objs = new Array();
				if (childOnly) {
					var objsLen = obj.childNodes.length;
					for (var i = 0; i < objsLen; i++) {
						var objOne = obj.childNodes.item(i);
						if ((tag == '*' || objOne.nodeName == tag) && (objOne.nodeType == 1)) {
							objs.push(objOne);
						}
					}
				} else {
					objs = obj.getElementsByTagName(tag);
				}
				return objs;
			}
		/* 모든 하위 노드 삭제 */
			INVEN.Html.removeChildAll = function(obj, tagName) {
				obj = getObj(obj);
				if (!tagName) {
					tagName = '';
				} else {
					tagName = tagName.toUpperCase();
				}
				var chs = obj.childNodes;
				var n = chs.length;
				for (var i = n - 1; i >= 0; i--) {
					var item = chs[i];
					if ((tagName == '') || ((item.tagName) && (item.tagName.toUpperCase() == tagName))) {
						obj.removeChild(item);
					}
				}
			}
		/* 이전 노드 */
			INVEN.Html.previousObj = function(obj, tagName) {
				if (tagName == undefined) { tagName ='*'; }
				tagName = tagName.toLowerCase();
				do {
					if (obj == obj.parentNode.firstChild) {
						return false;
					}
					obj = obj.previousSibling;
				} while ((obj.nodeType != 1) || ((tagName != '*') && (tagName != obj.nodeName.toLowerCase())));
				return obj;
			} 
		/* 다음 노드 */
			INVEN.Html.nextObj = function(obj, tagName) {
				if (tagName == undefined) { tagName ='*'; }
				do {
					if (obj == obj.parentNode.lastChild) {
						return false;
					}
					obj = obj.nextSibling;
				} while ((obj.nodeType != 1) || ((tagName != '*') && (tagName != obj.nodeName.toLowerCase())));
				return obj;
			} 
		/* SELECT 개체에 OPTION 추가 */
			INVEN.Html.addSelectOption = function(obj, value, text, isSelected) {
				var optionObj = document.createElement("OPTION");
				optionObj.value = value;
				optionObj.appendChild(document.createTextNode(text));
				if (isSelected) {
					optionObj.selected = true;
					optionObj.defaultSelected = true;
				}
				obj.appendChild(optionObj);
			}
		/* 특정 태그의 속성 일괄변경 */
			INVEN.Html.changeChildAttr = function(obj, tag, attr, value) {
				obj = getObj(obj);
				var chs = obj.getElementsByTagName(tag);
				var n = chs.length;
				for (var i = 0; i < n; i++) {
					chs[i][attr] = value;
				}
			}
		/* selectLabel */
			INVEN.Html.selectLabel = function(obj, action) {
				if (!action) { action = 'display->none'; }
				var labelObj = INVEN.Html.previousObj(obj, 'label');
				if (labelObj && (!obj.value)) {
					var actions = splitAssoc(action, ',', '->');
					var rollbacks = new Array();
					for (var key in actions) {
						switch (key) {
							case 'display':
								var styleVal = obj.currentStyle ? labelObj.currentStyle[key] : (window.getComputedStyle ? window.getComputedStyle(obj, "").getPropertyValue(key) : false);
								if (styleVal !== false) {
									rollbacks.push(function() { labelObj.style[key] = styleVal; });
									labelObj.style[key] = actions[key];
								}
								break;
							case 'class':
								rollbacks.push(function() { INVEN.Html.removeClass(labelObj, actions[key]); });
								if (!INVEN.Html.existClass(labelObj, actions[key])) { labelObj.className += ' ' + actions[key]; }
								break;
						}
					}
					obj.onblur = function() {
						if (!obj.value) {
							if (rollbacks && rollbacks.length) {
								var n = rollbacks.length;
								for (var i = 0; i < n; i++) {
									rollbacks[i]();
								}
							}
						}
					}
				}
			}

	/* CHECKBOX FUNCTION */
		/* 초기화 */
			INVEN.Html.Check = INVEN.Html.Check || {};
		/* 모두 선택 */
			INVEN.Html.Check.checkAll = function(obj, prefix, chk) {
				obj = getObj(obj);
				var chs = obj.getElementsByTagName('INPUT');
				var n = chs.length;
				var prefixn = prefix.length;
				for (var i = 0; i < n; i++) {
					var item = chs.item(i);
					if (item.type.toLowerCase() == 'checkbox') {
						if (item.getAttribute('name').substring(0, prefixn) == prefix) {
							item.checked = chk;
						}
					}
				}
			}
		/* 모두 선택 채크박스 재검사 */
			// 주의 : 전체선택/해제 박스는 name 값을 가지면 안됨
			INVEN.Html.Check.recalc = function(obj, prefix, allbox) {
				obj = getObj(obj);
				if (!allbox) allbox = prefix;
				var chs = obj.getElementsByTagName('INPUT');
				var n = chs.length;
				var prefixn = prefix.length;
				var allChecked = true;
				for (var i = 0; i < n; i++) {
					var item = chs.item(i);
					if (item.type.toLowerCase() == 'checkbox') {
						if ((item.getAttribute('name').substring(0, prefixn) == prefix) && (!item.checked)) allChecked = false;
					}
				}
				var selObj = document.getElementById(allbox);
				if (selObj) selObj.checked = allChecked;
			}
		/* 선택된 채크박스의 값을 문자열로 변환*/
			INVEN.Html.Check.getString = function(obj, prefix, sep) {
				obj = getObj(obj);
				if (!sep) sep = ",";
				var chs = obj.getElementsByTagName('INPUT');
				var n = chs.length;
				var prefixn = prefix.length;
				var temp = "";
				for (var i = 0; i < n; i++) {
					var item = chs.item(i);
					var itemname = item.getAttribute('name');
					if (itemname && (itemname.substring(0, prefixn) == prefix) && (item.checked)) {
						temp += itemname.substring(prefixn) + sep;
					}
				}
				return temp.substring(0, temp.length - sep.length);
			}

	/* VIRTUAL FORM OBJECT */
		INVEN.Html.VirtualForm = INVEN.Html.VirtualForm || {};
		INVEN.Html.VirtualForm.object = function() {
			this.formObj = null;
			
			this.init = function(meth, act) {
				if (!meth) meth = "POST";
				if (!act) act = "";
				this.formObj = document.createElement("FORM");
				this.formObj.method = meth;
				this.formObj.action = act;
				this.formObj.style.display = 'none';
			}

			this.addHidden = function(name, value) {
				var fieldObj = document.createElement("INPUT");
				fieldObj.type = "hidden";
				fieldObj.name = name;
				fieldObj.value = value;
				this.formObj.appendChild(fieldObj);
			}

			this.submit = function() {
				document.body.appendChild(this.formObj);
				this.formObj.submit();
			}
		}
		INVEN.Html.VirtualForm.create = function(meth, act) {
			var obj = new INVEN.Html.VirtualForm.object();
			obj.init(meth, act);
			return obj;
		}

	/* SEQUENCE FUNCTION */
		INVEN.Html.Seq = INVEN.Html.Seq || {};
		INVEN.Html.Seq.moveUp = function(obj) {
			var wrap = obj.parentNode;
			var chs = wrap.childNodes;
			n = chs.length;
			temp = false;
			for (i = 0; i < chs.length; i++) {
				if (i > 0) {
					if (chs.item(i) == obj) {
						if (temp !== false) obj.swapNode(temp);
						return;
					}
				}
				var temp = chs.item(i);
			}
		}
		INVEN.Html.Seq.moveDown = function(obj) {
			var wrap = obj.parentNode;
			var chs = wrap.childNodes;
			n = chs.length;
			changeNext = false;
			for (i = 0; i < chs.length; i++) {
				if (changeNext) {
					temp.swapNode(chs.item(i));
					return;
				}
				if (chs.item(i) == obj) {
					changeNext = true;
				}

				var temp = chs.item(i);
			}
		}
		INVEN.Html.Seq.remove = function(obj) {
			var wrap = obj.parentNode;
			wrap.removeChild(obj);
		}

	/* FORM CONTROL FUNCTION */
		/* 폼 항목 값 설정 */
			INVEN.Html.setFormValue = function(fmObj, name, value) {
				function process(obj, value) {
					if (!obj) { return; }
					if (obj.length && (!obj.nodeName || (obj.nodeName.toUpperCase() != 'OPTION'))) {
						for (var i = 0; i < obj.length; i++) {
							process(obj[i], value);
						}
					} else {
						var type = obj.nodeName.toUpperCase();
						if (type == 'INPUT') { type += ':' + obj.getAttribute('type').toUpperCase(); }
						switch (type) {
							case 'OPTION':
								if (obj.value == value) { obj.parentNode.value = value; }
								break;
							case 'INPUT:RADIO':
							case 'INPUT:CHECKBOX':
								if (obj.value == value) { obj.checked = true; }
								break;
							default:
								obj.value = value;
								break;
						}
					}
				}
				fmObj = getObj(fmObj);
				obj = fmObj[name];
				if (!obj) { return false; }
				process(obj, value);
			}
		/* 폼 항목 값 추출 */
			INVEN.Html.getFormValue = function(fmObj, name) {
				function process(obj, value) {
					if (!obj) { return; }
					if (obj.length && (!obj.nodeName || (obj.nodeName.toUpperCase() != 'OPTION'))) {
						for (var i = 0; i < obj.length; i++) {
							process(obj[i], value);
						}
					} else {
						var type = obj.nodeName.toUpperCase();
						if (type == 'INPUT') { type += ':' + obj.getAttribute('type').toUpperCase(); }
						switch (type) {
							case 'OPTION':
								if (obj.selected) { value.push(obj.value); }
								break;
							case 'INPUT:RADIO':
							case 'INPUT:CHECKBOX':
								if (obj.checked) { value.push(obj.value); }
								break;
							default:
								value.push(obj.value);
								break;
						}
					}
				}
				var value = new Array();
				fmObj = getObj(fmObj);
				obj = fmObj[name];
				if (!obj) { return false; }
				process(obj, value);
				if (value.length == 0) {
					return 0;
				} else if (value.length == 1) {
					return value[0];
				} else {
					return value;
				}
			}

	/* FORM CONTROL OBJECT */
		/* 초기화 */
			INVEN.Html.FormControl = window.INVEN.Html.FormControl || {};
		/* 생성 */
			INVEN.Html.FormControl.create = function() {
				var temp = new INVEN.Html.FormControl.object();
				return temp;
			}
		/* 오브젝트 */
			INVEN.Html.FormControl.object = function() {
				/* Privates */
					var formObj = null;
					var formFields = new Array();
					var linkControls = new Array();
				/* Main Form */
					this.setForm = function(value) { formObj = getObj(value); }
					this.getForm = function() { return formObj; }
				/* Linked Control */
					this.addLinkControl = function(control) {
						if (control) {
							var fields = control.getFields();
							for (var i in fields) {
								formFields[i] = fields[i];
							}
						}
					}
				/* Form Fields */
					this.getFields = function() { return formFields; }
					this.addField = function(name, caption, passCheck) {
						if (!passCheck) { passCheck = false; }
						if (!formObj) { return; }
						if (!formObj[name]) { return; }
						if (!formFields[name]) { formFields[name] = new Array(); }
						formFields[name]['name'] = name;
						formFields[name]['obj'] = formObj[name];
						formFields[name]['form'] = formObj;
						formFields[name]['caption'] = caption;
						formFields[name]['passCheck'] = passCheck;
					}
					this.clearFields = function() { formFields = new Array(); }
				/* Form Values */
					this.getValue = function(name) {
						if (formFields[name]) {
							return INVEN.Html.getFormValue(formFields[name]['form'], name);
						} else {
							return null;
						}
					}
					this.getValues = function() {
						var temp = new Array();
						for (var name in formFields) {
							temp[name] = this.getValue(name);
						}
						return temp;
					}
					this.setValue = function(name, value) {
						if (formFields[name]) {
							INVEN.Html.setFormValue(formFields[name]['form'], name, value);
						}
					}
					this.setValues = function(data) {
						for (var name in data) {
							this.setValue(name, data[name]);
						}
					}
				/* Sync Linked */
					this.syncLinked = function() {
						for (var name in formFields) {
							var formField = formFields[name];
							if ((formField['form'] != formObj) && (formObj[name])) {
								INVEN.Html.setFormValue(formObj, name, this.getValue(name));
							}
						}
					}
					this.updateLinked = function() {
						for (var name in formFields) {
							var formField = formFields[name];
							if ((formField['form'] != formObj) && (formObj[name])) {
								INVEN.Html.setFormValue(formField['form'], name, INVEN.Html.getFormValue(formObj, name));
							}
						}
					}
				/* Check Form */
					this.checkForm = function() {
						if ((arguments.length == 0) || (!arguments[0])) {
							var temp = new Array();
							for (var name in formFields) {
								if (!formFields[name]['passCheck']) {
									temp.push(name);
								}
							}
							conditions = new Array();
							conditions[0] = temp.join(',');
						} else {
							var conditions = new Array();
							if (arguments[0].constructor == Array) {
								conditions = arguments[0];
							} else {
								conditions = arguments;
							}
						}
						var requires = new Array();
						var allrequires = new Array();
						var result = false;
						for (var i = 0; i < conditions.length; i++) {
							var condition = conditions[i];
							var items = condition.split(',');
							var itemCount = items.length;
							var anyTrue = false;
							var allTrue = true;
							var missing = new Array();
							var allmissing = new Array();
							for (var j = 0; j < itemCount; j++) {
								var item = trim(items[j]);
								if (item) {
									var value = trim(this.getValue(item));
									if (value) {
										anyTrue = true;
									} else {
										missing.push('"' + formFields[item]['caption'] + '"');
										allTrue = false;
									}
									allmissing.push('"' + formFields[item]['caption'] + '"');
								}
							}
							if (allTrue) {
								return true;
							}
							if (anyTrue) {
								requires.push(missing.join(', '));
							}
							allrequires.push(allmissing.join(', '));
						}
						if (requires.length == 0) {
							alert("다음 항목을 입력해 주세요.\n\n" + allrequires.join("\n\n또는\n\n"));
						} else {
							alert("다음 항목을 입력해 주세요.\n\n" + requires.join("\n\n또는\n\n"));
						}
						return false;
					}
			}

	/* TAB CONTROL */
		INVEN.Html.TabControl = window.INVEN.Html.TabControl || {};
		INVEN.Html.TabControl.create = function() {
			var obj = new INVEN.Html.TabControl.object();
			return obj;
		}
		INVEN.Html.TabControl.object = function() {
			/* Private Attributes */
				var anchorObjs = new Array();
				var idName = '';
				var anchorClass = '';
				var groupClass = '';
				var groupObj = null;
				var eventName = null;
				var hasLink = false;
				var anchorArray = new Array();
			/* Public Method */
				this.initialize = initialize;
				this.switchTab = switchTab;
			/* Method : Initialize */
				function initialize(idNameValue, anchorClassValue, groupClassValue, eventNameValue, linkCheck) {
					idName = idNameValue;
					anchorClass = anchorClassValue;
					groupClass = groupClassValue;
					eventName = eventNameValue ? eventNameValue : 'click';
					hasLink = linkCheck ? true : false;
					convertAnchors();
				}
			/* Method : Convert Anchors */
				function convertAnchors() {
					var obj = getObj(idName + 'Tabs');
					if (!obj) { return; }
					var aObjs = obj.getElementsByTagName('a');
					var aObjCount = aObjs.length;
					for (var i = 0; i < aObjCount; i++) {
						var aObj = aObjs[i];
						var re = new RegExp(idName + 'A([0-9]+)');
						var temp = aObj.href.match(re);
						if (temp) {
							anchorArray.push(aObj);
							var tabValue = temp[1];
							if (!hasLink) {
								aObj.href = 'javascript:nothing();';
							} else {
								aObj.href = aObj.href.replace('#' + temp[0], '');
							}
							aObj['on' + eventName] = createTabSwitchFunction(tabValue);
							if (eventName == 'click') { aObj.onfocus = function() { this.blur(); }; };
							anchorObjs[tabValue] = aObj;
						}
					}
				}
			/* Method : Create Tab Switch Function */
				function createTabSwitchFunction(tabValue) {
					var fn = function() {
						switchTab(tabValue);
					}
					return fn;
				}
			/* Method : Create Tab Switch Function */
				function switchTab(tabValue, autoMove) {
					var tabKeyArray = new Array();
					var keySelect = 0;
					for (var key in anchorObjs) {
						tabKeyArray.push(key);
					}
					var tabKeyArrayLen = tabKeyArray.length;
					switch (tabValue) {
						case 'random':
							keySelect = Math.round(Math.random() * (tabKeyArrayLen - 1));
							tabValue = tabKeyArray[keySelect];
							break;
					}
					switchTabProcess(tabValue);
					if (autoMove) {
						var timeout = 0;
						var tabCheck = 0;
						var moveProcess = true;
						var fn1 = function() {
							tabCheck++;
							if (tabCheck >= tabKeyArrayLen) {
								tabCheck = tabCheck % tabKeyArrayLen;
							}
							switchTabProcess(tabKeyArray[tabCheck]);
							autoMoveFn();
						}
						var fn2 = function(aObj, count) {
							var tempFn = function() {
								tabCheck = count;
								overFn();
							}
							addEvent(aObj, 'mouseover', tempFn);
						}
						function overFn() {
							moveProcess = false;
							clearTimeout(timeout);
						}
						function outFn() {
							moveProcess = true;
							autoMoveFn();
						}
						var autoMoveFn = function() {
							if (moveProcess) {
								timeout = setTimeout(fn1, (autoMove * 1000));
							}
						}
						if (keySelect) {
							tabCheck = keySelect;
						}
						for (var i in anchorArray) {
							var aObj = anchorArray[i];
							fn2(aObj, i);
							addEvent(aObj, 'mouseout', outFn);
							var contentObj = getObj(idName + 'A' + tabKeyArray[i]);
							fn2(contentObj, i);
							addEvent(contentObj, 'mouseout', outFn);
						}
						autoMoveFn();
					}
				}
				function switchTabProcess(tabValue) {
					if (!groupObj) { groupObj = getObj(idName); }
					INVEN.Html.removeClass(groupObj, groupClass + '([0-9]+)');
					groupObj.className += ' ' + groupClass + tabValue;
					var n = anchorObjs.length;
					for (var key in anchorObjs) {
						var anchorObj = anchorObjs[key];
						INVEN.Html.removeClass(anchorObj, anchorClass + '\-Selected');
					}
					anchorObjs[tabValue].className += ' ' + anchorClass + '-Selected';
				}
		}

	/* RESIZE IFRAME */
		function checkIframeSize(obj, width, height) {
			if (width === undefined) { width = true; }
			if (height === undefined) { height = true; }
			var obj = getObj(obj);
			var nodeType = obj.nodeName.toLowerCase();
			switch (nodeType) {
				case 'iframe':
					var documentObj = obj.contentWindow.document ? obj.contentWindow.document : obj.contentDocument;
					if (width) {
						obj.style.width = documentObj.body.scrollWidth + 'px';
					}
					if (height) {
						obj.style.height = documentObj.body.scrollHeight + 'px';
					}
					break;
			}
		}

		
		var INVEN = window.INVEN || {};
		INVEN.Layer = window.INVEN.Layer || {};

		INVEN.Layer.mousex = 0;
		INVEN.Layer.mousey = 0;
		INVEN.Layer.ready = false;
		INVEN.Layer.floatIframes = window.INVEN.Layer.floatIframes || new Array();

		INVEN.Layer.setReady = function() {
			INVEN.Layer.ready = true;
		}

		INVEN.Layer.forceReady = INVEN.Layer.setReady;

		INVEN.Layer.trackMouse = function() {};

		INVEN.Layer.getFloatControl = function(floatControl) {
			if (floatControl == undefined) {
				floatControl = 'none';
			} else if (typeof(floatControl) == 'boolean') {
				floatControl = floatControl ? 'select' : 'none';
			} else if (floatControl == 'iframe') {
				floatControl = 'iframe';
			} else {
				floatControl = 'none';
			}
			return floatControl;
		}
		// xplus : [w/e/m]+/-[pixel] plus/minus from west/east/mouse end of baseObj
		// xplus : [n/s/m]+/-[pixel] plus/minus from north/south/mouse end of baseObj
		// basePos : -mouse, -body, [object]
		INVEN.Layer.show = function(obj, xplus, yplus, floatControl, toBody, baseObj, autoPosition) {
			if (!INVEN.Layer.ready) return;
			obj = getObj(obj);
			if (!obj) return;
			if (typeof(toBody) == 'undefined') toBody = true;
			if (typeof(baseObj) == 'undefined') baseObj = "-mouse";
			if (typeof(autoPosition) == 'undefined') autoPosition = true;

			floatControl = INVEN.Layer.getFloatControl(floatControl);

			obj.style.visibility = 'hidden';
			obj.style.display = 'none';
			obj.style.left = '-5000px';
			obj.style.top = '-5000px';
			obj.style.visibility = 'visible';
			obj.style.display = 'inline';

			var fixXPos = false, fixYPos = false;

			// 기준좌표 계산 (baseObj, xplus, yplus 이용)
			switch (baseObj) {
				case '-mouse':
					break;
				case '-body':
					baseObj = document.body;
					if (!baseObj) return;
					break;
				default:
					baseObj = getObj(baseObj);
					if (!baseObj) return;
			}

			var basePos = INVEN.Coordination.create();
			if (baseObj == '-mouse') {
				basePos.x = INVEN.Layer.mousex;
				basePos.y = INVEN.Layer.mousey;
			} else {
				var baseObjPos = $(baseObj).offset();
				switch (typeof(xplus) == 'string' ? xplus.substring(0,1).toLowerCase() : 'm') {
					case 'm':
						basePos.x = INVEN.Layer.mousex;
						break;
					case 'e':
						basePos.x = baseObjPos.left + $(baseObj).outerWidth();
						break;
					default:
						basePos.x = baseObjPos.left;
						break;
				}
				switch (typeof(yplus) == 'string' ? yplus.substring(0,1).toLowerCase() : 'm') {
					case 'm':
						basePos.y = INVEN.Layer.mousey;
						break;
					case 's':
						basePos.y = baseObjPos.top + $(baseObj).outerHeight();
						break;
					default:
						basePos.y = baseObjPos.top;
						break;
				}
			}
			if (typeof(xplus) == 'string') {
				if (xplus.search(/f/i) != -1) { fixXPos = true; }
				xplus = parseInt(xplus.replace(/[^0-9\-]/ig,''), 10) || 0;
			} else if (typeof(xplus) != 'number') {
				xplus = 0;
			}
			if (typeof(yplus) == 'string') {
				if (yplus.search(/f/i) != -1) { fixYPos = true; }
				yplus = parseInt(yplus.replace(/[^0-9\-]/ig,''), 10) || 0;
			} else if (typeof(yplus) != 'number') {
				yplus = 0;
			}

			// Layer 바깥쪽으로 빼기
			if (toBody && document.body) {
				if (obj.parent) obj.parentNode.removeChild(obj);
				document.body.appendChild(obj);
			}

			var x = basePos.x + xplus;
			var y = basePos.y + yplus;
			if (!fixXPos) {
				var w = $(obj).outerWidth();
				var sl = Math.max(document.body.scrollLeft || 0, document.documentElement.scrollLeft || 0);
				var cw = Math.max(document.body.clientWidth || 0, document.documentElement.clientWidth || 0);
				if (autoPosition && (x + w) > (cw + sl)) x = sl + cw - w;
				if (x < sl) x = sl;
			}
			if (!fixYPos) {
				var h = $(obj).outerHeight();
				var st = Math.max(document.body.scrollTop || 0, document.documentElement.scrollTop || 0);
				var ch = Math.max(document.body.clientHeight || 0, document.documentElement.clientHeight || 0);
				if (autoPosition && (y + h) > (ch + st)) y = st + ch - h;
				if (y < st) y = st;
			}
			obj.style.left = x + 'px';
			obj.style.top = y + 'px';

			switch (floatControl) {
				case 'select':
					INVEN.Layer.floatShow(obj);
					break;
				case 'iframe':
					if (!obj.uniqueID) obj.uniqueID = "inven_" + new Date().getMilliseconds() + "_" + Math.round(Math.random() * 1000);
					if (!INVEN.Layer.floatIframes[obj.uniqueID]) {
						INVEN.Layer.floatIframes[obj.uniqueID] = document.createElement("IFRAME");
						INVEN.Layer.floatIframes[obj.uniqueID].frameBorder = "0";
						INVEN.Layer.floatIframes[obj.uniqueID].frameSpacing = "0";
						INVEN.Layer.floatIframes[obj.uniqueID].style.position = "absolute";
						INVEN.Layer.floatIframes[obj.uniqueID].style.styleFloat = "left";
						INVEN.Layer.floatIframes[obj.uniqueID].style.display = "inline";

					}
					if (INVEN.Layer.floatIframes[obj.uniqueID].parentNode && (INVEN.Layer.floatIframes[obj.uniqueID].parentNode != document.body)) { INVEN.Layer.floatIframes[obj.uniqueID].parentNode.removeChild(INVEN.Layer.floatIframes[obj.uniqueID]); }
					//INVEN.Layer.floatIframes[obj.uniqueID].style.zIndex = obj.style.zIndex;
					//obj.parentNode.insertBefore(INVEN.Layer.floatIframe, obj);
					var objAbsPos = INVEN.Coordination.getAbsPos(obj);
					INVEN.Layer.floatIframes[obj.uniqueID].style.zIndex = obj.style.zIndex - 1;
					INVEN.Layer.floatIframes[obj.uniqueID].style.width = obj.offsetWidth;
					INVEN.Layer.floatIframes[obj.uniqueID].style.height = obj.offsetHeight;
					INVEN.Layer.floatIframes[obj.uniqueID].style.left = objAbsPos.x;
					INVEN.Layer.floatIframes[obj.uniqueID].style.top = objAbsPos.y;
					try {
						if (self.pageYOffset) { // all except Explorer
							INVEN.Layer.floatIframes[obj.uniqueID].style.left = objAbsPos.x;
							INVEN.Layer.floatIframes[obj.uniqueID].style.top = objAbsPos.y;
						} else if (document.documentElement && document.documentElement.scrollTop) { // Explorer 6 Strict
							INVEN.Layer.floatIframes[obj.uniqueID].style.left = objAbsPos.x;
							INVEN.Layer.floatIframes[obj.uniqueID].style.top = objAbsPos.y;
						} else if (document.body && obj.currentStyle) { // all other Explorers
							INVEN.Layer.floatIframes[obj.uniqueID].style.left = objAbsPos.x - parseInt(obj.currentStyle.borderLeftWidth, 10);
							INVEN.Layer.floatIframes[obj.uniqueID].style.top = objAbsPos.y - parseInt(obj.currentStyle.borderTopWidth, 10);
						}
					} catch (e) {}

					document.body.appendChild(INVEN.Layer.floatIframes[obj.uniqueID]);
					INVEN.Layer.floatIframes[obj.uniqueID].style.visibility = 'hidden';
					INVEN.Layer.floatIframes[obj.uniqueID].style.visibility = 'visible';
					break;
			}
		}
		INVEN.Layer.hide = function(obj, floatControl) {
			obj = getObj(obj);
			if (!obj) return;
			floatControl = INVEN.Layer.getFloatControl(floatControl);
			obj.style.display = 'none';

			switch (floatControl) {
				case 'select':
					INVEN.Layer.floatHide(obj);
					break;
				case 'iframe':
					if (!obj.uniqueID) obj.uniqueID = "inven_" + new Date().getMilliseconds() + "_" + Math.round(Math.random() * 1000);
					if (INVEN.Layer.floatIframes[obj.uniqueID] && INVEN.Layer.floatIframes[obj.uniqueID].parentNode) {
						INVEN.Layer.floatIframes[obj.uniqueID].parentNode.removeChild(INVEN.Layer.floatIframes[obj.uniqueID]);
					}
					break;
			}
		}
		/* FLOAT CONTROL */
		INVEN.Layer.floatObjs = window.INVEN.Layer.floatObjs || new Array();
		INVEN.Layer.floatSelects = window.INVEN.Layer.floatObjsState || new Array();

		INVEN.Layer.floatShow = function(obj) {
			// IE가 아니면 작동안함
			if (!window.ActiveXObject) return;

			// 초기화
			obj = getObj(obj);
			if (!obj) return;

			// SELECT 추출
			var docSelect = document.getElementsByTagName("SELECT");
			var childSelect = obj.getElementsByTagName("SELECT");
			var dsCount = docSelect.length;
			var csCount = childSelect.length;

			// 좌표 계산
			var objPos = INVEN.Coordination.getRelPos(obj);
			var objPosEnd = INVEN.Coordination.create();
			objPosEnd.x = objPos.x + obj.offsetWidth;
			objPosEnd.y = objPos.y + obj.offsetHeight;

			for (var ds = 0; ds < dsCount; ds++) {
				var item = docSelect[ds];

				// 플로팅 내부인지 확인
				var isChild = false;
				for (var cs = 0; cs < csCount; cs++) {
					if (item == childSelect[cs]) isChild = true;
				}
				if (!isChild) {
					if (!item.uniqueID) item.uniqueID = "inven_" + new Date().getMilliseconds() + "_" + Math.round(Math.random() * 1000);

					itemPos = INVEN.Coordination.getAbsPos(item);
					var itemPosEnd = INVEN.Coordination.create();
					itemPosEnd.x = itemPos.x + item.offsetWidth;
					itemPosEnd.y = itemPos.y + item.offsetHeight;

					// 겹치는지 채크
					if (((itemPos.x >= objPos.x) && (itemPos.y >= objPos.y) && (itemPos.x <= objPosEnd.x) && (itemPos.y <= objPosEnd.y)) /* 시작지점 검사 */
						|| ((itemPosEnd.x >= objPos.x) && (itemPosEnd.y >= objPos.y) && (itemPosEnd.x <= objPosEnd.x) && (itemPosEnd.y <= objPosEnd.y))) /* 끝지점 검사 */ {
						if (item.style.visibility != 'hidden') {
							INVEN.Layer.floatSelects[item.uniqueID] = new Array();
							INVEN.Layer.floatSelects[item.uniqueID]['obj'] = item;
							INVEN.Layer.floatSelects[item.uniqueID]['state'] = item.style.visibility;
							item.style.visibility = 'hidden';
						}
					}
				} else {
					if (item.style.visibility == 'hidden') {
						// 안보일 경우 플로팅컨트롤에 의해 감춰진지 확인
						for (var foKey in INVEN.Layer.floatSelects) {
							if (foKey == item.uniqueID) {
								item.style.visibility = INVEN.Layer.floatSelects[foKey]['state'];
							}
						}
					}
				}

				INVEN.Layer.floatObjs[obj.id] = 1;
			}
		}
		INVEN.Layer.floatHide = function(obj) {
			// IE가 아니면 작동안함
			if (!window.ActiveXObject) return;

			// 초기화
			obj = getObj(obj);
			if (!obj) return;

			// 다 보여주기
			for (var key in INVEN.Layer.floatSelects) {
				INVEN.Layer.floatSelects[key]['obj'].style.visibility = INVEN.Layer.floatSelects[key]['state'];
			}

			INVEN.Layer.floatObjs[obj.id] = 0;

			// 다른 플로팅 재계산
			for (var key in INVEN.Layer.floatObjs) {
				if (INVEN.Layer.floatObjs[key]) INVEN.Layer.floatShow(key);
			}
		}

		$(document).on('mousemove.InvenLayer', function(e) {
			INVEN.Layer.ready = true;
			INVEN.Layer.mousex = e.pageX;
			INVEN.Layer.mousey = e.pageY;
		});
		
		
		var INVEN = window.INVEN || {};
		INVEN.Xml = window.INVEN.Xml || {};

		INVEN.Xml.objects = window.INVEN.Xml.objects || new Array();

		INVEN.Xml.object = function() {
			this.xmlObj;
			this.action;
			this.method;
			this.insName;
			this.nocache;

			this.init = function(insName, method, action, nocache) {
				if (!method) method = "GET";
				if (!action) action = "";
				if (!nocache) nocache = false;

				this.insName = insName;
				this.setAction(action);
				this.setMethod(method);
				this.nocache = nocache;
				return true;
			}

			this.createObj = function() {
				if (window.XMLHttpRequest) {
					this.xmlObj = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					this.xmlObj = new ActiveXObject("Microsoft.XMLHTTP");
				} else {
					return false;
				}
			}

			this.setAction = function(action) { this.action = action; }
			this.setMethod = function(method) { this.method = method; }

			this.error = function(xmlObj) {
				this.handleError(this.getErrorMsg(xmlObj));
			}

			this.handleError = function(msg) {
				if ((typeof(msg) == 'string' && msg.length > 0) || typeof(msg) == 'number') {
					alert(msg);
				}
			}

			this.getErrorMsg = function(xmlObj) {
				var msg = xmlObj.getResponseHeader("Status");
				if ((!msg) || (msg.length == null) || (msg.length <= 0)) {
					if (xmlObj.status && xmlObj.status !== 0) alert(xmlObj.status);
				} else {
					return msg;
				}
			}

			this.checkState = function(instance) {
				if (instance.xmlObj.readyState == 4) {
					if (instance.xmlObj.status == 200) {
						instance.print(instance.xmlObj);
					} else {
						instance.error(instance.xmlObj);
					}
				}
			}

			this.request = function(data) {
				this.createObj();
				eval("var chkFn = function() { " + this.insName + ".checkState(" + this.insName + "); }");
				this.xmlObj.onreadystatechange = chkFn;

				//요청처리
				var url = this.action;
				var params = "";
				var dummy = new Date().getTime();

				// data
				if (data.constructor == Array) {
					var temp = new Array();
					for (var i in data) {
						temp.push(i + "=" + encodeURIComponent(data[i]));
					}
					data = temp.join("&");
				}

				if (this.method.toUpperCase() == "GET") {
					url = this.action + "?" + data + (this.nocache ? "&dummy="+dummy : "");
					params = null;
				} else {
					url = this.action + (this.nocache ? "?dummy="+dummy : "");
					params = data;
				}

				this.xmlObj.open(this.method, url, true);
				this.xmlObj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
				this.xmlObj.send(params);
			}

			this.print = function(xmlObj) {
				alert(xmlObj.responseXML.xml);
			}

		}

		INVEN.Xml.create = function(method, action, nocache) {
			var n = INVEN.Xml.objects.length;
			INVEN.Xml.objects[n] = new INVEN.Xml.object();
			INVEN.Xml.objects[n].init("INVEN.Xml.objects["+n+"]", method, action, nocache);
			return INVEN.Xml.objects[n];
		}

		/* COMMON FUNCTION */
			/* Method : getTextValue */
				INVEN.Xml.getTextValue = function(node) {
					if (node && node.firstChild && node.firstChild.nodeValue) {
						return node.firstChild.nodeValue;
					} else {
						return '';
					}
				}
			/* Method : readAllXmlData */
				INVEN.Xml.readAllXmlData = function(obj) {
					var data = new Array();
					var chs = obj.childNodes;
					var n = chs.length;
					for (var i = 0; i < n; i++) {
						var item = chs[i];
						if (item.nodeType == 1) {
							var temp = item.childNodes;
							if (item.firstChild && item.firstChild.nodeType == 1) {
								data[item.tagName] = readAllXmlData(item);
							} else if ((temp.length > 1) && (temp[1].nodeType == 1)) {
								data[item.tagName] = readAllXmlData(item);
							} else {
								data[item.tagName] = INVEN.Xml.getTextValue(item);
							}
						}
					}
					return data;
				}
				INVEN.Booster = window.INVEN.Booster || {};
				INVEN.Booster.objects = window.INVEN.Booster.objects || new Array();
				INVEN.Booster.create = function() {
					var n = INVEN.Booster.objects.length;
					INVEN.Booster.objects[n] = new INVEN.Booster.object();
					return INVEN.Booster.objects[n];
				}
				INVEN.Booster.object = function() {
					/* 내부 변수 */
						var defaultGradeSplit = 50;
					/* 접근 가능 함수 */
						this.init = init;
						this.setDefaultGradeSplit = setDefaultGradeSplit;
						this.getSinBooster = getSinBooster;
					/* 초기화 */
						function init() {
						}
					/* 기본값 설정 */
						function setDefaultGradeSplit(grade) {
							if (!grade || grade < 0) {
								defaultGradeSplit = 50;
							} else {
								defaultGradeSplit = grade;
							}
						}
					/* 각도를 라디안으로 */
						function degreeToRadian(degree) {
							return degree * (Math.PI / 180);
						}
					/* 사인 곡선 부스터 */
						function getSinBooster() {
							var splitArray = new Array();
							var split = defaultGradeSplit;
							var pointLimit = 10000;
							var startRadian = degreeToRadian(270);
							var endRadian = degreeToRadian(450);
							var radianSplit = (endRadian - startRadian) / split;
							splitArray.push(0);
							for (var i = 1; i < split - 1; i++) {
								var temp = parseInt((startRadian + (radianSplit * i)) * pointLimit, 10) / pointLimit;
								temp = (parseInt(Math.sin(temp) * pointLimit, 10) / pointLimit) + 1;
								temp = parseInt(temp * pointLimit, 10) / (pointLimit * 2);
								temp = parseInt(temp * pointLimit, 10) / pointLimit;
								splitArray.push(temp);
							}
							splitArray.push(1);
							return splitArray;
						}
				}

				
				/**
				* Inven Browser Detect Js by HunGom
				* Renewal by InTheBlue
				*/

				(function($, undefined) {
					// Check browser
					var browser = {};
					var ua = String(navigator.userAgent || '').toLowerCase();

					var uaMatch = function(ua) {
						if (typeof(ua) == 'string') {
							ua = ua.toLowerCase();
							return undefined
								|| /(chrome)[ \/]([\w.]+)/.exec(ua)
								|| /(webkit)[ \/]([\w.]+)/.exec(ua)
								|| /(firefox)[ \/]([\w.]+)/.exec(ua)
								|| /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(ua)
								|| /(msie) ([\w.]+)/.exec(ua)
								|| /(trident)(?:.*rv:([\w.]+))?/.exec(ua)
								|| (ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(ua))
								|| []
							;
						} else {
							return [];
						}
					};

					var match = uaMatch(ua);
					if (match) {
						browser[match[1]] = true;
						browser.version = match[2] || '0';
						if (browser.chrome) {
							browser.webkit = true;
						} else if (browser.webkit) {
							browser.safari = true;
						} else if (browser.trident) {
							browser.msie = true;
						}
					}

					// Check mobile & tablet
					match = /(android|iphone|ipod|ipad|windows ce|windows phone|symbian|blackberry|opera mini|tablet|mobile)/.exec(ua);
					if (match) {
						match = match[1].replace(/ /g, '');
						browser.mobile = true;
						browser[match] = true;
						if (browser.ipad || browser.tablet) {
							browser.tablet = true;
						} else {
							var w = 0, h = 0;
							try {
								var win = $(window);
								w = win.width() || 0;
								h = win.height() || 0;
							} catch (e) {
								w = 0;
								h = 0;
							}
							if (Math.max(w, h) >= 1024) browser.tablet = true;
						}
					}

					// Add html browser selector class
					var b = [];
					if (browser.mobile) {
						b[b.length] = 'mobile';
						if (browser.tablet) b[b.length] = 'tablet';
					} else if (browser.msie) {
						b[b.length] = 'ie';
						var v = parseInt(browser.version);
						try {
							if (document.compatMode == 'BackCompat' && (document.documentMode || 5) == 5) {
								b[b.length] = 'quirks';
								browser.quirks = true;
							}
						} catch (e) {}
						if (v && !browser.quirks) b[b.length] = 'ie'+v;
					}
					if (b.length > 0) $('html').addClass(b.join(' '));

					// Overwrite jQuery browser object
					$.browser = browser;
					$.uaMatch = uaMatch;
				})(jQuery);
				
				var INVEN = window.INVEN || {};
				INVEN.Db = INVEN.Db || {};

				(function(INVEN, undefined) {
					var version = 3;

					if ((INVEN.Db.Tooltip ? Math.max(parseInt(INVEN.Db.Tooltip.version) || 1, 1) : 0) >= version) return false;

					/* 환경 설정 변수 */
					var requestDelay = 100;
					var cursorOffsetX = 10;
					var cursorOffsetY = 10;
					var siteDirs = {
						// 사이트 도메인 주소와 www 디렉토리가 상이할 경우 설정함 ('서브 도메인': 'www 디렉토리')
						'2k': 'pb2k',
						'46sin': 'fsg',
						'dia3': 'diablo3',
						'fifa3': 'fifaonline3',
						'fifa4': 'fifaonline4',
						'fmo': 'fmonline',
						'heoresofthestorm': 'hos',
						'hots': 'hos',
						'm': 'mobile',
						'mabiduel': 'duel',
						'mabinogiduel': 'duel',
						'destinychild': 'dchild',
						'pubg': 'battlegrounds',
						'battleground': 'battlegrounds',
						'cod': 'blackops4'
					};

					INVEN.Db.Tooltip = {};
					INVEN.Db.Tooltip.version = version;
					INVEN.Db.Tooltip.objects = {};

					/* 외부 호출용 툴팁 객체 생성기 */
					INVEN.Db.Tooltip.create = function(id, wrap, site, ajaxUrl, method, attribute, callback) {
						// Tooltip Class Name
						id = trim(id) || '';

						if (INVEN.Db.Tooltip.objects[id] === undefined) {
							// Tooltip Wrap Id
							wrap = trim(wrap);

							// Site String
							site = trim(site);
							if (site) site = site.toLowerCase();

							// AJAX Request URL
							ajaxUrl = trim(ajaxUrl);
							if (ajaxUrl) {
								if (site && (siteCode == 'www' || siteCode == site || siteDirs[siteCode] == site)) {
									ajaxUrl = ajaxUrl.replace(new RegExp('^[\/]+', 'g'), '/');
									if (siteCode == 'www') {
										ajaxUrl = 'http://www.inven.co.kr/'+(siteDirs[site] || site)+'/'+ajaxUrl;
									} else {
										ajaxUrl = 'http://'+siteCode+'.inven.co.kr/'+ajaxUrl;
									}
								} else {
									ajaxUrl = null;
								}
							}

							// AJAX Request Method(GET or POST. default: GET) [NEW Parameter]
							method = (trim(method) || 'GET').toUpperCase();
							if (method != 'GET' && method != 'POST') method = 'GET';

							// Show-Hide HTML Attribute [NEW Parameter]
							attribute = trim(attribute);

							// Callback Function [NEW Parameter]
							if (typeof(callback) == 'string') {
								callback = $.trim(callback);
								if (!(/^[a-z_][0-9a-z_\.]*[0-9a-z_]$/i).test(callback)) callback = null;
							} else if (typeof(callback) != 'function') {
								callback = null;
							}

							INVEN.Db.Tooltip.objects[id] = new Tooltip(id, wrap, site, ajaxUrl, method, attribute, callback);
						}
						return INVEN.Db.Tooltip.objects[id];
					};

					/* 변수 초기화 */
					var tooltip = null, tooltipParents = null, tooltipObject = null, tooltipObjectIsLoading = false;
					var showHideAttributes = {};
					var tooltipStyle = 'position: absolute; left: 0px; top: 0px; display: none; float: left; overflow: hidden;';
					var tooltipWrapStyle = 'position: absolute; left: 0px; top: 0px; display: block; clear: both; overflow: visible; width: 1px; height: 1px;'
					var siteCode = (new RegExp('^http[s]?:\/\/([a-z0-9\-_]+)\.inven\.co\.kr\/', 'i')).exec($.trim(document.location.href));
					if (siteCode) siteCode = siteCode[1].toLowerCase();
					var request = null, requestClear = null;
					var pageX = 0, pageY = 0;

					/* 툴팁 좌표 계산 */
					var setPosition = function() {
						if (tooltip.css('display') == 'none') tooltip.css({ 'left': '-5000px', 'top': '-5000px', 'display': 'inline' });
						var px = pageX + cursorOffsetX;
						var py = pageY + cursorOffsetY;
						if (tooltipParents) {
							for (var i = 0; i < tooltipParents.length; i++) {
								var offset = tooltipParents[i][0].offset();
								px += offset.left - tooltipParents[i][1].body.scrollLeft;
								py += offset.top - tooltipParents[i][1].body.scrollTop;
							}
						}
						var body = tooltip.parents('body')[0];
						var sl = body.scrollLeft;
						var st = body.scrollTop;
						var cw = body.clientWidth;
						var ch = body.clientHeight;
						var w = tooltip.outerWidth();
						var h = tooltip.outerHeight();
						var fixLeft = (!tooltipObjectIsLoading && tooltipObject) ? (tooltipObject.fixOffsetLeft || 0) : 0;
						px += fixLeft;
						if ((px + w) > (cw + sl)) px = Math.max(px - cursorOffsetX - w - fixLeft, sl);
						if ((py + h) > (ch + st)) py = Math.max(py - cursorOffsetY * 1.5 - h, st);
						var offset = tooltip.parent().offset();
						px -= offset.left;
						py -= offset.top;
						tooltip.css({ 'left': Math.floor(px)+'px', 'top': Math.floor(py)+'px' });
					};

					/* 마우스 커서 좌표 감시 */
					$(document).on('mousemove', function(e) {
						pageX = e.pageX;
						pageY = e.pageY;
						if (tooltip) setPosition();
					}).on('click', 'a[href]:not([href^="javascript:"])', function(e) {
						if (tooltipObject) tooltipObject.hide();
					});

					/* 툴팁 키 */
					var getTooltipKey = function(code, type) {
						code = trim(code);
						if (code) {
							type = trim(type);
							if (type) {
								return code+'_'+type;
							} else {
								return code;
							}
						}
						return null;
					};

					/* 내부용 툴팁 객체 */
					var Tooltip = function(id, wrap, site, ajaxUrl, method, attribute, callback) {
						/* 기본값 선언 */
						var self = this;
						var values = {};
						var cache = {};
						var possibility = true, lastTooltip = null;
						if (!id || id == '') id = null;

						/* 툴팁 생성 */
						var create = function(key, preShow) {
							if (id && values.parent) {
								// 생성된 툴팁을 상황에 맞게 내어준다.
								if (key === true) {
									// 로딩 툴팁
									tooltip = values.loading;
									tooltipObjectIsLoading = true;
								} else if (typeof(key) == 'string') {
									// 예전 방식의 addPreData의 경우 툴팁에 id를 남겨서 따로 처리(호환성!)
									var tooltipId = id+'_'+key, preTooltip;
									if (values.tooltips[tooltipId]) {
										preTooltip = values.tooltips[tooltipId];
									} else {
										preTooltip = document.getElementById(tooltipId);
										if (preTooltip) {
											preTooltip = $(preTooltip);
										} else {
											preTooltip = $('<div id="'+tooltipId+'" class="'+id+'"><div class="'+id+'_inner"></div></div>').appendTo(values.parentPreData).attr('style', tooltipStyle);
										}
										values.tooltips[tooltipId] = preTooltip;
									}
									if (preShow) {
										preTooltip.css('display', 'none');
										return true;
									} else {
										tooltip = preTooltip;
										tooltipObjectIsLoading = false;
									}
								} else {
									// 통합 툴팁
									if (callback) {
										values.tooltip.removeClass().addClass(id);
										values.tooltip._inner = (values.tooltip._inner || values.tooltip.find('> div.'+id+'_inner:first')).removeClass().addClass(id+'_inner');
									}
									tooltip = values.tooltip;
									tooltipObjectIsLoading = false;
								}
								tooltip.css('display', 'none').css('z-index', values.zIndex);
								tooltip._inner = tooltip._inner || tooltip.find('> div.'+id+'_inner:first');
								tooltipParents = (typeof(key) != 'string' && values.parents && values.parents.length > 0) ? values.parents : null;
								tooltipObject = self;
								return true;
							} else if (id && document.body) {
								// 툴팁을 생성할 document를 찾는다. 자신이 iframe이라면 툴팁 출력이 가능한 최상위 부모 document를 구한다.
								var win = window, deep = 0;
								try {
									while (win.parent && win.parent.document && win.parent.document !== win.document && win.document.body && win.parent.INVEN && win.parent.INVEN.Db && win.parent.INVEN.Db.Tooltip && Math.max(parseInt(win.parent.INVEN.Db.Tooltip.version) || 1, 1) >= version && win.parent.INVEN.Db.Tooltip.objects[id]) {
										deep += 1;
										win = win.parent;
									}
									if (deep > 0) {
										// iframe의 부모에 DOM을 추가하거나 제거가 가능한지 테스트한다.
										var test = win.document.createElement('div');
										win.document.body.appendChild(test);
										win.document.body.removeChild(test);
									}
								} catch(e) {
									win = window;
									deep = 0;
								}
								// 자신이 iframe일 경우 부모 document에서 실제 좌표를 계산할 수 있도록 구조를 남겨둔다.
								var documents = [ document ];
								values.parents = null;
								if (deep > 0) {
									documents[1] = win.document;
									var win = window, doc, added;
									for (var i = 0; i < deep; i++) {
										doc = win.document;
										win = win.parent;
										added = false;
										$(win.document.body).find('iframe').each(function() {
											try {
												var iframe = $(this);
												if (iframe.contents()[0] === doc) {
													added = [ iframe, doc ];
													iframe.on('mouseout', function() { self.hide(); });
													return false;
												}
											} catch(e) {}
										});
										if (added) {
											values.parents = values.parents || [];
											values.parents[values.parents.length] = added;
										} else {
											values.parents = null;
											break;
										}
									}
								}
								// 툴팁 생성 : IE7 이하에서는 jQuery로 iframe 부모에 DOM 추가 및 제거가 불가능 하기에 클래식한 방법으로 DOM을 생성하고 jQuery 객체로 만든다.
								values.zIndex = 999;
								for (var i = 0; i < documents.length; i++) {
									if (wrap) {
										var p = documents[i].getElementById(wrap);
										if (p) {
											documents[i] = $(p);
										} else {
											p = documents[i].createElement('div');
											p.id = wrap;
											documents[i].body.appendChild(p);
											documents[i] = $(p);
										}
										documents[i].attr('style', tooltipWrapStyle);
										values.zIndex = Math.max(parseInt(documents[i].css('z-index')) || values.zIndex, values.zIndex);
									} else {
										documents[i] = $(documents[i].body);
									}
								}
								values.parent = documents.length > 1 ? documents[1] : documents[0];
								values.parentPreData = documents[0];
								values.tooltip = values.parent.find('> div.'+id+':not([id]):first');
								if (values.tooltip.length == 0) {
									values.tooltip = win.document.createElement('div');
									values.tooltip.className = id;
									values.tooltip.innerHTML = '<div class="'+id+'_inner"></div>';
									values.parent[0].appendChild(values.tooltip);
									values.tooltip = $(values.tooltip).attr('style', tooltipStyle);
								}
								values.zIndex = Math.max(parseInt(values.tooltip.css('z-index')) || values.zIndex, values.zIndex);
								for (var i = 0; i < documents.length; i++) {
									if (documents[i][0].nodeName != 'BODY') documents[i].css('z-index', values.zIndex);
								}
								values.tooltips = {};
								values.loading = win.document.getElementById('InvenTooltipLoading');
								if (values.loading) {
									values.loading = $(values.loading);
								} else {
									values.loading = win.document.createElement('div');
									values.loading.id = 'InvenTooltipLoading';
									values.loading.innerHTML = '<img src="http://static.inven.co.kr/image/wow/dataninfo/edb_item/loading.gif" style="width: 100px; height: 100px; border: 0px;" />';
									win.document.body.appendChild(values.loading);
									values.loading = $(values.loading).attr('style', tooltipStyle);
								}
								return create(key, preShow);
							}
							tooltip = null;
							return false;
						};

						/* 툴팁 내용 넣기 */
						var setTooltip = function(code, type, preShow) {
							var key = getTooltipKey(code, type);
							if (create(cache[key].preData === 1 ? key : null, preShow)) {
								if (!preShow) {
									values.key = key;
									values.code = code;
									values.type = type;
								}
								if (tooltip) {
									// callback 함수 가져오기
									var func = null;
									if (callback && !preShow) {
										if (typeof(callback) == 'function') {
											func = callback;
										} else {
											try {
												func = eval('window.'+callback);
												if (typeof(func) != 'function') func = null;
											} catch(e) {
												func = null;
											}
										}
									}
									if (cache[key].type == 'json') {
										// json 타입 툴팁 처리
										if (func) {
											tooltip._inner.empty();
											var result = trim(func($(tooltip[0]), code, type, cache[key].data));
											if (tooltip._inner.is(':empty')) {
												if (result) {
													tooltip._inner.html(result);
													return true;
												}
											} else {
												return true;
											}
										}
									} else if (cache[key].type == 'text') {
										// text/html 타입 툴팁 처리 (xml로 받은 툴팁은 이미 text/html로 처리되어 있음)
										if (!(cache[key].preData === 1 && !cache[key].data)) {
											tooltip._inner.html(cache[key].data);
											if (cache[key].preData === 1) cache[key].data = null;
											if (func) func($(tooltip[0]), code, type, null);
										}
										return true;
									}
								}
							}
							if (!preShow) {
								values.key = null;
								values.code = null;
								values.type = null;
							}
							return false;
						};

						/* 툴팁 보이기 */
						this.show = function(code, type, delay, edata) {
							var key = getTooltipKey(code, type);
							if (key) {
								lastTooltip = [ code, type, delay, edata ];
								if (!possibility) return;
							}
							self.hide();
							if (key) {
								if ($.isPlainObject(cache[key])) {
									// 받은 데이터가 캐싱 되어 있다.
									if (setTooltip(code, type)) {
										setPosition();
									} else {
										self.hide();
									}
								} else if (cache[key] === true) {
									// 로딩중..
									if (create(true)) setPosition();
								} else if (cache[key] === undefined && ajaxUrl) {
									// 서버에서 툴팁 데이터 받아옴
									if (create(true)) setPosition();
									values.key = key;
									cache[key] = true;
									type = trim(type);
									edata = trim(edata);
									requestClear = function() {
										requestClear = null;
										if (cache[key] === true) delete cache[key];
										if (request) {
											clearTimeout(request);
											request = null;
										}
									};
									request = setTimeout(function() {
										request = null;
										var data = { code: code };
										if (type) data.type = type;
										if (edata) data.edata = edata;
										$.ajax({
											url: ajaxUrl,
											cache: method == 'GET',
											type: method,
											data: data,
											success: function(receive) {
												requestClear = null;
												receive = getIntelligentReceivedData(receive);
												if (receive.type == 'error') {
													cache[key] = false;
												} else {
													cache[key] = receive;
													if (receive.type == 'xml') {
														receive = convertArray2HTML(convertXML2Array(receive.data));
														cache[key] = receive ? { data: receive, type: 'text' } : false;
													}
												}
												if (key == values.key) {
													if (tooltip) {
														tooltip.css('display', 'none');
														tooltip = null;
														tooltipObject = null;
													}
													if (cache[key] && setTooltip(data.code, data.type)) {
														setPosition();
													} else {
														self.hide();
													}
												}
											},
											error: function() {
												requestClear = null;
												cache[key] = false;
												if (key == values.key) self.hide();
											}
										});
									}, $.isNumeric(delay) && parseInt(delay) >= 0 ? parseInt(delay) : requestDelay);
								}
							}
						};

						/* 툴팁 숨기기 */
						this.hide = function() {
							values.key = null;
							values.code = null;
							values.type = null;
							if (lastTooltip) lastTooltip = null;
							if (tooltip) {
								tooltip.css('display', 'none');
								tooltip = null;
								tooltipObject = null;
							}
							if (requestClear) requestClear();
						};

						/* 툴팁 새로고침 */
						this.refresh = function() {
							if (callback && tooltip && values.key && values.code && $.isPlainObject(cache[values.key])) {
								if (setTooltip(values.code, values.type)) {
									setPosition();
								} else {
									self.hide();
								}
							};
						};

						/* 수동 기정보 등록 */
						this.addPreData = function(config, data) {
							// 기존 방식 이외에 html string도 추가 가능함
							var key;
							if (($.isPlainObject(config) || $.isArray(config)) && trim(config.code)) {
								key = getTooltipKey(config.code, config.type);
							} else if (trim(config)) {
								key = getTooltipKey(config);
							} else {
								return;
							}
							if ($.isPlainObject(data) || $.isArray(data)) {
								data = convertArray2HTML(data);
								if (data) cache[key] = { data: data, type: 'text', preData: 1 };
							} else {
								data = trim(data);
								if (data) cache[key] = { data: data, type: 'text', preData: 2 };
							}
						};

						/* 수동 기정보 삭제 */
						this.clearPreData = function() {
							for (var key in cache) {
								//if (cache[key].preData) delete cache[key];
							}
						};

						/* 수동 툴팁 만들기 : 기정보 등록 후 툴팁 미리 만들어놓을때 사용 */
						this.preShow = function(code, type) {
							var key = getTooltipKey(code, type);
							if (key && $.isPlainObject(cache[key]) && cache[key].preData === 1) {
								setTooltip(code, type, true);
							}
						};

						/* 레이어 왼쪽 좌표 강제 보정 */
						this.fixOffsetLeft = 0;

						/* 레이어의 부모 노드 리턴 (data-??? 형태로 된 경우에만 적용됨 onmouseover="???.show()" 형태는 안된다) */
						var anchors = [];
						this.getAnchor = function() {
							return anchors.length == 1 ? anchors[0] : null;
						};

						this.resume = function() {
							if (!possibility) {
								possibility = true;
								if (lastTooltip) this.show(lastTooltip[0], lastTooltip[1], lastTooltip[2], lastTooltip[3]);
							}
						};

						this.pause = function() {
							if (possibility) {
								possibility = false;
								this.hide();
							}
						};

						/* [id=siteDbCategoryLayer] => data-site-category-code 속성에 대해 툴팁 요청 */
						registerShowHideAttribute(id, attribute, site, this.show, this.hide, anchors);
					};

					var trim = function(str) {
						if (typeof(str) == 'string' || typeof(str) == 'number') {
							str = $.trim(str);
							if (str.length > 0) return str;
						}
						return null;
					};

					var inArray = function(array, value) {
						if ($.isArray(array) && array.length > 0) {
							for (var i = 0; i < array.length; i++) {
								if (array[i] == value) return i;
							}
						}
						return -1;
					};

					/* AJAX로 받은 데이터의 형식 분석 XML, JSON, TEXT/HTML */
					var getIntelligentReceivedData = function(data) {
						if (typeof(data) == 'string') {
							if ((/<div\s+id\s*=\s*\"err404\"/).test(data)) {
								return { data: false, type: 'error' };
							} else if ((/\shref\s*=\s*\"http:\/\/www\.inven\.co\.kr\/common\/error\/lib\/style\/common\.css(\?|\")/i).test(data)) {
								return { data: false, type: 'error' };
							}
							if ((/^\{.+\}$/m).test($.trim(data)) || (/^\[.+\]$/m).test($.trim(data))) {
								try { return { data: $.parseJSON(data), type: 'json' }; } catch(e) {}
								try { return { data: eval('(['+data+'])[0]'), type: 'json' }; } catch(e) {}
							}
							if ((/^\s*<\?xml\s+[^?>]+\?>/).test(data)) {
								try { return { data: $.parseXML(data), type: 'xml' }; } catch(e) {}
							}
							return { data: data, type: 'text' };
						} else if (typeof(data) == 'object') {
							if (typeof(data.childNodes) == 'object' && (typeof(data.getElementsByTagName) == 'function' || typeof(data.getElementsByTagName) == 'unknown')) {
								return { data: data, type: 'xml' };
							} else {
								return { data: data, type: 'json' };
							}
						} else {
							try { return { data: String(data), type: 'text' }; } catch(e) {}
							return { data: false, type: 'error' };
						}
					};

					/* 툴팁용 XML 데이터를 Array 데이터로 변환 */
					var convertXML2Array = function(xml) {
						xml = xml.getElementsByTagName("resultdata");
						if (xml.length > 0) {
							xml = $(xml[0]);
							var config = {
								code: $.trim(xml.attr('code')),
								type: $.trim(xml.attr('type')),
								colon: xml.attr('colon') || ''
							};
							var parser = function(node) {
								var result = {};
								node.children().each(function() {
									var item = $(this);
									var one = {
										type: trim(item.attr('type')) || 'text',
										caption: trim(item.attr('caption')) || ''
									};
									if (config.colon.length > 0 && one.caption.length > 0 && !item.attr('nocolon')) one.caption += config.colon;
									if (one.type == 'list') {
										one.list = [];
										item.children().each(function(i) {
											one.list.push($.trim($(this).text()));
										});
									} else if (one.type == 'group') {
										one.value = parser(item);
									} else {
										one.value = $.trim(item.text());
									}
									result[this.tagName] = one;
								});
								return result;
							};
							return parser(xml);
						} else {
							return false;
						}
					};

					/* 툴팁용 Array 데이터를 HTML로 변환 */
					var convertArray2HTML = function(array) {
						if (($.isArray(array) || $.isPlainObject(array)) && !$.isEmptyObject(array)) {
							var html = '';
							for (var k in array) {
								var v = array[k];
								var className = ' class="'+k+'"';
								html += '<dl'+className+'>';
								if (v.type != 'group') className = '';
								html += '<dt'+className+'>'+v.caption+'</dt>';
								var ddHtml = '';
								if (v.type == 'list') {
									ddHtml += '<ul>';
									if ($.isArray(v.list) && v.list.length > 0) {
										for (var i = 0; i < v.list.length; i++) {
											ddHtml += '<li>'+v.list[i]+'</li>';
										}
									} else {
										className = className == '' ? ' class="empty"' : (className.substr(0, className.length - 1)+' empty"');
									}
									ddHtml += '</ul>';
								} else if (v.type == 'group') {
									var html2 = convertArray2HTML(v.value);
									if (html2) ddHtml += html2;
								} else if (v.type == 'image') {
									ddHtml += '<img src="'+v.value+'" />';
								} else if (v.value) {
									ddHtml += v.value;
								}
								html += '<dd'+className+'>'+ddHtml+'</dd></dl>\n';
							}
							return html;
						} else {
							return false;
						}
					};

					/* [id=siteDbCategoryLayer] => data-site-category-code 속성에 대해 툴팁 요청 */
					var registerShowHideAttribute = function(id, attribute, site, show, hide, anchors) {
						if (id) {
							var attrs = {};
							if (attribute) {
								attribute = attribute.toLowerCase();
								if ((/^[a-z][0-9a-z\-]*$/).test(attribute) && attribute.indexOf('on') !== 0) {
									if (attribute.indexOf('-') == -1 && attribute != 'rel') {
										var testElements = [ 'div', 'a', 'input', 'form', 'img' ];
										for (var i = 0; i < testElements.length; i++) {
											var test = document.createElement(testElements[i]);
											if (test) {
												if (test[attribute] !== undefined) {
													attribute = null;
													break;
												} else {
													for (var k in test) {
														if (typeof(k) == 'string' && k.toLowerCase() == attribute) {
															attribute = null;
															break;
														}
													}
													if (!attribute) break;
												}
											}
										}
									}
									if (attribute) attrs[attribute] = true;
								}
							}
							attribute = (/^(.+)Db(.+)Layer$/).exec(id);
							if (attribute) {
								attribute[2] = attribute[2].toLowerCase();
								attrs['data-'+attribute[1].toLowerCase()+'-'+attribute[2]+'-code'] = true;
								for (var s in siteDirs) {
									if (site == s || site == siteDirs[s]) {
										attrs['data-'+s.toLowerCase()+'-'+attribute[2]+'-code'] = true;
										attrs['data-'+siteDirs[s].toLowerCase()+'-'+attribute[2]+'-code'] = true;
									}
								}
							}
							for (var attr in attrs) {
								if (!showHideAttributes[attr]) {
									showHideAttributes[attr] = true;
									(function(code) {
										var type = null, edata = null;
										if ((/\-code$/).test(code)) {
											type = code.substr(0, code.length - 4)+'type';
											edata = code.substr(0, code.length - 4)+'edata';
										}
										$(document).on('mouseover mousemove mouseout', 'body ['+code+']', function(e) {
											if (e.type == 'mouseover') {
												anchors[0] = $(this);
												show(this.getAttribute(code), type ? this.getAttribute(type) : null, null, edata ? this.getAttribute(edata) : null);
											} else if (e.type == 'mousemove') {
												if (tooltip && tooltipObject === self && values.key == getTooltipKey(this.getAttribute(code), type ? this.getAttribute(type) : null)) {
													setPosition();
												}
											} else {
												anchors.pop();
												hide();
											}
										});
									})(attr);
								}
							}
						}
					};
				})(INVEN);
				
				
				var INVEN = window.INVEN || {};
				INVEN.Popup = window.INVEN.Popup || {};

				INVEN.Popup.resizeWindowBody = function(w,h, popup) {
					if (navigator.userAgent.indexOf("Chrome") > -1) {
						/* 어머 어딜 보시는 거에요 1 */
					} else {
						if ((w == document.body.clientWidth) && (h == document.body.clientHeight)) { return; }
					}

					if ((popup == undefined) || (popup == null) || (popup == "auto")) popup = opener ? true : false;

					if (popup) {
						window.resizeTo(10,10);
						if ((w == undefined) || (w == null)) { w = document.body.scrollWidth; }
						if ((h == undefined) || (h == null)) { h = document.body.scrollHeight; }
						window.resizeTo(w + 50,h + 50);
						if (navigator.userAgent.indexOf("Chrome") > -1) {
							/* 어머 어딜 보시는 거에요 2 */
						} else {
							window.resizeBy(w - document.body.clientWidth,h - document.body.clientHeight);
						}
					}
				}



