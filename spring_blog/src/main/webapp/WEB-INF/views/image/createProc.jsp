<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%	
	String root = request.getContextPath();
	boolean flag = (Boolean)request.getAttribute("flag");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: 맑은고딕;
	font-size: 20px;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<DIV class="title">사진등록</DIV>
	<div class="content">
	<c:choose>
		<c:when test="${flag}">등록성공</c:when>
		<c:otherwise>등록실패</c:otherwise>
	</c:choose>
	</div>

	<c:choose>
		<c:when test="${flag}">
		<DIV class='bottom'>
		<input type="button" value='새로운 사진등록' onclick="location.href='./createForm.jsp'"> 
		<input type='button' value='목록' onclick="location.href='./list.do'">
	</DIV>
		</c:when>
		<c:otherwise>
		<DIV class='bottom'>
		<input type="button" value='다시시도' onclick="history.back()"> 
		<input type='button' value='목록' onclick="location.href='./list.do'">
	</DIV>
		
		</c:otherwise>
	</c:choose>

</body>
<!-- *********************************************** -->
</html>
