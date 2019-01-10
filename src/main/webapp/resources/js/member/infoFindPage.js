$(function(){

	function ex(title, type, byname, ph){
		var result = null;

		if(type == "button"){
			result = $('<input>')
			.attr({
				'type' : type,
				'value' : title,
				'id' : byname,
				'class' : 'form-control btn-theme'
			})
		} else if (type == 'h') { 
			result = $('<h3>').text(title);
		} else if (type == 's') {
			result = $('<strong>').text(title);
		} else {
			result = $('<input>')
			.attr({
				'type' : type,
				'name' : byname,
				'id' : byname,
				'placeholder' : ph,
				'class' : 'form-control'
			})
		}
		return result;
	}
	
	// 아이디 찾기 탭을 눌렀을 경우
	$('#idTap').click(function(){
		$('#findDiv').html('');
		$div1 = $('<div>').attr('class', 'form-group');
		$div1.append(ex('아이디 찾기', 'h'))
		.append(ex('이름', 's'))
		.append(ex('', 'text', 'mname', '이름을 입력하세요.'))
		.append(ex('이메일', 's'))
		.append(ex('', 'email', 'email', '이메일을 입력하세요'))

		$div2 = $('<div>').attr('class', 'form-group');
		$div2.append(ex('아이디 찾기', 'button', 'btFindID'))

		$('#findDiv').append($div1).append($div2)
		
		// 아이디 찾기 눌렀을 때
		$('#btFindID').click(function(){
			var name = $('#mname').val();
			var email = $('#email').val();

			if(name.length==0) alert('이름을 입력해 주세요.');
			else if(email.length == 0) alert('이메일을 입력해 주세요.');
			else {
				$.ajax({
					url : '/member/memberFindID.do',
					data : {
						'email' : email,
						'mname' : name
					},
					success : function(data){
						$('#mname').val('').focus();
						$('#email').val('').focus();

						if(data=="") {
							$('#mname').focus();
							alert("회원정보가 존재하지 않습니다.");
						}
						else alert("회원님의 아이디는 " + data.replace(/.{3}$/, "***") + " 입니다.");
					},
					error : function(data){
						console.log(data);
					}
				})
			}
		})

	})

	// 비밀번호 찾기 탭을 눌럿을 경우
	$('#pwTap').click(function(){
		$('#findDiv').html('');
		$div1 = $('<div>').attr('class', 'form-group');
		$div1.append(ex('비밀번호 찾기', 'h'))
		.append(ex('아이디', 's'))
		.append(ex('', 'text', 'mid', '아이디를 입력하세요.'))
		.append(ex('이름', 's'))
		.append(ex('', 'text', 'mname', '이름을 입력하세요.'))
		.append(ex('이메일', 's'))
		.append(ex('', 'email', 'email', '이메일을 입력하세요'))

		$div2 = $('<div>').attr('class', 'form-group');
		$div2.append(ex('', 'text', 'chkCode', '인증번호'))
		.append(ex('인증요청', 'button', 'btCode'))

		$div3 = $('<div>').attr('class', 'form-group');
		$div3.append(ex('비밀번호 찾기', 'button', 'btFindPW'))

		$('#findDiv').append($div1).append($div2).append($div3)
		$('#chkCode').prop('disabled', 'true')
		$('#btFindPW').prop('disabled', 'true')
		
		// 인증요청을 눌렀을 경우
		$('#btCode').click(function(){
			var id = $('#mid').val();
			var name = $('#mname').val();
			var email = $('#email').val();
			
			if(id.length==0) {
				$('#mid').val('').focus();
				alert('아이디를 입력해 주세요.');
			} else if(name.length==0) {
				$('#mname').val('').focus();
				alert('이름을 입력해 주세요.');
			} else if(email.length==0) {
				$('#email').val('').focus();
				alert('이메일을 입력해 주세요.');
			} else {
				$('#btCode').prop('disabled', true);
				$.ajax({
					url : '/member/memberFindPW.do',
					data : {
						'mid' : id,
						'mname' : name,
						'email' : email
					},
					success : function(data){
						if(data) {
							$('#chkCode').prop('disabled', false);
							$('#btFindPW').prop('disabled', false);
							alert('인증 코드가 발송됩니다.');
						} else {
							$('#btCode').prop('disabled', false);
							$('#mid').val('').focus();
							$('#mname').val('');
							$('#email').val('');
							alert('일치하는 회원정보가 존재하지 않습니다.');
						}
					},
					error : function(data){
						alert("에러가 발생하였습니다.")
						$('#btCode').prop('disabled', false);
						console.log(data)
					}
				})
			}
		})

		// 비밀번호 찾기 버튼 누를 때
		$('#btFindPW').click(function(){
			var id = $('#mid').val();
			var name = $('#mname').val();
			var email = $('#email').val();
			var code = $('#chkCode').val();
			
			if(id.length==0) alert('아이디를 입력해 주세요.');
			else if(name.length==0) alert('이름을 입력해 주세요.');
			else if(email.length==0) alert('이메일을 입력해 주세요.');
			else if(code.length==0) alert('인증번호를 입력해 주세요.');
			else{
				$.ajax({
					url : "/member/sessionChk.do",
					data : {
						"mid" : id,
						"mname" : name,
						"email" : email,
						"code" : code
					},
					success : function(data){
						if(!data.isErr){
							alert(data.err + ' 일치하지 않습니다.');
						} else {
							alert('회원 이메일로 임시 비밀번호가 발송되었습니다.');
//							location.href = "/member/loginPage.go";
							window.history.back(0);
						}
					},
					error : function(data){
						console.log(data);
					}
				})
			}
		})

	})

	$('#idTap').click();

})
