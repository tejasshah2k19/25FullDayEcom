<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="x" value="10"></c:set>
	<c:out value="${x}"></c:out>


	<%
	int y = 10;
	%>
	<%=y%>

	<Br><Br>
	<c:forEach var="i" begin="1" end="5" step="1">
		${i}<br> 
	</c:forEach>
	

</body>
</html>