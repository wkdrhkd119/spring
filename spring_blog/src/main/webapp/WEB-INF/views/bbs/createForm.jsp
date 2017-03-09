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
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
<script type="text/javascript">
 function incheck(f){
	if(f.wname.value==""){
	alert("이름을 입력하세요");
	f.wname.focus();
	return false;
	}

	if(f.title.value==""){
	alert("제목을 입력하세요");
	f.title.focus();
	return false;
	}
	
	if(f.passwd.value==""){
	alert("암호를 입력하세요");
	f.passwd.focus();
	return false;
	}
 }	
 </script>
</head> 

<body>


 
<DIV class="title">등록</DIV>
 
<FORM name='frm' method='POST' action='./create' enctype="multipart/form-data" onsubmit="return incheck(this)">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <td align="left"><input type="text" name="wname"></td>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <td align="left"><input type="text" name="title"></td>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <td><textarea cols="50" rows="10" name="content"></textarea></td>
    </TR>
    
    <TR>
      <TH>암호</TH>
      <td align="left"><input type="password" name="passwd"></td>
    </TR>
    
    <TR>
      <TH>파일명</TH>
      <td align="left"><input type="file" name="fileMF"></td>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</body>

</html> 
