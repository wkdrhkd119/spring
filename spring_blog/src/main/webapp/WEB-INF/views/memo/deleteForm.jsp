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
div{
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}
</style> 
</head> 
<body> 

<div>삭제확인</div>
<form method="post" action="deleteProc.do">
<input type="hidden" name="memono" value="${param.memono}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<div>
삭제를 하명 복구 될 수 없습니다.<br><br>
삭제하시려면 삭제버튼을 클릭하세요.<br>
취소는 '목록'버튼을 누르세요.
<br><br>
<input type="submit" value="삭제처리">
<input type="button" value="목록" onclick="location.href='./list.do'">
</div> 
</form>

</body> 
</html> 