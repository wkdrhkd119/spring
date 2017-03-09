<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
div{
text-align: center;
margin-top: 20px;
margin-bottom: 20px
}
	
table{
width: 60%;
margin: 0 auto;
}
	
table, th, td{
border: 1px solid black;
border-collapse: collapse;
}
	
th, td{
padding: 10px;
}
</style> 

<script type="text/javascript">
function mcreate() {
	var url = "create";
	location.href=url;
}

function mupdate(no) {
	var url = "update";
	url += "?no=" +no;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function mdelete(no) {
	var url = "delete";
	url += "?no=" +no;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function mlist(){
	var url= "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
</script>
</head> 
<body> 

<div>조회</div>
<table>
	<tr>
		<th>이름</th>
		<td>${dto.name}</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>${dto.phone}</td>
	</tr>
	
	<tr>
		<th>우편번호</th>
		<td>${dto.zipcode}</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>${dto.address1}<BR>
			${dto.address2}
		</td>
	</tr>
	
	<tr>
		<th>등록일</th>
		<td>${dto.wdate}</td>
	</tr>
</table>

<div>
<input type="button" value="등록" onclick="mcreate()">
<input type="button" value="수정" onclick="mupdate('${dto.no}')">
<input type="button" value="삭제" onclick="mdelete('${dto.no}')">
<input type="button" value="목록" onclick="mlist()">
</div>

</body> 
</html> 



