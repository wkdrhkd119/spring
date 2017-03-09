<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function incheck(f) {
	if(f.passwd.value==""){
		alert("패스워드를 입력하세요");
		f.passwd.focus();
		return false;
	}
}

</script>
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 20px; 
} 
table{
	margin: 0 auto;
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>


 
<DIV class="title">삭제</DIV><br>

<DIV class="content">
<c:choose>
	<c:when test="${flag}">답변있는 글이므로 삭제불가 <br>
	<input type='button' value='목록' onclick='history.go(-2)'>
	</c:when>
<c:otherwise>
<FORM name="frm" method="POST" action="./delete" onsubmit="return incheck(this)">
<input type="hidden" name="bbsno" value="${param.bbsno}">
<input name="nowPage" type="hidden" value="${param.nowPage}">
<input name="oldfile" type="hidden" value="${param.oldfile}">
<input name="col" type="hidden" value="${param.col}">
<input name="word" type="hidden" value="${param.word}">
삭제하면 복구 불가<br>
  <TABLE>
    <TR>
      <TH align="center">패스워드</TH>
    </TR>
    
     <TR>
      <td><input type="password" name="passwd"></td>
     </TR>
  </TABLE><br>
  
  <DIV class='bottom'>
    <input type='submit' value='확인'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</c:otherwise>
</c:choose> 


</DIV>
</body>
</html> 
