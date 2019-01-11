$(function(){
		
	/* 유효성 검사 시작 */
	
	/* 비밀번호 유효성 검사 */
	$("#mpw2").blur(function(){
		var p1=$("#mpw_").val(), p2=$("#mpw2").val();
		if(p1!=p2){
		alert("패스워드가 일치하지 않습니다.");
		$("#mpw_").focus();
	}
});
	/* 닉네임 정규식, 유효성 검사 
				
	var nick = /^[가-힣]{2,6}$/;
				
	$("#mnick_").blur(function(){
		if (nick.test($('#mnick_').val())){
		console.log('true');
		$('nick_check').text('');
		} else {
		console.log('false');	
		$('#nick_check').text('한글 2자리 이상 6자리 이하 입력해주세요.');
		$('#nick_check').css('color', 'red');
	} 
}); */
				
				/* 아이디 중복 검사  */
				var id = /^[A-Za-z0-9]{6,12}$/;
				
				$("#mid_").blur(function(){
					console.log(id);
					console.log($('#mid_').val());
					if(id.test($('#mid_').val())){
						console.log('true');
						$('#id_check').text('');
					} else {
						console.log('false');
						$('#id_check').text('숫자, 대소문자 혼용 6자이상 입력바랍니다.');
						$('#id_check').css('color', 'green');
					}
				});
				
				$("#mid_").on("keyup", function(){
			        var mid = $(this).val().trim();
			        
			        if(mid.length < 6) {
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
				                if(data.isUsable==true){ 
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
				                
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
			     console.log(mid);
				});
			});

			function validate(){
				var mid = $("#mid_");
				if(mid.val().trim().length<4){
					alert("아이디는 최소 4자리 이상이어야 합니다.");
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
			
			/*
			 $("input[type=file]").change(function () {
	             
		            var fileListView = "";
		             
		            var formData = new FormData(); //ajax로 넘길 data
		             
		            var fileInput = document.getElementById("profilePath"); //id로 파일 태그를 호출
		             
		            var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		             
		            for (var i = 0; i < files.length; i++) {
		                formData.append('file-'+i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
		            }
		             
		            $.ajax({
		                url: "/member/fileSave",
		                data: formData,
		                processData: false,
		                contentType: false,
		                type: 'POST',
		                success: function(data){
		                     
		                    if(data.code == "OK"){ //응답결과
		                         
		                        fileInfoList = data.fileInfoList; //응답 결과 데이터 fileInfoList
		                        $.each(fileInfoList, function( index, fileInfo ) {
		                             
		                            console.log("Path: "+fileInfo.fileFullPath); //전체경로
		                            console.log("FileName: "+fileInfo.originalFilename); //파일명
		                                                     
		                            fileListView += "<p>"+fileInfo.originalFilename+"</p>"; //루프를 돌려서 화면에 보여줄 리스트 작성
		                             
		                        });
		                         
		                        $("#file_view_list").html(fileListView); //리스트를 화면에 보여줌
		                         
		                    }else{
		                        alert("파일 등록에 실패하였습니다.");
		                    }
		                     
		                },
		                error: function(xhr,textStatus,error){
		                                         
		                    console.log("textStatus: "+xhr.status+", error: "+error);
		                    alert("예상치 못한 오류가 발생했습니다.");
		                     
		                }
		            });
		        });
*/