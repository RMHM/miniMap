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
<title>회원 정보 페이지</title>
</head>
<body>
   <c:import url="/WEB-INF/views/common/exFile.jsp"/>
   <div id="wrapper">
      <c:import url="/WEB-INF/views/common/header.jsp"/>
     <form name="memberUpdate" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
     <input type="text" class="form-control" name="mid" id="mid_" value="${member.mid}" readonly required />
     
     </form> 
      <c:import url="/WEB-INF/views/common/footer.jsp"/>
   </div>
</body>
</html>