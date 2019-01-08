<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
<c:import url="/WEB-INF/views/common/exFile.jsp" />
<button id="mUpdateMember" onclick="mUpdate();">정보 수정</button>
<script>

function mUpdate() {

   
	        $.ajax({
	            url  : "${pageContext.request.contextPath}/myPage/test.do",
	            dataType: "json",
	            success : function(data){
	                console.log(data);
	        
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	        
	            }
        	});

};

</script>
 asd
</body>
</html>