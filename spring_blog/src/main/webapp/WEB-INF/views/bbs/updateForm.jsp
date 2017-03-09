<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
	
	if(CKEDITOR.instances['content'].getData() == ''){
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	}

/* 	if(f.content.value==""){
	alert("내용을 입력하세요");
	f.content.focus();
	return false;
	} */

	if(f.passwd.value==""){
	alert("암호을 입력하세요");
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
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
</head> 
<body>

 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='./update' onsubmit="return incheck(this)" enctype="multipart/form-data" >
<input name="bbsno" type="hidden" value="${dto.bbsno}">
<input name="col" type="hidden" value="${param.col}">
<input name="word" type="hidden" value="${param.word}">
<input name="nowPage" type="hidden" value="${param.nowPage}">
<input name="oldfile" type="hidden" value="${dto.filename}">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" value="${dto.wname}"></TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="${dto.title}"></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><textarea cols="50" rows="10" name="content">${dto.content}></textarea></TD>
    </TR>
    
    <TR>
      <TH>암호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    
    <TR>
      <TH>파일명</TH>
      <TD><input type="file" name="fileMF">(${dto.filename})</TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</body>
</html> 
