$(function() {

	/* 유효성 검사 시작 */

	/* 아이디 유효성 검사 */
	var id = /^[A-Za-z0-9]{6,12}$/;

	$("#mid_").blur(function() {
		console.log(id);
		console.log($('#mid_').val());
		if (id.test($('#mid_').val())) {
			console.log('true');
			$('#id_check').text('');

		} else {
			console.log('false');
			$('#id_check').text('숫자, 영문 혼용 6자이상 입력');
			$('#id_check').css('color', 'green');
		}
	});

	$("#mid_").on("keyup", function() {
		var mid = $(this).val().trim();

		if (mid.length < 6) {
			$(".guide.error").hide();
			$(".guide.ok").hide();
			$(".guide.invalid").show();
			return;

		} else {

			$.ajax({
				url : "/member/checkIdDuplicate.do",
				data : {
					mid : mid
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.isUsable == true) {
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
				},
				error : function(jqxhr, textStatus, errorThrown) {
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

	/* 비밀번호 유효성 검사 */
	var pw = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[~!@#$%^&*()-_=+]).{6,15}/
	
	$("#mpw_").blur(function() {
		console.log(pw);
		console.log($('#mpw_').val());
		if (pw.test($('#mpw_').val())) {
			console.log('true');
			$('#pw_check').text('');
		} else {
			console.log('false');
			$('#pw_check').text('최소 1개씩의 숫자,영문 특수문자를 포함.');
			$('#pw_check').css('color', 'green');
		}
	});
	
	$("#mpw_").on("keyup", function() {
		var mpw = $(this).val().trim();
	
		if (mpw.length < 6) {
			$(".pw.e").hide();
			$(".pw.o").hide();
			$(".pw.i").show();
			return;
		} else {
			$.ajax({
				url : "/member/checkPw.do",
				data : {
					mpw : mpw
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.isUsable == true) {
						$(".pw.e").hide();
						$(".pw.i").hide();
						$(".pw.o").show();
						$("#pwCheck").val(1);
					} else {
						$(".pw.e").show();
						$(".pw.i").hide();
						$(".pw.o").hide();
						$("#pwCheck").val(0);
					}
				},
				error : function(jqxhr, testStatus, errorThrown) {
					console.log("ajax 처리 실패");
				}
			});
		}
		console.log(mpw);
	});

	var pw = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/
	
	$("#mpw2").blur(function() {
		console.log(pw);
		console.log($('#mpw2').val());
		if (pw.test($('#mpw2').val())) {
			console.log('true');
			$('#pw2_check').text('');
		} else {
			console.log('false');
			$('#pw2_check').text('위에 입력한 비밀번호와 일치하여 입력.');
			$('#pw2_check').css('color', 'green');
		}
	});
	
	$("#mpw2").on("keyup", function() {
		var mpw = $(this).val().trim();
	
		if (mpw.length < 6) {
			$(".pw2.e").hide();
			$(".pw2.o").hide();
			$(".pw2.i").show();
			return;
		} else {
			$.ajax({
				url : "/member/checkPw.do",
				data : {
					mpw : mpw
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.isUsable == true) {
						$(".pw2.e").hide();
						$(".pw2.i").hide();
						$(".pw2.o").show();
						$("#pwCheck").val(1);
					} else {
						$(".pw2.e").show();
						$(".pw2.i").hide();
						$(".pw2.o").hide();
						$("#pwCheck").val(0);
					}
				},
				error : function(jqxhr, testStatus, errorThrown) {
					console.log("ajax 처리 실패");
				}
			});
		}
		console.log(mpw2);
	});

	$("#mpw2").blur(function() {
		var p1 = $("#mpw_").val(), p2 = $("#mpw2").val();
		if (p1 != p2) {
			alert("패스워드가 일치하지 않습니다.");
			$("#mpw_").focus();
		}
	});

	/* 이름 유효성 검사 */
	var name = /^[가-힣]+$/;
	
	$("#mname_").blur(function() {
		console.log(name);
		console.log($('#mname_').val());
		if (name.test($('#mname_').val())) {
			console.log('true');
			$('#name_check').text('');
		} else {
			console.log('false');
			$('#name_check').text('한글만 입력');
			$('#name_check').css('color', 'green');
		}
	});
	
	$("#mname_").on("keyup", function(){
		var mname = $(this).val().trim();
		
		if (mname.length < 3){
			$(".name.e").hide();
			$(".name.o").hide();
			$(".name.i").show();
			return;
		} else {
			
			$.ajax({
				url : "/member/checkName.do",
				data : {
					mname : mname
				},
				dataType : "json",
				success : function(data){
					console.log(data);
					if (data.isUsable == true){
						$(".name.e").hide();
						$(".name.i").hide();
						$(".name.o").show();
						$("#nameCheck").val(1);
					} else {
						$(".name.e").show();
						$(".name.i").hide();
						$(".name.o").hide();
						$("#nameCheck").val(0);
					}
				},
				error : function(jqxhr, testStatus, errorThrown) {
					console.log("ajax 처리 실패");
				}
			});
		}
	});
	
	/* 닉네임 유효성 검사 */
	var nick = /^[가-힣a-zA-Z0-9]+$/;
	
	$("#mnick_").blur(function() {
		console.log(nick);
		console.log($('#mnick_').val());
		if (nick.test($('#mnick_').val())) {
			console.log('true');
			$('#nick_check').text('');
		} else {
			console.log('false');
			$('#nick_check').text('최소 1개의 숫자, 알파벳, 한글만 포함.');
			$('#nick_check').css('color', 'green');
		}
	});

	$("#mnick_").on("keyup", function() {
		var mnick = $(this).val().trim();
	
		if (mnick.length < 2) {
			$(".nick.e").hide();
			$(".nick.o").hide();
			$(".nick.i").show();
			return;
		} else {
	
			$.ajax({
				url : "/member/checkNick.do",
				data : {
					mnick : mnick
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.isUsable == true) {
						$(".nick.e").hide();
						$(".nick.i").hide();
						$(".nick.o").show();
						$("#nickCheck").val(1);
					} else {
						$(".nick.e").show();
						$(".nick.i").hide();
						$(".nick.o").hide();
						$("#nickCheck").val(0);
					}
				},
				error : function(jqxhr, testStatus, errorThrown) {
					console.log("ajax 처리 실패");
				}
			});
		}
	
		console.log(mnick);
	});

	/* 이메일 유효성 검사 */
	var email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
	
	$("#email").blur(function() {
		console.log(email);
		console.log($('#email').val());
		if (email.test($('#email').val())) {
			console.log('true');
			$('#email_check').text('');
		} else {
			console.log('false');
			$('#email_check').text("특수문자, 한글 제외 입력.");
			$('#email_check').css('color', 'green');
		}
	});

	$("#email").on("keyup", function() {
		var email = $(this).val().trim();
	
		if (email.length < 6) {
			$(".email.e").hide();
			$(".email.o").hide();
			$(".email.i").show();
			return;
		} else {
	
			$.ajax({
				url : "/member/checkEmail.do",
				data : {
					email : email
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.isUsable == true) {
						$(".email.e").hide();
						$(".email.i").hide();
						$(".email.o").show();
						$("#emailCheck").val(1);
					} else {
						$(".email.e").show();
						$(".email.i").hide();
						$(".email.o").hide();
						$("#emailCheck").val(0);
					}
				},
				error : function(jqxhr, testStatus, errorThrown) {
					console.log("ajax 처리 실패");
	
					console.log(jqxhr);
				}
			});
		}
	
		console.log(email);
	});


/* 파일 업로드 시 미리보기 */
function readURL(input) {

	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#imc').attr('src', e.target.result);

		}

		reader.readAsDataURL(input.files[0]);
	}
}

$("#profilePath_").change(function() {
	readURL(this);
});


/* ENTER 키 submit */
function captureReturnKey(e) {
    if(e.keyCode==13 && e.srcElement.type != 'textarea')
    return false;
}

/* 회원가입폼 가입 및 취소 */
function loginForm() {
	location.href = "/";
	if (confirm("메인 페이지로 돌아가시겠습니까?") == true) { // yes
	} else {
		location.href = "/member/memberEnroll.go";
	}
}

/* 가입시 유효성 체크 */
function check(){
	$('#')
	
}
