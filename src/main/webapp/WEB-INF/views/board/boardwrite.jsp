<%@
   page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="<%=request.getContextPath()%>/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>


</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div class="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="col-md-2" align="center">
				&nbsp;&nbsp;
				<h4>--게시판 목록--</h4>
				<ul class="unstyled">
					<br><br>
					<li><a href="/board/boardlist1.do">자유 게시판</a></li>
					<br>
					<li><a href="/board/boardlist2.do">정보공유 게시판</a></li>
					<br>
					<li><a href="/board/boardlist3.do">여행후기 게시판</a></li>
					<br>
					<li><a href="/board/boardlist4.do">질문 게시판</a></li>
				</ul>
			</div>
			<!-- 에디터 넣어야됨. -->
			<div class="col-md-10">
				<c:if test="${not empty member}">
					<form action="/board/boardinsert.do" method="post" id="boardfrm"
						enctype="multipart/form-data">
						<input type="hidden" id="mNo" name="mNo" value="${member.mno}" />
						<!-- 작성자 회원번호  -->
						
						<br>						
						<select name="bCode" id="bCode" class="bCode" data-bCode="0">
							<option value="0">게시판 선택</option>
  							<option value="1">자유</option> 
  							<option value="2">정보공유</option>
 							<option value="3">여행후기</option>
 							<option value="4">질문</option> 							
						</select>
						<c:if test="${member.mtype eq 'A' }">
							<input type="checkbox" name="isNotice2" checked="checked">공지글로 올리기 <br>
						</c:if>
						<input type="hidden" name="isNotice" value='N'> 						
						<input type="text" placeholder="제목을 입력해주세요" name="bTitle" id="bTitle" 
						required style="width:90%;">
						<div id="daumeditor" class="edit" style="width: 90%; height: 100%;"></div>													
						<textarea name="boardcontent" id="boardcontent"
							style="display: none;"></textarea>							
							
												
						<!-- <input type="radio" name="bCode" value="1" checked="checked">잡담
						<input type="radio" name="bCode" value="2">정보 
						<input type="radio" name="bCode" value="3">후기 
						<input type="radio" name="bCode" value="4">질문 	 -->
						
						<input type="button" class="btn btn-theme" id="insertBoard" value="등록" style="right: 105px;"/>
						<input type="button" value="취소" onclick="history.back(-1);"
						class="btn btn-warning" style="right: 160px;"/>	
					</form>
				</c:if>				
										
			</div>
			
			<%-- <div>

				<div class="container-fluid">
					<div class="row">
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-theme" id="viewmap" 
						onclick="viewmap(this);">지도추가 </button>					
						<div class="col-md-2"></div>
						<div class="col-md-10" name="jejumap" style="visibility:hidden;">
						<c:import url="/WEB-INF/views/test/testMap2.jsp"/>
						</div>
					</div>
				</div>
				
			</div> --%>
		</div> <br><br>
		
		
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script type="text/javascript">

function viewmap(obj) {
	$(obj).css('display', 'none');		
	
	$('div[name="jejumap"]').css('visibility', 'visible');	
	
}

$(document).ready(function () {
	var link = document.location.href;
	console.log("url:" + link);
	var lastChar = link.substr(link.length - 1);
	console.log("BCode:" +lastChar);
	
	  bCode_val = $('select.bCode').attr('data-type');
	  $('select.bCode option[value=' + lastChar + ']').attr('selected', 'selected');
	});



$(function(){
    $.ajax({
        url : "<%=request.getContextPath()%>/daumeditor/editor_frame.html",
        success : function(data){
            $("#daumeditor").html(data);
            // 에디터UI load
            var config = {
                /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
                txHost: '',
                /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
                txPath: '',
                /* 수정필요없음. */
                txService: 'sample',
                /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
                txProject: 'sample',
                /* 대부분의 경우에 빈문자열 */
                initializedId: "",
                /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
                wrapper: "tx_trex_container",
                /* 등록하기 위한 Form 이름 */
                form: "boardfrm",
                /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
                txIconPath: "/daumeditor/images/icon/editor/",
                /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
                txDecoPath: "/daumeditor/images/deco/contents/",
                canvas: {
                    styles: {
                        /* 기본 글자색 */
                        color: "#123456",
                        /* 기본 글자체 */
                        fontFamily: "굴림",
                        /* 기본 글자크기 */
                        fontSize: "10pt",
                        /*기본 배경색 */
                        backgroundColor: "#fff",
                        /*기본 줄간격 */
                        lineHeight: "1.5",
                        /* 위지윅 영역의 여백 */
                        padding: "8px"
                    },
                    showGuideArea: false
                },
                events: {
                    preventUnload: false
                },
                sidebar: {
                    attachbox: {
                        show: true,
                        confirmForDeleteAll: true
                    }
                },
                size: {
                    /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
                    contentWidth: 2048
                }
            };
             
            //에디터내에 환경설정 적용하기
            new Editor(config);
        }
    });
     
    //form submit 버튼 클릭
    $("#insertBoard").click(function(){
    	var bCode = $('#bCode').val(); 
    	
    	if(bCode == 0){
    		alert('게시판유형을 선택해주세요.');
    	}else {
    	    	
    		if ($('input[name=isNotice2]').is(":checked")) {
    		    $('input[name=isNotice]').val('Y');    	   
    		} else {
    		    $('input[name=isNotice]').val('N');    	   
    		}
     	   //다음에디터가 포함된 form submit
     	   Editor.save();
    	}
    })
})
 
 
//Editor.save() 호출 한 다음에 validation 검증을 위한 함수
//validation 체크해줄 입력폼들을 이 함수에 추가 지정해줍니다.
function validForm(editor) {
    var validator = new Trex.Validator();
    var content = editor.getContent();
    if (!validator.exists(content)) {
        alert('내용을 입력하세요');
        return false;
    }
    return true;
}
  
//validForm 함수까지 true값을 받으면 이어서 form submit을 시켜주는  setForm함수


function setForm(editor) {
    var content = editor.getContent();
    $("#boardcontent").val(content)
    return true;
}






</script>




</html>