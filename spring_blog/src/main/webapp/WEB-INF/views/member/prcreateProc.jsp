<%@ page contentType="text/html; charset=UTF-8" %> 

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
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">아이디및 이메일 중복</DIV>

<div class="content">
<form  method="post" enctype="multipart/form-data">
${str}
</form>
</div>

<DIV class='bottom'>
<input type='button' value='다시시도' onclick="history.back()">
</DIV>
</body>
</html> 
