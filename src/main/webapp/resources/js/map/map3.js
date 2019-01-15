/* Copyright 1995-2008 Daum Communications Corp.
 *
 * �� �꾨줈洹몃옩�� (二�)�ㅼ쓬而ㅻ��덉��댁뀡 怨듭슜 �뚰봽�몄썾�� �쇱씠�쇱뒪�� �섍굅�섏뿬
 * �뺥빐吏� 沅뚰븳�댁뿉�� �ъ슜�� 媛��ν븯��. �쇱씠�쇱뒪 �먮Ц�� LICENSE �뚯씪�대굹
 * �꾨옒�� URL�� 李멸퀬�섎씪.
 *	   http://dna.daumcorp.com/forge/docs/daum-license-1.0.txt
 */

var __Tiara = {
	version : '0.1'
};

__Tiara.util = {};

__Tiara.util.StringBuffer = function(str) {
	var buffer = [], len = 0;

	if (typeof str === 'string') {
		buffer.push(str);
		len += str.length;
	}

	return {
		push : function(s) {
			return this.append(s);
		},
		append : function(s) {
			if (typeof s !== 'string') {
				var str = s.toString();
				buffer.push(str);
				len += str.length;
			} else {
				buffer.push(s);
				len += s.length;
			}
			return this;
		},
		join : function(s) {
			return buffer.join(s);
		},
		isEmpty : function() {
			return buffer.length === 0 ? true : false;
		},
		length : function() {
			return len;
		},
		size : function() {
			return buffer.length;
		},
		toString : function() {
			return buffer.join('');
		}
	};
};

