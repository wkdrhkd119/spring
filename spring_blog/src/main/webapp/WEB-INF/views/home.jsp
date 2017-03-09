<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty sessionScope.id}">
	<c:set var="str">spring_mvc 페이지</c:set>
	</c:when>
<c:otherwise>
	<c:set var="str">안녕하세요. ${sessionScope.id}</c:set>
</c:otherwise>
</c:choose>

<c:set var="title"> 여행 블로그</c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
	<c:set var="title">페이지입니다.</c:set>
</c:if>
<html>
<head>
	<title>Home</title>
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<div class="title">${title}</div>

<div class="content">
<P>  The time on the server is ${serverTime}. </P>
<h1>${str}</h1>
<img src="${pageContext.request.contextPath}/images/img.jpg"  width="30%"><br>

<c:choose>
	<c:when test="${empty sessionScope.id}">
	<input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath}/member/login'">
	</c:when>
		<c:otherwise>
		<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/member/logout'">
		</c:otherwise>	
</c:choose>

</div>
</body>
</html>
