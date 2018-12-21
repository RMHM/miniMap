<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<style>

body {
	margin: 0 auto !important;
}

* {
	box-sizing: border-box;
}

td, th{
	padding: 3px 3px;
	text-align: center;
	border-bottom: 1px solid lightgray;
    border-left: 1px solid lightgray;
    font-size: 12px;
}

th {
    font-size: 15px;
    font-weight: bolder;
}

table{
	border: 1px solid lightgray;
	border-radius: 4px;
	border-collapse: collapse;
	width: 100%;
	margin: 0 auto;
}

#tabs {
  overflow: auto;
  width: 100%;
  list-style: none;
  margin: 0;
  margin-left: 30px;
  padding: 0;
}

#tabs li {
    margin: 0;
    padding: 0;
    float: left;
}

#tabs a {
    box-shadow: -4px 0 0 rgba(0, 0, 0, .2);
    background: #ad1c1c;
    background: linear-gradient(220deg, transparent 10px, #ad1c1c 10px);
    text-shadow: 0 1px 0 rgba(0,0,0,.5);
    color: #fff;
    float: left;
    font: bold 12px/35px 'Lucida sans', Arial, Helvetica;
    height: 35px;
    padding: 0 30px;
    text-decoration: none;
}

#tabs a:hover {
    background: #c93434;
    background: linear-gradient(220deg, transparent 10px, #c93434 10px);     
}

#tabs a:focus {
    outline: 0;
}

#tabs #current a {
    background: #fff;
    background: linear-gradient(220deg, transparent 10px, #fff 10px);
    text-shadow: none;    
    color: #333;
}

#content {
    background-color: #fff;
    background-image: linear-gradient(top, #fff, #ddd);
    padding: 30px;
}

/* Remove the rule below if you want the content to be "organic" */
#content div {
    height: auto; 
}

 #all {
	width: 70%;
	margin: 0 auto;
} 

</style>
</head>
<body>
	<!-- 외부 파일 설정 -->
	<c:import url="/views/common/exFile.jsp"/>
	<c:import url="/views/common/header.jsp"/>
	
	<p style="text-align: center; font-size: 25px; font-weight: 600;">관리자 페이지</p> 
	<div id="all">
	
	<ul id="tabs">
	    <li><a href="selectCommonMember.do" title="tab1">일반회원</a></li>
	    <li><a href="#" title="tab2">기업회원</a></li>
	    <li><a href="#" title="tab3">블랙리스트</a></li>    
	</ul>
	
	<div id="content"> 
	    <div id="tab1">
			<table id="mtable">
				<thead>
					<tr>
						<th width="50px" height="25px" style="text-align: center"></th>
						<th>ID</th>
						<th>이름</th>
						<th>이메일</th>
						<th>성별</th>
						<th>나이</th>
						<th>가입일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>				
			</table>
		</div>
	    <div id="tab2">
			<table id="ctable">
				<thead>
					<tr>
						<th width="50px" height="25px" style="text-align: center">					
						</th>
						<th>ID</th>
						<th>기업명</th>
						<th>이메일</th>
						<th>권한여부</th>
						<th>가입일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	    <div id="tab3">
			<table id="btable">
				<thead>
					<tr>
						<th width="50px" height="25px" style="text-align: center"></th>
						<th>ID</th>
						<th>이름</th>
						<th>이메일</th>
						<th>성별</th>
						<th>나이</th>
						<th>상태</th>
						<th>기간</th>
						<th>사유</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>	
			</table>
		</div>
	</div>

	</div>	
</body>
<script>

