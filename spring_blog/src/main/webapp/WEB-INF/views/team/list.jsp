<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

.div{
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}


.img1{
	width: 90px;
	height: 90px;
	margin-left: 0;
	margin-right: auto;
	display: block;
}

table{
	margin: 0px auto;
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
function del(no,oldfile) {
	if(confirm("삭제 하시겠습니까?")){
		var url = "delete"
		url += "?no=" +no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		url += "&oldfile=" +oldfile;
		location.href=url;
	}
		
}
</script>

</head> 
<body> 

<div class="div">
<div>팀 목록</div>
<form action="./list" method="post">
<select name="col">

	<option value="name"
	<c:if test="${col=='name'}">selected='selected'</c:if>
	>이름</option>
	
	<option value="phone"
	<c:if test="${col=='phone'}">selected='selected'</c:if>
	>전화번호</option>
	
	<option value="skill"
	<c:if test="${col=='skill'}">selected='selected'</c:if>
	>보유기술</option>
	
	<option value="total">전체출력</option>
	
</select>
<input type="text" name="word" value="${word}"> 
<input type="submit" value="검색">
<input type="button" value="등록" onclick="location.href='./create'">
</form>
</div>
<table>
	<tr>
		<th>NO</th>
		<th>NAME</th>
		<th>PHONE</th>
		<th>SKILL</th>
		<th>PICTURE</th>
		<th>수정/삭제</th>
	</tr>
<c:choose>
<c:when test="${fn:length(list)==0 }">
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
		<td>${dto.skillstr}</td>
		<td style="width: 10px;"><img class="img1" src="${pageContext.request.contextPath}/team/storage/${dto.filename}"></td>
		<td>
		<a href="javascript:update('${dto.no}')">수정</a>/
		<a href="javascript:del('${dto.no}','${dto.filename}')">삭제</a>
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

