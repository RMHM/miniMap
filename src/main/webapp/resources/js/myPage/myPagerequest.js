function reperBtn(){
								$('#powerUrl,#powerImg').attr("style","display:none");
							}
							function powerBtn(){
								$('#powerUrl,#powerImg').attr("style","display:block");
							}
							
							function readURL(input) { 
							
								var reader = new FileReader(); 
								reader.onload = function (e) {
									$('#imc').attr('src', e.target.result); 
									} 
								reader.readAsDataURL(input.files[0]); 
							}
							
							
							function check(){
								 

								if($('input:radio[name="aCode"]:checked').val()==2){
									
									if(('#sample4_postcode').val()==null){
									alert("주소를 입력하세요.");
									return false
									}else if($('#powerImg').val()==null){
							     		alert("대표이미지를 등록하세요.");
							     		return false
									}else if($('#powerUrl').val()==null){
										alert("사이트 주소를 작성하세요.")
									}
								}else{
									$('#powerImg').val(null);
									$('#powerUrl').val(null);
								}
						     	return true;
						   
							}
							

							function request() {
							
								$('#request')
										.attr("action",
												"${pageContext.request.contextPath}/myPage/rePermission.do");

							}
							function back() {
								$('#request').attr("action", "/myPage/myPageMain.do");

							}