$(function(){
	
	 $.ajax({
		url : 'member/selectCommonMember.do',
		type : 'get',
		success : function(data){
			
			$table = $('#mtable tbody');
			
			console.log(data);
			
			for(var i in data){
				
				var $tdCheck = $('<td style="text-align: center">').html($('<input type="checkbox" name="chk'+i+'" style="text-align: center;">'));
				var $trBoard = $('<tr>');
				var $tdMid = $('<td>').text(data[i].mid);
				var $tdMname = $('<td>').text(data[i].mname);
				var $tdEmail = $('<td>').text(data[i].email);
				
				if(data[i].gender != null){
					var $tdGender = $('<td>').text(data[i].gender);
				} else {
					var $tdGender = $('<td>').text("-");
				}
				
				if(data[i].age != 0){
					var $tdAge = $('<td>').text(data[i].age);
				} else {
					var $tdAge = $('<td>').text("-");
				}
				
				var $tdJoinDate = $('<td>').text(moment(data[i].joinDate).format('YYYY-MM-DD'));
				
				if(data[i].dropDate == null){
					
					var $tdDropDate = $('<td>').text("정상");		
				} else {
					var $tdDropDate = $('<td>').text("탈퇴");
				}

				
				$trBoard.append($tdCheck).append($tdMid).append($tdMname).append($tdEmail).append($tdGender).append($tdAge)
				.append($tdJoinDate).append($tdDropDate);	
				
				$table.append($trBoard);
				
			} 
			
			$('input[name^=chk]').click(function() {
				if($('input[name^=chk]').is(':checked')==true){
					buttonOn();
				}else{
					buttonOff();
				}
			});
			$('#mtable tbody').children().mouseenter(function () {
				$(this).children().not(':first').css({'background':'#F7D58B', 'cursor':'pointer'});
				$(this).children().not(':first').click(function () {
					var pno = $(this).parent().children().eq(1).text();
				});
					
			}).mouseleave(function () {
				$(this).children().not(':first').css({'background':'white'});
			});
			
			$(document).ready(function() {
			    $("#content div").hide(); // Initially hide all content
			    $("#tabs li:first").attr("id","current"); // Activate first tab
			    $("#content div:first").fadeIn(); // Show first tab content
			    
			    $('#tabs a').click(function(e) {
			        e.preventDefault();        
			        $("#content div").hide(); //Hide all content
			        $("#tabs li").attr("id",""); //Reset id's
			        $(this).parent().attr("id","current"); // Activate this
			        $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
			    });
			})();
			
		}, error : function(data){
			console.log("회원 조회 실패!! \n data : " + data);
		}

	});

});

$(function(){
	
	 $.ajax({
		url : 'member/selectCompanyMember.do',
		type : 'get',
		success : function(data){
			
			$table = $('#ctable tbody');
			
			console.log("company : " + data);
			
			for(var i in data){
				
				var $tdCheck = $('<td style="text-align: center">').html($('<input type="checkbox" name="chk'+i+'" style="text-align: center;">'));
				var $trBoard = $('<tr>');
				var $tdMid = $('<td>').text(data[i].mid);
				var $tdMname = $('<td>').text(data[i].mname);
				var $tdEmail = $('<td>').text(data[i].email);
				var $tdAuthority = $('<td>').text("권한")
				var $tdJoinDate = $('<td>').text(data[i].joinDate);
				
				if(data[i].dropDate == null){
					var $tdDropDate = $('<td>').text("정상");		
				} else {
					var $tdDropDate = $('<td>').text("탈퇴");
				}

				
				$trBoard.append($tdCheck).append($tdMid).append($tdMname).append($tdEmail)
				.append($tdAuthority).append($tdJoinDate).append($tdDropDate);	
				
				$table.append($trBoard);
				
			} 
			
			$('#mtable tbody').children().mouseenter(function () {
				$(this).children().not(':first').css({'background':'#F7D58B', 'cursor':'pointer'});
				$(this).children().not(':first').click(function () {
					var mno = $(this).parent().children().eq(1).text();
				});
					
			}).mouseleave(function () {
				$(this).children().not(':first').css({'background':'white'});
			});
			
			$(document).ready(function() {
			    $("#content div").hide(); // Initially hide all content
			    $("#tabs li:first").attr("id","current"); // Activate first tab
			    $("#content div:first").fadeIn(); // Show first tab content
			    
			    $('#tabs a').click(function(e) {
			        e.preventDefault();        
			        $("#content div").hide(); //Hide all content
			        $("#tabs li").attr("id",""); //Reset id's
			        $(this).parent().attr("id","current"); // Activate this
			        $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
			    });
			})();
			
		}, error : function(data){
			alert("회원 조회 실패!! \n data : " + data);
			console.log(data);
		}

	});

});

</script>

</html>

















