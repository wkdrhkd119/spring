<%@ page contentType="text/html; charset=UTF-8" %> 


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>



<script type="text/javascript">

function inputCheck(f) {
if(f.wname.value==""){
alert("이름을 입력하세요.");
f.wname.focus();
return false;
}

if(f.title.value==""){
alert("제목을 입력하세요.");
f.title.focus();
return false;
}

if(f.content.value==""){
alert("내용을 입력하세요.");
f.content.focus();
return false;
}

if(f.passwd.value==""){
alert("비밀번호 확인을 입력하세요.");
f.password.focus();
return false;
}

if(f.repasswd.value==""){
alert("비밀번호 확인을 입력하세요.");
f.repasswd.focus();
return false;
}

if(f.passwd.value!=f.repasswd.value){
alert("비밀번호가 일치하지 않습니다.");
f.passwd.focus();
return false;
}

/* 
if(f.fname.value==""){
alert("사진을 등록하세요.");
f.fname.focus();
return false;
} */

}	

</script>
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 18px; 
} 

table{
margin: 0 auto;
border-collapse: collapse;

}

table, th, td{
border: 1px solid black;
}

.title{
text-align: center;
}

th, td{
text-align: left;
}

.div{
text-align: center;
}
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">사진등록</DIV><br>
 
<FORM name='frm' method='POST' action='./create' onsubmit="return inputCheck(this)" enctype="multipart/form-data">
  <TABLE>
    
    
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="wname" size="15" placeholder="이름"></TD>
      <td>이름을 적어주세요.</td>
    </TR>
    
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="15" placeholder="제목"></TD>
      <td>제목을 적어주세요.</td>
    </TR>
    
    
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="5" cols="40" placeholder="내용" name="content"></textarea></TD>
      <td>내용을 입력하세요.</td>
    </TR>
    
   <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd" size="15" placeholder="패스워드"></TD>
      <td>패스워드를 입력하세요.</td>
    </TR>
    
    <TR>
      <TH>패스워드확인</TH>
      <TD><input type="password" name="repasswd" size="15" placeholder="패스워드 확인"></TD>
      <td>패스워드를 입력하세요.</td>
    </TR>
 
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fnameMF" accept=".jpg,.png,.gif"></TD>
      <td>사진은 JPG,PNG,GIF파일만 올려주세요.</td>
    </TR>
  </TABLE>
  
  <DIV class="div">
    <input type='submit' value='등록'>
    <input type='reset' value='취소' onclick="mlist()">
  </DIV>
</FORM>

</body>

</html> 