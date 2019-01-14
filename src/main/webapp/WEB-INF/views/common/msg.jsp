<%@
	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	alert("${msg}");
	location.href = "${pageContext.request.contextPath}${loc}";
	
	var parent = "${fn:trim(parent)}";
	if(parent != null || parnet.trim() != ""){
		window.opener.location.href=parent;
		self.close();
	}
</script>