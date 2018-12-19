$(function(){

	$('#pwFindDiv').css({"display" : "none"})

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
	
	$('#idTap').click(function(){
		$('#findDiv').html('');
		$div1 = $('<div>').attr('class', 'form-group');
		$div1.append(ex('아이디 찾기', 'h'))
			.append(ex('이름', 's'))
			.append(ex('', 'text', 'mname', '이름을 입력하세요.'))
			.append(ex('이메일', 's'))
			.append(ex('', 'email', 'memail', '이메일을 입력하세요'))
		
		$div2 = $('<div>').attr('class', 'form-group');
		$div2.append(ex('아이디 찾기', 'button'))
		
		$('#findDiv').append($div1).append($div2)
	})


	$('#pwTap').click(function(){
		$('#findDiv').html('');
		$div1 = $('<div>').attr('class', 'form-group');
		$div1.append(ex('비밀번호 찾기', 'h'))
			.append(ex('아이디', 's'))
			.append(ex('', 'text', 'mid', '아이디를 입력하세요.'))
			.append(ex('이름', 's'))
			.append(ex('', 'text', 'mname', '이름을 입력하세요.'))
			.append(ex('이메일', 's'))
			.append(ex('', 'email', 'memail', '이메일을 입력하세요'))
		
		$div2 = $('<div>').attr('class', 'form-group');
		$div2.append(ex('아이디 찾기', 'button'))
		
		$('#findDiv').append($div1).append($div2)
	})

	$('#idTap').click();
	
	$('#btFindID').click(function(){
		var id = $('#mid').val();
		var email = $('#email').val();
		
		if(id.length<4) alert('아이디를 4글자 이상 입력하세요.');
		else if(email.length == 0) alert('이메일을 입력해주세요');
		else {
			
		}
	})
})