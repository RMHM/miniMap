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

function onSignIn(googleUser) {
	// Useful data for your client-side scripts:
	var profile = googleUser.getBasicProfile();
	/*
	console.log("ID: " + profile.getId());
	*/
	// Don't send this directly to your server!
	/*
	console.log('Full Name: ' + profile.getName());
	console.log('Given Name: ' + profile.getGivenName());
	console.log('Family Name: ' + profile.getFamilyName());
	console.log("Image URL: " + profile.getImageUrl());
	console.log("Email: " + profile.getEmail());
	*/
	// The ID token you need to pass to your backend:
	var id_token = googleUser.getAuthResponse().id_token;
	/*
	console.log("ID Token: " + id_token);
	*/
	window.open("/member/googleLogin?gEmail=" + profile.getEmail() + "&gName=" + profile.getName() + "&gImg=" + profile.getImageUrl(),
			"_blank", "toolbar=no, menubar=no, width=500px, height=550px")
	
};
