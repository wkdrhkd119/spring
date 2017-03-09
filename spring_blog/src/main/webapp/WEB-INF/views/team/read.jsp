<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function tlist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}

/* function imgUpdate() {
	var url = "update";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	url += "&no=${dto.no}";
	url += "&oldfile=${dto.filename}";
	location.href=url;
} */
</script>
<style type="text/css"> 

div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table{
	width: 35%;
	margin: auto;
}

table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
}

th, td{
	padding: 10px;
}

img{
	width: 300px;
	height: 300px;
}

#ftd{
	text-align: center;
}
</style> 
</head> 
<body> 

<div>조회</div>
<table>
	<tr>
		<td colspan="2" id="ftd">
		<img src='${pageContext.request.contextPath}/team/storage/${dto.filename}'></td>
	</tr>
		
	<tr>
		<td>이름</td>
		<td>${dto.name}</td>
	</tr>	
	
	<tr>
		<td>성별</td>
		<td>${dto.gender}</td>
	</tr>	
	
	<tr>
		<td>전화번호</td>
		<td>${dto.phone}</td>
	</tr>	
	
	<tr>
		<td>주소</td>
		<td>(우편번호: ${dto.zipcode})
				 	   	 ${dto.address1}
				 		 ${dto.address2}
		</td>
	</tr>	
	
	<tr>
		<td>보유기술</td>
		<td>${dto.skillstr}</td>
	</tr>
	
	<tr>
		<td>취미</td>
		<td>${dto.hobby}</td>
	</tr>
</table>
<div>
	<input type="button"  value="생성" onclick="location.href='./create'">
	<input type="button"  value="목록" onclick="tlist()">
	<input type='button' value='다운로드' 
    onclick="location.href='${pageContext.request.contextPath}/download?dir=/team/storage&filename=${dto.filename}'">
</div>

</body> 
</html> 

