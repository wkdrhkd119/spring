<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html> 
<html> 
<head> 

<meta charset="UTF-8"> 
<title></title> 
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
	<c:when test="${flag}">팀정보 등록성공</c:when>
	<c:otherwise>입력실패</c:otherwise>
</c:choose><br>

	<input type="button" value="계속등록" onclick="location.href='./createForm.do'">
	<input type="button" value="목록" onclick="location.href='./list.do'">
</div>

</body> 
</html> 

