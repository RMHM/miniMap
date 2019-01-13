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
<title>redirect</title>
</head>
<body>
 <c:import url="/WEB-INF/views/common/exFile.jsp"/>
<div id="wrapper">
 <c:import url="/WEB-INF/views/common/header.jsp"/>
</div>
<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}'; 
alert(message); 
document.location.href = returnUrl; 
</script>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>