__Tiara.creater = function(h) {
	var __metainfo = [ 'category', 'subcategory', 'author', 'articleno',
			'date', 'comments', 'isauthor', 'ishidden', 'param1', 'param2',
			'param3', 'svcdomain' ], // 'description', 'keywords' remove
	tiara = __Tiara, __ua = navigator.userAgent.toLowerCase(), __miniDaum_varMode = (typeof miniDaum_varMode === 'string') ? miniDaum_varMode
			: null, __isIE = __ua.indexOf("msie") > -1, __isBot = __ua
			.indexOf('google web preview') > -1, __isIOS = /iP[ao]d|iPhone/i
			.test(__ua), __metaitems = null, __params = {
		version : __Tiara.version
	}, __top = top, __parent = parent, __w = window, __d = document, __title = __d.title, __url = __w.location.href, __referer = __d.referrer, __setRefererForce = false, __h = __w.location.protocol
			+ '//track.tiara.daum.net', __allowHash = false, __sendPV = false, __isiframe = false, __tiaraLoadTime = new Date(),

	encode = function(s) {
		if (!s || s === null) {
			return '';
		}
		if (typeof (encodeURIComponent) === 'function') {
			return encodeURIComponent(s);
		} else {
			return escape(s);
		}
	},

	cutString = function(s, len) {
		if (!s) {
			return '';
		}
		if (typeof s !== 'string') {
			return '';
		}
		if (s.length > len) {
			return s.substring(0, len);
		} else {
			return s;
		}
	},

	typeOf = function(value) {
		var s = typeof value;
		if (s === 'object') {
			if (value) {
				if (typeof value.length === 'number'
						&& !(value.propertyIsEnumerable('length'))
						&& typeof value.splice === 'function') {
					s = 'array';
				}
			} else {
				s = 'null';
			}
		}
		return s;
	},

	isEmpty = function(o) {
		var i, v;
		if (typeOf(o) === 'object') {
			for (i in o) {
				if (o.hasOwnProperty(i)) {
					v = o[i];
					if (v !== undefined && typeOf(v) !== 'function') {
						return false;
					}
				}
			}
		}
		return true;
	},

	getDocumentLoadTime = function() {
		if (typeof __w.__TiaraObj === 'undefined'
				|| typeof __w.__TiaraObj !== 'object'
				|| !__w.__TiaraObj.startTime) {
			return '';
		}
		var startTime = __w.__TiaraObj.startTime.getTime(), nowTime = __tiaraLoadTime
				.getTime();
		return "&loadtime=" + (nowTime - startTime);
	},

	isIE = function() {
		return __isIE;
	},

	isHomePage = function() {
		var homeStr = new tiara.util.StringBuffer();
		homeStr.append("&ishome=");
		if (!isIE()) {
			return homeStr.append('U').toString();
		}
		var l = __w.location, docBody = null;

		if (__isiframe) {
			try {
				docBody = __top.document.body;
				l = __top.window.location;
			} catch (e) {
			}
		}

		if (typeof docBody === 'object') {
			try {
				docBody.style.behavior = 'url(#default#homepage)';
				var isHome = docBody.isHomePage(l.protocol + '//' + l.hostname)
						|| docBody.isHomePage(l.protocol + '//' + l.hostname
								+ '/') || docBody.isHomePage(l.href), yn = isHome ? 'Y'
						: 'N';
				return homeStr.append(yn).toString();
			} catch (e2) {
			}
		}
		return homeStr.append('U').toString();
	},

	relativeURL = function(s) {
		if (!s || typeof s !== 'string') {
			return '';
		}
		var l = __w.location;
		var url = s;
		var str = s.toString();
		if (str.charAt(0) === '/') {
			url = l.protocol + '//' + l.hostname + s;
		} else if (str.length > 9 && str.charAt(4) === ':'
				|| str.charAt(5) === ':') {
			url = s;
		} else {
			url = l.protocol
					+ '//'
					+ l.hostname
					+ l.pathname
							.substring(0, (l.pathname.lastIndexOf('/') + 1))
					+ s;
		}
		return url;
	},

	getRemoveHashURL = function(url) {
		if (typeof url !== 'string') {
			return url;
		}
		var url2 = url;
		var index = url2.indexOf('#');
		if (!__allowHash && (index > -1)) {
			url2 = url2.substring(0, index);
		}
		return url2;
	},

	getURL = function(nURL) {
		var url = (typeof nURL !== 'undefined') ? relativeURL(nURL) : __url;
		if (url.charAt(0) !== 'h') {
			return '';
		}
		// Minidaum variable XXX
		if (!nURL && typeof __miniDaum_varMode !== 'undefined'
				&& __miniDaum_varMode === 'iframe') {
			try {
				url = __parent.location.href;
			} catch (_e) {
				try {
					__d.domain = 'daum.net';
					url = __parent.location.href;
				} catch (e) {
					url = __referer;
				}
			}
		}
		if (!__allowHash) {
			url = getRemoveHashURL(url);
		}
		return "&url=" + encode(url);
	},

	getReferer = function() {
		if (__isiframe && !__setRefererForce) {
			var r;
			var x;
			if (typeof __miniDaum_varMode !== 'undefined'
					&& __miniDaum_varMode === 'iframe') {
				// TODO ????
				try {
					x = __top.document.URL;
				} catch (e) {
					x = null;
				}
				if (!x) {
					try {
						__d.domain = 'daum.net';
						x = __parent.document.URL;
					} catch (e1) {
						x = null;
					}
				}
				if (x === __d.referrer) {
					try {
						r = __parent.document.referrer;
					} catch (e2) {
						r = null;
					}
				} else {
					r = __d.referrer;
				}
			} else {
				try {
					x = __top.document.URL;
				} catch (e3) {
					x = null;
				}
				if (!x) {
					try {
						x = __parent.document.URL;
					} catch (e4) {
						x = null;
					}
				}
				if (x === __d.referrer) {
					try {
						r = __top.document.referrer;
					} catch (e5) {
						try {
							r = __parent.document.referrer;
						} catch (e6) {
							r = null;
						}
					}
				} else {
					r = __d.referrer;
				}
			}
			return "&referer=" + encode(getRemoveHashURL(r));
		} else {
			return "&referer=" + encode(getRemoveHashURL(__referer));
		}
	},

	getTitle = function() {
		var title = __title;
		// Minidaum variable XXX
		if (typeof __miniDaum_varMode !== 'undefined'
				&& __miniDaum_varMode === 'iframe') {
			try {
				title = __parent.document.title;
			} catch (_e) {
				try {
					__d.domain = 'daum.net';
					title = __parent.document.title;
				} catch (e) {
				}
			}
		}
		return "&title=" + encode(title);
	},

	checkMetaName = function(name) {
		if (!name && typeof name !== 'string') {
			return false;
		}
		for (var i = 0; i < __metainfo.length; i++) {
			if (name.toLowerCase() === __metainfo[i].toLowerCase()) {
				return true;
			}
		}
		return false;
	},

	checkMaximumURL = function(url, str) {
		if (typeof url === 'object' && typeof str === 'string') {
			var len = url.length() + str.length;
			if (isIE() && len > 2048) {
				return true;
			}
		}
		return false;
	},

	initMetaInfomation = function() {
		var head = __d.getElementsByTagName('head');
		if (!head) {
			return;
		}
		var metas = head[0].getElementsByTagName('meta');
		if (!metas) {
			return;
		}

		__metaitems = {};
		for (var i = 0; i < metas.length; i++) {
			if (metas[i].name && checkMetaName(metas[i].name)) {
				var name = metas[i].name;
				var content = metas[i].content;
				if (name && content) {
					__metaitems[cutString(name, 50).toLowerCase()] = cutString(
							content, 127);
				}
			}
		}
	},

	getMetaInfomations = function() {
		if (!__metaitems && __metaitems === null) {
			return '';
		}

		var arrs = [];
		for ( var name in __metaitems) {
			if (__metaitems.hasOwnProperty(name)) {
				var content = __metaitems[name];
				if (content) {
					if (name === 'date') {
						arrs.push(encode('doc_date') + '=' + encode(content));
					} else {
						arrs.push(encode(name) + '=' + encode(content));
					}
				}
			}
		}
		return arrs.length > 0 ? '&' + arrs.join('&') : '';
	},

	getParams = function() {
		if (!__params) {
			return '';
		}
		var param = new tiara.util.StringBuffer();
		for ( var key in __params) {
			if (__params.hasOwnProperty(key)) {
				param.append(encode(key) + '=' + encode(__params[key]));
			}
		}
		if (param.isEmpty()) {
			return ''; //
		}
		return '&' + param.join('&');
	},

	addXEvent = function(target, eventName, handler) {
		if (typeof target === 'undefined') {
			return;
		}
		if (target.addEventListener) {
			target.addEventListener(eventName, handler, false);
		} else if (target.attachEvent) {
			target.attachEvent("on" + eventName, handler);
		} else {
			var oldevent = target["on" + eventName];
			if ('funciton' === typeof oldevent) {
				target["on" + eventName] = function() {
					oldevent();
					handler();
				};
			} else {
				target["on" + eventName] = handler;
			}
		}
	},

	terminate = null; // 蹂��� �뺤쓽 留덉�留� ';'媛� �ㅼ뼱媛��� �⑸땲��.

	return {
		__initData : function(obj) {
			__params.dpr = window.devicePixelRatio || '';
			__params.cke = navigator.cookieEnabled ? 'Y' : 'N';
			if ('undefined' !== typeof document.cookie) {
				var expires = new Date(new Date().getTime() + 60000);
				document.cookie = [ '__T_=1; expires=', expires.toUTCString(),
						'; path=', location.pathname, '; domain=',
						location.hostname ].join('');
				__params.pck = document.cookie.indexOf('__T_=1') !== -1 ? 'Y'
						: 'N';
				document.cookie = [ '__T_=0; expires=',
						new Date(1).toUTCString(), '; path=',
						location.pathname, '; domain=', location.hostname ]
						.join('');
			}
			try {
				var l;
				try {
					l = __top.document.URL;
				} catch (_e) {
					l = null;
				}
				if (l !== __d.URL) {
					__isiframe = true;
				}
				initMetaInfomation(); // document meta information
			} catch (e) {
			}
		},

		__setTitle : function(title) {
			if (!title || typeof title !== 'string') {
				return;
			}
			__title = title;
		},

		__setURL : function(url) {
			if (!url || typeof url !== 'string') {
				return;
			}
			__url = relativeURL(url);
		},

		__setMetaInfo : function(itemArrays) {
			if (typeof (itemArrays) !== 'object') {
				return;
			}
			if (typeof itemArrays.length === 'number') {
				__metainfo = itemArrays;
			}
		},

		__setReferer : function(referer) {
			if (!referer || typeof (referer) !== 'string') {
				return;
			}
			__referer = referer;
			__setRefererForce = true;
		},

		__setAllowHash : function(bool) {
			__allowHash = bool ? 1 : 0;
		},

		__addParam : function(key, value) {
			if (key && value) {
				if (checkMetaName(key)) {
					if (__metaitems) {
						__metaitems[cutString(key, 50)] = cutString(value, 127);
					}
				} else {
					__params[key] = value;
				}
			}
		},

		__trackClickView : function(agEvt) {
			try {
				var evt = agEvt || __w.event;
				var obj = (agEvt && agEvt.tagName) ? agEvt : evt.srcElement
						|| evt.target;
				while (1) {
					if (obj.tagName.toLowerCase() === 'a') {
						break;
					} else {
						if (obj.parentNode) {
							obj = obj.parentNode;
						} else {
							break;
						}
					}
				}
				if (obj.href.indexOf('javascript') < 0) {
					var url = obj.href;
					if (url && url.charAt(0) !== 'h') { // http only
						return;
					}

					var dummy = new Date().getTime()
							+ Math.round(Math.random() * 2147483647);
					var callURL = new tiara.util.StringBuffer();
					callURL.push(__h);
					callURL.push("/queen/touch?dummy=");
					callURL.push(dummy);
					callURL.push(getDocumentLoadTime());
					callURL.push(isHomePage());
					callURL.push(getURL(url));
					callURL.push(getReferer());
					callURL.push(getTitle());
					callURL.push(getParams());
					var img = new Image(1, 1);
					img.src = callURL.toString();
					img.onload = function() {
					};
				}
			} catch (e) {
			}
		},

		__trackPageview : function(nURL) {
			if (__sendPV || __isBot) {
				return;
			}
			var dummy = new Date().getTime()
					+ Math.round(Math.random() * 2147483647);
			var callURL = new tiara.util.StringBuffer();
			callURL.push(__h);
			callURL.push("/queen/footsteps?dummy=");
			callURL.push(dummy);
			callURL.push(getDocumentLoadTime());
			callURL.push(isHomePage());
			callURL.push(getReferer());
			callURL.push(getTitle());
			callURL.push(getMetaInfomations());
			callURL.push(getParams());
			var url = getURL(nURL);
			// http://support.microsoft.com/kb/208427
			// Maximum URL length is 2,083 characters in Internet Explorer
			if (!checkMaximumURL(callURL, url)) {
				callURL.push(url);
			}
			if (!nURL) {
				__sendPV = true;
			}
			var img = new Image(1, 1);
			img.onload = function() {
			};
			var minidaumLayer = __d.getElementById('DaumUI__minidaum')
					|| __d.getElementById('daumMinidaum')
					|| __d.getElementById('wrapMinidaum');
			var magic_frame_id = '__magic_frame';
			var tiara_layer_id = '__tiara_layer';
			var tiaraLayer = __d.getElementById(tiara_layer_id);
			var magicFrame = __d.getElementById(magic_frame_id);
			if (__w.location.protocol === 'https:' || __isIOS
					|| __w.location.hostname === 'search.daum.net'
					|| minidaumLayer === null || magicFrame !== null) {
				// iframe �ｌ쓣 �� �놁쓣 寃쎌슦�먮뒗 臾댁“嫄� �몄텧, iOS�� 寃쎌슦 DaumApp�먯꽌
				// iframe異붽� �섎㈃ Loading Indicator 2踰� �⑤뒗 臾몄젣濡� �쒖쇅��.
				img.src = callURL.toString();
				return;
			}
			if (magicFrame === null) {
				magicFrame = __d.createElement('iframe');
				magicFrame.id = magic_frame_id;
				magicFrame.setAttribute('width', '0px');
				magicFrame.setAttribute('height', '0px');
				magicFrame.setAttribute('border', 0);
				magicFrame.setAttribute('frameBorder', 0);
				magicFrame.setAttribute('scrolling', 'no');
				magicFrame.setAttribute('style',
						'overflow:hidden; border:0; width:0px; height:0px;');
				// MSIE �먯꽌 '�댁쟾/�ㅼ쓬' �묐룞 �좊븣 dummy parameter �뚮Ц��
				// '�ㅼ쓬(forward)' �놁뼱吏��� 臾몄젣媛� 諛쒓꼍 �� 2011/09/23
				dummy = '';
				if ('string' === typeof __w.location.search
						&& __w.location.search.indexOf('debug') > -1) {
					dummy += '&debug';
				}
				try {
					var dom = tiaraLayer || minidaumLayer;
					if (dom) {
						var frame = dom.appendChild(magicFrame);
						frame.src = __w.location.protocol
								+ '//track.tiara.daum.net/shining/index.shtml?dummy='
								+ dummy;
						addXEvent(frame, 'load', function(url) {
							return function() {
								var img = new Image(1, 1);
								img.onload = function() {
								};
								img.src = url;
							};
						}(callURL.toString()));
					} else {
						img.src = callURL.toString();
					}
				} catch (e) {
					// iframe �ｌ쓣 �� �놁쓣 寃쎌슦�먮뒗 臾댁“嫄� �몄텧.
					img.src = callURL.toString();
				}
			}
			magicFrame = null;
		}
	};
};

__Tiara.__getTracker = function(h) {
	var obj = null;
	try {
		obj = new __Tiara.creater(h);
		obj.__initData();
	} catch (e) {
		obj = {};
		obj.__trackPageview = function() {
		};
		obj.__trackClickView = function() {
		};
	}
	return obj;
};