<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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

div{
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}

table{
	width: 40%;
	margin: 0 auto;
	
}

table, th, td{
	border: 1px solid black;
	border-collapse:  collapse;

}

th, td{
	padding: 3px;
}
a:LINK {
	color: fuchsia;
	text-decoration: none;
}
a:VISITED {
	color: fuchsia;
	text-decoration: none;
}
a:HOVER {
	color: gray;
	text-decoration: none;
}
a:ACTIVE {
	color: buttonshadow;
	text-decoration: none;
}

</style> 

<script type="text/javascript">
function read(no) {
	var url = "read";
	url += "?no=" +no;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}
function update(no) {
	var url = "update";
	url += "?no=" +no;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}
function del(no) {
	if(confirm("삭제 하시겠습니까?")){
		var url = "delete"
		url += "?no=" +no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href=url;
	}
		
}
</script>

</head> 
<body> 

<div>팀 목록</div>
<div class="search">
<form action="./list" method="post">

<select name="col">

	<option value="name"
	<c:if test="${col==name}">selected='selected'</c:if>>이름</option>
	
	
	<option value="phone"
	<c:if test="${col==phone}">selected='selected'</c:if>>핸드폰</option>
	
	<option value="tot">전체출력</option>
	
</select>

<input type="text" name="word" value="${word}">
<input type="submit" value="검색">
</form>
</div>
<table>
	<tr>
		<th>NO</th>
		<th>NAME</th>
		<th>PHONE</th>
		<th>수정/삭제</th>
	</tr>
<c:choose>
<c:when test="${fn:length(list)==0}">
	<tr>
		<td colspan="6" align="center">등록된 정보가 없습니다</td>
	</tr>
</c:when>
<c:otherwise>
	<c:forEach items="${list}" var="dto">

	<tr>
		<td>${dto.no}</td>
		<td><a href="javascript:read('${dto.no}')">${dto.name}</a></td>
		<td>${dto.phone}</td>
		<td>
		<a href="javascript:update('${dto.no}')">수정</a>
		<a href="javascript:del('${dto.no}')">삭제</a>
		</td>
	</tr>

	</c:forEach>
</c:otherwise>
</c:choose>
</table>
<div>
${paging}
</div>

</body> 
</html>

 