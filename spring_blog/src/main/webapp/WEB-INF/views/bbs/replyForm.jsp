<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 18px; 
} 
table{
	margin: 0 auto;
}
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>


 
<DIV class="title">답변</DIV><br>
 
<FORM name='frm' method='POST' action='./reply' enctype="multipart/form-data">

<!-- 답변을 등록하기 위해서 -->
<input type="hidden" value="${dto.grpno}" name="grpno">
<input type="hidden" value="${dto.indent}" name="indent">
<input type="hidden" value="${dto.ansnum}" name="ansnum">

<!-- 페이지와 검색유지를 위해서 -->
<input name="col" type="hidden" value="${param.col}">
<input name="word" type="hidden" value="${param.word}">
<input name="nowPage" type="hidden" value="${param.nowPage}">

<!-- 부모글 삭제를 막기위해서 -->
<input name="bbsno" type="hidden" value="${dto.bbsno}">

  <TABLE>
    <TR>
      <TH>성명</TH>
      <td align="left"><input type="text" name="wname"></td>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <td align="left"><input type="text" name="title" value="${dto.title}"></td>
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
