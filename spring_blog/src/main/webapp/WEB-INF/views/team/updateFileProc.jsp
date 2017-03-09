<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%  
	String root = request.getContextPath();
	boolean flag = (Boolean)request.getAttribute("flag");
	
	String col = (String)request.getAttribute("col");
	String word = (String)request.getAttribute("word");
	String nowPage = (String)request.getAttribute("nowPage");
	int no = (Integer)request.getAttribute("no");
	
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function tread() {
	var url = "read.do";
	url += "?no=${no}";
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
	
}

</script>
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 20px; 
} 
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->

<DIV class="title">사진변경</DIV>
 <DIV class="content">

<c:choose>
	<c:when test="${flag}">사진변경</c:when>
	<c:otherwise>변경실패</c:otherwise>
</c:choose> 
 </DIV>

  
  <DIV class='bottom'>
    <input type='button' value='조회' onclick="tread()">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

</body>

</html> 
