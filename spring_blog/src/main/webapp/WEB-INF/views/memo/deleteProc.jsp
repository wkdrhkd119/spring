<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mlist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
 font-family: 맑은고딕; 
	  font-size: 20px;
} 

div{
	text-align: center;
	margin-top: 100px;
}
</style> 
</head> 
<body> 

<div>
<c:choose>
	<c:when test="${flag}">삭제성공</c:when>
	<c:otherwise>삭제실패</c:otherwise>
</c:choose>
<input type="button" value="목록" onclick="mlist()">
</div>

</body> 
</html> 
