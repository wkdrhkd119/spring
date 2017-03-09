<%@ page contentType="text/html; charset=UTF-8" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function inCheck(f) {
	if(f.passwd.value==""){
		alert("패스워드를 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("패스워드를 입력하세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호 불일치");
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
</style> 
<link href="${pageContext.request.contextPath}css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">패스워드 변경</DIV>
 
<FORM name='frm' method='POST' action='./updatePw' onsubmit="return inCheck(this)">
<input type="hidden" name="id" value="${param.id}">
  <TABLE>
    <TR>
      <TH>패스원드</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    
    <TR>
      <TH>패스원드 확인</TH>
      <TD><input type="password" name="repasswd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='패스워드 수정'>
    <input type='button' value='취서' onclick="history.back()">
  </DIV>
</FORM>

</body>

</html> 
