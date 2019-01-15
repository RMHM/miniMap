/**
 * 
 */

		window.daum = window.daum || {},
		function() {
			function t(t) {
				var a = {};
				return t.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(t, e, r) {
					a[e] = r
				}), a
			}
			function a(t) {
				t
						&& document.write('<script charset="UTF-8" src="' + t
								+ '"></script>')
			}
			function e() {
				if (i.length) {
					var t = r(R[i.shift()], e);
					t.start()
				} else
					n()
			}
			function r(t, a) {
				var e = document.createElement("script");
				return e.charset = "utf-8", e.onload = a,
						e.onreadystatechange = function() {
							/loaded|complete/.test(this.readyState) && a()
						}, {
							start : function() {
								e.src = t || "", document
										.getElementsByTagName("head")[0]
										.appendChild(e), e = null
							}
						}
			}
			function n() {
				for (; s[0];)
					s.shift()();
				I.readyState = 2
			}
			var I = daum.maps = daum.maps || {};
			if (void 0 === I.readyState)
				I.onloadcallbacks = [], I.readyState = 0;
			else if (2 === I.readyState)
				return;
					I.VERSION = {
						ROADMAP : "1810uis",
						ROADMAP_SUFFIX : "",
						HYBRID : "1810uis",
						SR : "3.00",
						ROADVIEW : "7.00",
						ROADVIEW_FLASH : "181207",
						ROADVIEW_FLASH_LITE : "181207",
						BICYCLE : "6.00",
						USE_DISTRICT : "1810uis",
						INDOOR : "1810uis",
						K3F : "1804vdy",
						SKYVIEW_VERSION : "160114",
						SKYVIEW_HD_VERSION : "160107"
					},
					I.RESOURCE_PATH = {
						ROADVIEW_AJAX : "//s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/ajax/180618/1529304089079/roadview.js"
					};
			for (var E, c = "https:" == location.protocol ? "https:" : "http:", S = "", _ = document
					.getElementsByTagName("script"), o = _.length; E = _[--o];)
				if (/\/map_js_init\/v3\.js\b/.test(E.src)) {
					S = E.src;
					break
				}
			_ = null;
			var s = I.onloadcallbacks, i = [ "v3" ], R = {
				v3 : c + "//t1.daumcdn.net/mapjsapi/js/main/3.5.27/v3.js",
				drawing : c
						+ "//s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1.2.4/1508998369646/drawing.js",
				clusterer : c
						+ "//s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1.0.6/1460434272434/clusterer.js"
			};
			if (S) {
				var d = t(S), l = d.libraries;
				if (l && (i = i.concat(l.split(","))), "false" !== d.autoload) {
					for (var o = 0; o < i.length; o++)
						a(R[i[o]]);
					I.readyState = 2
				}
			}
			I.load = function(t) {
				switch (s.push(t), I.readyState) {
				case 0:
					I.readyState = 1, e();
					break;
				case 2:
					n()
				}
			}
		}();