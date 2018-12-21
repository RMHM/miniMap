<%@
   page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>
</head>
<body>
<!-- 아마도 이제 안씀 나중에 정리 -->
   <c:import url="/WEB-INF/views/common/exFile.jsp"/>
   <div id="wrapper">
      <c:import url="/WEB-INF/views/common/header.jsp"/>
      
      <form action="/echo.do" method="post">
		사용자 이름 : <input type="text" name="userName" id="userName"/>
		<input type="submit" value="입장하기"/>
	</form>

      <c:import url="/WEB-INF/views/common/footer.jsp"/>
   </div>
</body>
</html>