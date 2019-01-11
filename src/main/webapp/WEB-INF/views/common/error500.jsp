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
<title>에러 500페이지</title>
<style>
	img { display : block; margin: 0px auto; }
</style>
</head>
<body>
 <c:import url="/WEB-INF/views/common/exFile.jsp"/>
<div id="wrapper">
 <c:import url="/WEB-INF/views/common/header.jsp"/>
</div>
<br>
<img src="/resources/img/500.jpg" align="center" alt="" />
</body>
</html>