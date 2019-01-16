<%@
   page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10">
    <![endif]-->
<meta charset="UTF-8">
<title>지도첨부</title>

<link
	href="//t1.daumcdn.net/kakaomapweb/mapcopy/201810261643876/mapcopy.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="map_append" data-mode="F" data-type="O">
		<div class="wrap_append">
			<div class="search_result" style="">
				<h1 class="screen_out">지도첨부</h1>

				<div class="box_search">
					<h2 id="AREA_SEARCH" class="screen_out">장소/주소 검색</h2>
					<form name="placeSearch" class="search" method="post" action="./">
						<fieldset>
							<legend class="screen_out">장소 검색 폼</legend>
							<div class="inp_find">
								<label for="search" class="lab_find">장소,주소검색</label> <input
									type="text" id="search" name="search" class="inp_search"
									autocomplete="off" value="" />
							</div>
							<button type="submit" class="btn_comm btn_search">검색</button>
						</fieldset>
					</form>
				</div>

				<div id="daumSuggestLayer" class="search"></div>

				<div class="box_method search_guide">
					<h2 id="AREA_HELP" class="screen_out">지도 첨부 도움말</h2>
					<div class="method_fullmode">
						<h3 class="screen_out">지도 첨부 방법</h3>
						<p>첨부하고 싶은 장소가 있으신가요?</p>
						<p class="txt_method">
							원하는 장소를 검색하거나 <br />지도에 직접 표시할 수 있습니다.
						</p>
						<a href="javascript:;" class="btn_comm btn_map btn_doMySelf">지도에
							직접표시</a>
					</div>
				</div>

				<div class="box_method no_result_all">
					<div class="method_fullmode">
						<h3 class="screen_out">검색결과 안내문구</h3>
						<strong class="tit_result">검색결과가 없습니다.</strong>
						<p class="txt_method">
							검색어가 정확한지 확인 해주세요.<br />장소를 직접 표시 하실 수도 있습니다.
						</p>
						<a href="javascript:;" class="btn_comm btn_map btn_doMySelf">지도에
							직접표시</a>
					</div>
				</div>

				<div class="box_result" style="height: 812px">
					<h2 id="AREA_RESULT" class="screen_out">지도 검색 결과</h2>
					<ul class="list_tab">
						<li class="on" data-tabname="total"><a href="javascript:;"
							class="btn_all btn_tab">전체</a></li>
						<li class="" data-tabname="place"><a href="javascript:;"
							class="btn_place btn_tab">장소</a></li>
						<li class="lst" data-tabname="address"><a href="javascript:;"
							class="btn_address btn_tab">주소</a></li>
					</ul>

					<div id="result_address" class="section_address"></div>
					<div id="result_place" class="section_place"></div>
					<div id="page_wrap"></div>

					<div class="box_method no_result">
						<div class="method_fullmode">
							<h3 class="screen_out">검색결과 안내문구</h3>
							<strong class="tit_result">검색결과가 없습니다.</strong>
							<p class="txt_method">
								검색어가 정확한지 확인 해주세요.<br />장소를 직접 표시 하실 수도 있습니다.
							</p>
							<a href="javascript:;" class="btn_comm btn_map btn_doMySelf">지도에
								직접표시</a>
						</div>
					</div>
					<div class="no_keyword">
						<p>찾으시는 장소가 없다면 직접 등록해주세요.</p>
						<a href="javascript:;" class="link_more" data-target="place">신규장소
							추가<span class="ico_arrow fiy_arrow"></span>
						</a>
					</div>
				</div>

				<a href="javascript:;" class="btn_comm btn_check btn_doMySelf">지도에
					직접표시</a>

				<div class="no_keyword">
					<p>찾으시는 장소가 없다면 직접 등록해주세요.</p>
					<a href="javascript:;" class="link_more" data-target="place">신규장소
						추가<span class="ico_arrow fiy_arrow"></span>
					</a>
				</div>
			</div>

			<div class="map_info ">
				<h2 id="AREA_OPTION" class="screen_out">지도 첨부 설정</h2>
				<div class="edit_tool">
					<h3 class="screen_out">지도 꾸미기 도구</h3>
					<a href="#AREA_MAP" class="screen_out">이번 영역은 지도 꾸미기 도구 영역입니다.
						스크린 리더 사용자분께서는 현재 링크를 눌러주시면 다음 영역으로 넘어가실 수 있습니다</a>
					<div class="map_edit">
						<h3 class="screen_out">지도 형식 설정</h3>
						<div class="opt_box size_selector ">
							<div class="bg_comm size_opt">
								<span class="screen_out">지도형 선택</span> <a href="javascript:;"
									class="ico_arrow">기본형</a>
							</div>
							<input type="hidden" value="기본형" />
							<ul class="list_opt list_size none_parent">
								<li class="fst on"><a href="javascript:;" class="link_opt"
									data-type="default">기본형</a></li>
								<li><a href="javascript:;" class="link_opt"
									data-type="mini">미니형</a></li>
								<li><a href="javascript:;" class="link_opt"
									data-type="wide">와이드형</a></li>
								<li><a href="javascript:;" class="link_opt"
									data-type="parent">본문너비형</a></li>
								<li><a href="javascript:;" class="link_opt"
									data-type="custom">사용자지정형</a></li>
								<li class="cont_txt"><a href="javascript:;"
									class="link_opt" data-type="text"> <span
										class="ico_arrow ico_txt"></span><span class="txt_type">텍스트형</span>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="box_tool">
						<h3 class="tit_make">꾸미기</h3>
						<strong class="screen_out">핀 추가</strong>
						<ul class="list_edit list_pin" data-type="pin">
							<li><a href="javascript:;" class="btn_edit" data-value="1"><span
									class="ico_comm ico_pin1">핀1</span></a></li>
							<li><a href="javascript:;" class="btn_edit" data-value="2"><span
									class="ico_comm ico_pin2">핀2</span></a></li>
							<li><a href="javascript:;" class="btn_edit" data-value="3"><span
									class="ico_comm ico_pin3">핀3</span></a></li>
							<li><a href="javascript:;" class="btn_edit" data-value="4"><span
									class="ico_comm ico_pin4">핀4</span></a></li>

						</ul>
						<strong class="screen_out">도형 추가</strong>
						<ul class="list_edit list_diagram" data-type="diagram">
							<li><a href="javascript:;" class="btn_edit"
								data-value="arrow"><span class="ico_comm ico_diagram1">직선</span></a>
							</li>
							<li><a href="javascript:;" class="btn_edit"
								data-value="polyline"><span class="ico_comm ico_diagram2">화살표</span></a>
							</li>
							<li><a href="javascript:;" class="btn_edit"
								data-value="rectangle"><span class="ico_comm ico_diagram3">사각형</span></a>
							</li>
							<li><a href="javascript:;" class="btn_edit"
								data-value="ellipse"><span class="ico_comm ico_diagram4">원형</span></a>
							</li>
						</ul>
						<div class="box_edit opt_graphic">
							<strong class="screen_out">도형 굵기 선택</strong>
							<div class="opt_edit thick">
								<div class="select_edit thickness_opt">
									<a href="javascript:;" class="ico_arrow"><span
										class="ico_thick ico_thick02">3픽셀</span></a>
								</div>
								<ul class="list_opt list_thick" data-type="thick">
									<li><a href="javascript:;" class="link_opt" data-value="1"
										data-thickseq="01"><span class="ico_thick ico_thick01">1픽셀</span></a>
									</li>
									<li class="selected"><a href="javascript:;"
										class="link_opt default" data-value="3" data-thickseq="02"><span
											class="ico_thick ico_thick02">3픽셀</span></a></li>
									<li><a href="javascript:;" class="link_opt" data-value="5"
										data-thickseq="03"><span class="ico_thick ico_thick03">5픽셀</span></a>
									</li>
									<li><a href="javascript:;" class="link_opt" data-value="7"
										data-thickseq="04"><span class="ico_thick ico_thick04">7픽셀</span></a>
									</li>
									<li><a href="javascript:;" class="link_opt" data-value="9"
										data-thickseq="05"><span class="ico_thick ico_thick05">9픽셀</span></a>
									</li>
								</ul>
							</div>
							<strong class="screen_out">색상선택</strong>
							<div class="opt_edit color">
								<div class="select_edit color_opt">
									<a href="javascript:;" class="ico_arrow"><span
										class="ico_color ico_blue">파랑색</span></a>
								</div>
								<ul class="list_opt list_color" data-type="color">
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="red" alt="빨강색" /><a href="javascript:;"
										class="link_opt" data-value="red"><span
											class="ico_color ico_red">빨강색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="orange" alt="다홍색" /><a href="javascript:;"
										class="link_opt" data-value="orange"><span
											class="ico_color ico_orange">다홍색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_b_150318.png"
										data-value="darkyellow" alt="주황색" /><a href="javascript:;"
										class="link_opt" data-value="darkyellow"><span
											class="ico_color ico_darkyellow">주황색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_b_150318.png"
										data-value="yellow" alt="노랑색" /><a href="javascript:;"
										class="link_opt" data-value="yellow"><span
											class="ico_color ico_yellow">노랑색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_b_150318.png"
										data-value="lightgreen" alt="연두색" /><a href="javascript:;"
										class="link_opt" data-value="lightgreen"><span
											class="ico_color ico_lightgreen">연두색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_b_150318.png"
										data-value="mint" alt="밝은초록색" /><a href="javascript:;"
										class="link_opt" data-value="mint"><span
											class="ico_color ico_mint">밝은초록색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_b_150318.png"
										data-value="azure" alt="하늘색" /><a href="javascript:;"
										class="link_opt" data-value="azure"><span
											class="ico_color ico_azure">하늘색</span></a></li>
									<li class="on"><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="blue" alt="파랑색" /><a href="javascript:;"
										class="link_opt default" data-value="blue"><span
											class="ico_color ico_blue">파랑색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="darkblue" alt="남색" /><a href="javascript:;"
										class="link_opt" data-value="darkblue"><span
											class="ico_color ico_darkblue">남색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="purple" alt="보라색" /><a href="javascript:;"
										class="link_opt" data-value="purple"><span
											class="ico_color ico_purple">보라색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="hotpink" alt="진분홍색" /><a href="javascript:;"
										class="link_opt" data-value="hotpink"><span
											class="ico_color ico_hotpink">진분홍색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="pink" alt="분홍색" /><a href="javascript:;"
										class="link_opt" data-value="pink"><span
											class="ico_color ico_pink">분홍색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_w_150318.png"
										data-value="black" alt="검정색" /><a href="javascript:;"
										class="link_opt" data-value="black"><span
											class="ico_color ico_black">검정색</span></a></li>
									<li><img class="checked"
										src="//t1.daumcdn.net/localimg/localimages/07/2012/attach/pc_img/check_b_150318.png"
										data-value="white" alt="하얀색" /><a href="javascript:;"
										class="link_opt" data-value="white"><span
											class="ico_color ico_white">하얀색</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="top_info">
					<div class="local_info">
						<h3 class="screen_out">주소 설정</h3>
						<div class="opt_box ">
							<div class="local_opt first_area">
								<span class="screen_out">시/도 선택</span> <a href="javascript:;"
									id="local_si" class="ico_arrow">서울특별시</a>
							</div>
							<ul class="list_opt list_province first_area_box"></ul>
						</div>
						<div class="opt_box ">
							<div class="local_opt second_area">
								<span class="screen_out">구 선택</span> <a href="javascript:;"
									id="local_gu" class="ico_arrow">중구</a>
							</div>
							<ul class="list_opt list_county second_area_box"></ul>
						</div>
						<div class="opt_box">
							<div class="local_opt third_area">
								<span class="screen_out">동 선택</span> <a href="javascript:;"
									id="local_dong" class="ico_arrow">명동</a>
							</div>
							<ul class="list_opt list_town third_area_box"></ul>
						</div>
					</div>
					<ul class="tab_view tab_mapview">
						<li class="on" id="mapviewBtn"><a
							class="tab_link txt_mapview" href="javascript:;">지도</a></li>
						<li class="" id="skyviewBtn"><a class="tab_link txt_skyview"
							href="javascript:;">스카이뷰</a></li>
					</ul>
				</div>
				<!-- //top_info -->
				<div class="box_map">
					<h2 id="AREA_MAP" class="screen_out">지도/로드뷰 영역</h2>
					<a href="#AREA_CONFIRM" class="screen_out">이번 영역은 지도와 로드뷰
						영역입니다. 스크린 리더 사용자분께서는 현재 링크를 눌러주시면 다음 영역으로 넘어가실 수 있습니다</a>
					<div class="map_size">
						<strong class="screen_out">지도 사이즈</strong> <span class="size_info">488
							x 291</span> <a href="javascript:;" class="btn_comm btn_modify">수정</a>
					</div>

					<div class="view_add"></div>

					<div class="map_view">
						<div id="mapWrap">
							<div id="map"></div>

							<ul class="map_control box_zoom">
								<li id="mapzoomin"><a class="zoom in" href="javascript:;">지도
										확대</a></li>
								<li id="mapzoomout"><a class="zoom out" href="javascript:;">지도
										축소</a></li>
							</ul>
						</div>
						<div id="roadviewWrap">
							<div id="roadview"></div>
							<ul class="tab_view tab_storeview">
								<li class="on" id="roadviewBtn" data-click="flash:clickRoadView">
									<a class="tab_link" href="javascript:;">로드뷰</a>
								</li>
								<li class="" id="storeviewBtn" data-click="flash:clickStoreView">
									<a class="tab_link" href="javascript:;">스토어뷰</a>
								</li>
							</ul>
							<ul class="roadview_control box_zoom">
								<li id="zoomin" data-click="flash:zoomIn"><a
									class="zoom in" href="javascript:;">로드뷰 확대</a></li>
								<li id="zoomout" data-click="flash:zoomOut"><a
									class="zoom out" href="javascript:;">로드뷰 축소</a></li>
							</ul>
						</div>
					</div>
					<div class="txt_layer">
						<div class="layer_body">
							<strong class="screen_out">텍스트 첨부형 장소명 입력</strong> <span
								class="ico_comm ico_local"></span>
							<div class="form_place">
								<h3 class="screen_out">장소명 입력</h3>
								<div class="input_wrap">
									<label for="txtTypeName" class="lab_place">장소명을 입력하세요</label> <input
										type="text" id="txtTypeName" name="txtTypeName"
										class="tf_place" title="장소명" />
								</div>
								<button type="submit" class="ico_comm link_search">길찾기</button>
							</div>
							<p class="desc_place">서울 용산구 한남동</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="append_btn">
			<h2 id="AREA_CONFIRM" class="screen_out">취소/첨부 영역</h2>
			<div class="wrap_btn">
				<a href="javascript:;" class="btn_comm btn_close">취소</a> <a
					href="javascript:;" class="btn_comm btn_append">첨부</a>
			</div>
			<div class="old_attach_map_link_wrap">
				<a href="javascript:;" class="old_attach_map_text">구 지도첨부 가기</a> <span
					class="ico_old_attach_map"></span>
			</div>
		</div>
		<div class="bg_dim"></div>
		<div class="size_layer">
			<div class="layer_body">
				<form action="#" class="form_size">
					<fieldset>
						<legend class="screen_out">지도 사이즈 지정</legend>
						<p class="txt_cont">첨부할 지도 사이즈를 지정해주세요</p>
						<p class="txt_cont2">최대길이 723x955, 최소길이 234x156</p>
						<div class="info_size">
							<input type="text" id="size_x" name="size_x" class="tf_size"
								title="가로사이즈" />
						</div>
						<span class="ico_comm">X</span>
						<div class="info_size">
							<input type="text" id="size_y" name="size_y" class="tf_size"
								title="세로사이즈" />
						</div>
						<div class="size_alert_text"></div>
						<div class="cont_btn">
							<a href="javascript:;" class="btn_cancel btn_comm">취소</a> <a
								href="javascript:;" class="btn_confirm btn_comm">확인</a>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="preview_layer">
			<div class="layer_head">
				<strong class="txt_title"></strong> <span class="txt_info"> <span
					class="txt_address"></span> <span class="txt_bar">|</span> <span
					class="txt_call"></span>
				</span>
			</div>
			<div class="layer_body">
				<div class="map_view">
					<div class="frame_g"></div>
				</div>
			</div>
			<div class="layer_foot">
				<span class="txt_append">첨부하시겠습니까?</span><a href="javascript:;"
					class="btn_comm btn_confirm">확인</a>
			</div>
			<a href="javascript:;" class="ico_comm btn_close">닫기</a>
		</div>
	</div>

	<form name="mapform" id="mapform" action="#" method="post">
		<input type="hidden" name="mapdata" value='' />
	</form>

	<script type="text/javascript">
		var userPos = {
			posX : '',
			posY : ''
		};
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/map/map1.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/map/map2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/map/map3.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/map/map4.js"></script>
	<script type="text/javascript"
		src="//ssl.daumcdn.net/dmaps/map_js_init/v3.js?libraries=drawing"></script>
	<script type="text/javascript" charset="utf-8"
		src="//t1.daumcdn.net/kakaomapweb/mapcopy/201810261643876/popup.min.js"></script>

	<!--[if lt IE 9]>
    <script type="text/javascript" charset="utf-8" src="//t1.daumcdn.net/kakaomapweb/mapcopy/201810261643876/flashcanvas.min.js"></script>
    <![endif]-->


<!-- 	<script charset="utf-8" type="text/javascript"
		src="//m1.daumcdn.net/tiara/tracker/tiara.min.js"></script> -->
	<script type="text/javascript">
		//<![CDATA[
		/* Tiara */
		var __pageTracker = {};

		if (typeof __Tiara != 'undefined'
				&& typeof __Tiara.__getTracker != 'undefined') {
			__pageTracker = __Tiara.__getTracker();
		} else {
			__pageTracker.__trackPageview = function() {
			};
		}

		window.setTimeout(
				'try { __pageTracker.__trackPageview(); } catch(e) {}', 1);

		//]]>
	</script>
</body>
</html>