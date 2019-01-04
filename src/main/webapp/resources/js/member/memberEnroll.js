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
			
			/* 닉네임 중복검사 이벤트 추가 */
			$(document).ready(function(){
				$("#nickCheck").unbind("click").click(function(e){
					e.preventDefault();
					fn_userNickCheck();
				});
			});
			
			function fn_userNickCheck(){
				var userNick = $("#mnick").val();
				var userData = { "mnick_" : mnick } 
				
				if(userNick.length < 1) {
					alert("닉네임을 입력해주시기 바랍니다.");
				} else {
					
				}
				
			 $.ajax({
		      type : "POST",
			  url : "/member/nickCheck",
			  data : userData,
			  dataType : "json",
			  success : function(data) {
			  
			   if(data == 0) {
			    $("#mnick").attr("disabled", true);
			    alert("사용 가능한 닉네임 입니다.");
			   } else if (data == 1) {
				   alert("이미 존재하는 닉네임 입니다. \n 다른 닉네임을 사용해주세요.");
			   } else {
				   alert("에러 발생");
			   }
			   
			  }, error : function(error){
				  alert("서버가 응답하지 않습니다. \n 다시 시도해주십시오.");
			  }
			  
			 });
			 
					
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