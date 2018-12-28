$(function(){
				
				$("#mpw2").blur(function(){
					var p1=$("#mpw_").val(), p2=$("#mpw2").val();
					if(p1!=p2){
						alert("패스워드가 일치하지 않습니다.");
						$("#mpw_").focus();
					}
				});
				
				/* 아이디 중복검사 이벤트 추가 */
				$("#mid_").on("keyup", function(){
			        var mid = $(this).val().trim();
			        
			        if(mid.length<4) {
			        	$(".guide.error").hide();
			        	$(".guide.ok").hide();
			        	$(".guide.invalid").show();
			        	return;
			        	
			        } else {
			        	
				        $.ajax({
				            url  : "/member/checkIdDuplicate.do",
				            data : { mid : mid },
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data.isUsable==true){ //viewName 방식
				                    $(".guide.error").hide();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").show();
				                    $("#idDuplicateCheck").val(1);
				                } else {
				                    $(".guide.error").show();
				                    $(".guide.invalid").hide();
				                    $(".guide.ok").hide();
				                    $("#idDuplicateCheck").val(0);
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
			     //console.log(mid);
				});
			});
			
/*
			function validate(){
				var mid = $("#mid_");
				if(mid.val().trim().length<4){
					alert("아이디는 최소 4자리이상이어야 합니다.");
					mid.focus();
					return false;
				}
				
				//아이디중복체크여부
			    if($("#idDuplicateCheck").val()==0){
			        alert("사용가능한 아이디를 입력해주세요.");
			        return false();
			    }
				
				return true;
			}
*/			
			
			/* 닉네임 중복검사 이벤트 추가 */
			function checkNick(){
				var nick = $("#mnick").val();
				
				$.ajax({
					url : "/member/checkNick.do",
					type : "POST",
					data : { mnick : mnick },
					dataType : "json",
					success : function(data){
						if($.trim(data)==0){
							$("#chkNick").jsp("<p style= COLOR: blue>사용가능</p>");
						} else {
							$("#chkNick").jsp("<p style= COLOR: red>사용불가</p>");
						}
					}, error : function(){
						alert("에러입니다.");
					}
				});
			};
	
			
			
			/* 파일 확장자명 이미지로만 선언하기 */
/*			function fileN(){
				
				var fileNm = $("#profilePath").val();
				
				if (fileNm != ""){
					var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
					
					if(!(ext == "gif" || ext == "jpg" || ext == "png")){
						alert("이미지파일 (.gif, .jpg, .png)만 업로드 가능합니다.");
						return false;
					}
					
				}	
			}
*/			
			
			
			