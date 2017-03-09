<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String root = request.getContextPath();
	
	String col = (String)request.getAttribute("col");
	String word = (String)request.getAttribute("word");
	int nowPage = (Integer)request.getAttribute("nowPage");


	boolean flag = (Boolean)request.getAttribute("flag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

</style>
<script type="text/javascript">
function blist(){
	var url = "list.do";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href=url;
}
</script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

 
<DIV class="title">처리결과</DIV>
<DIV class="content"></DIV>
<c:choose>
	<c:when test="${flag}">답변 등록 완료</c:when>
	<c:otherwise>답변 등록 실패</c:otherwise>
</c:choose>

 
 <DIV class="bottom">
 	<input class='ct-btn white' type='button' value='계속 등록' onclick="location.href='./createForm.do'">
 	<input class='ct-btn white' type='button' value='목록' onclick="blist()">
 </DIV>

</body>
<!-- *********************************************** -->
</html> 

