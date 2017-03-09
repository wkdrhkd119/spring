<%@ page import="java.awt.print.Printable"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Images - updateProc</title>
<script type="text/javascript">
function blist() {
var url = "list.do";
url += "?col=${col}";
url += "&word=${word}";
url += "&nowPage=${nowPage}";
location.href = url;
}
</script>
<style type="text/css">
* {
font-family: gulim;
font-size: 20px;
}
</style>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">


<DIV class="title">Images - updateProc</DIV>

<div class="content">
<c:choose>
	<c:when test="${not pflag}">패스워드 불일치</c:when>
	<c:when test="${flag}">수정 성공</c:when>
	<c:otherwise>수정 실패</c:otherwise>	
</c:choose>
</div>


<c:choose>
	<c:when test="${not pflag}">
	<DIV class='bottom'>
	<input type='submit' value='재 시도' onclick="history.back()">
	<input type='button' value='목록' onclick="blist()">
	</DIV>
	</c:when>
	<c:otherwise>
	<DIV class='bottom'>
	<input type='submit' value='새글 작성' onclick="location.href='createForm.do'">
	<input type='button' value='목록' onclick="blist()">
	</DIV>
	</c:otherwise>
</c:choose>

</body>

</html>