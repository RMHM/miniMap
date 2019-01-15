$(function(){
	$('#btLogin').click(function(e){
		var result = null;
		
		if($('#mid').val().length<4) {
			alert('아이디를 4자 이상 입력하세요.');
			e.preventDefault();
		}
		else if($('#mpw').val().length<4) {
			alert('비밀번호를 4자 입력하세요');
			e.preventDefault();
		}
	})
	
	$('#btFind').click(function(){
		location.href = "/member/infoFindPage.go";
	})
})

/*

// 구글 소셜 로그인 성공시 실행 되는 함수
function onSignIn(googleUser) {
	// Useful data for your client-side scripts:
	var profile = googleUser.getBasicProfile();
	
	console.log("ID: " + profile.getId());
	
	// Don't send this directly to your server!

	console.log('Full Name: ' + profile.getName());
	console.log('Given Name: ' + profile.getGivenName());
	console.log('Family Name: ' + profile.getFamilyName());
	console.log("Image URL: " + profile.getImageUrl());
	console.log("Email: " + profile.getEmail());
  // The ID token you need to pass to your backend:
	var id_token = googleUser.getAuthResponse().id_token;
	
	console.log("ID Token: " + id_token);
	
//	window.open("/member/googleLogin?gEmail=" + profile.getEmail() + "&gName=" + profile.getName() + "&gImg=" + profile.getImageUrl(),
//			"_blank", "toolbar=no, menubar=no, width=500px, height=550px")
	$form = $('<form>').attr({"method" : "post", "action" : "/member/googleLogin"})
	
	$data1 = $('<input>').attr({"type" : "hidden", "name" : "name", "value" : profile.getName()})
	$data2 = $('<input>').attr({"type" : "hidden", "name" : "img", "value" : profile.getImageUrl()})
	$data3 = $('<input>').attr({"type" : "hidden", "name" : "email", "value" : profile.getEmail()})
	$form.append($data1).append($data2).append($data3);
	$('body').append($form);
	$form.submit();
};
*/