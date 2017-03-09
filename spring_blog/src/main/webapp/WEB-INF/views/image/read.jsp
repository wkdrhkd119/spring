<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>

<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
table{
	width:60%;
	margin:auto;
}
table, th, td{
	border:1px solid black;
	border-collapse: collapse;
}
th, td{
	padding:10px;
}
#img{
	width: 400px;
	heigh: 300px;
}
#ftd{
	text-align: center;
}
#img{
	width: 400px;
	heigh: 300px;
}
#ftd{
	text-align: center;
}
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function readGo(no){
	var url = "read";
	url = url +"?no="+no;
	location.href=url;
}
function down(fname){
	var url = "${pageContext.request.contextPath}/download";
	url += "?dir=/image/storage";
	url += "&filename="+fname;	
	
	location.href = url;
	
}
function update(){
	var url= "update";
	url+="?no=${param.no}";		
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+= "&nowPage=${param.nowPage}";
	location.href=url;
}
function reply(){
	var url= "reply";
	url+="?no=${param.no}";		
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+= "&nowPage=${param.nowPage}";
	location.href=url;		
}
function idelete(){
	var url= "delete";
	url+="?no=${param.no}";		
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+= "&nowPage=${param.nowPage}";
	url+= "&oldfile=${dto.fname}";
	location.href=url;
}


</script>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 

  
   
    <table>
    <tr>			
		<td colspan="2" id="ftd">
		<img id="img" src='${pageContext.request.contextPath}/image/storage/${dto.fname}'>
	     </td>
    </tr>
    <TR>
      <TH>제목</TH>
      <TD>${dto.title}</TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD>${dto.content}</TD>
    </TR>
     <TR>
      <TH>성명</TH>
      <TD>${dto.wname}</TD>
    </TR>
     <TR>
      <TH>조회수</TH>
      <TD>${dto.viewcnt}</TD>
    </TR>
     <TR>
      <TH>등록날짜</TH>
      <TD>${fn:substring(dto.wdate,0,10)}</TD>
    </TR>
     <TR>
      <TH>파일</TH>      
       <TD>
       <c:choose>
       		<c:when test="${empty dto.fname}">파일없음</c:when>
       		<c:otherwise>
       		<a href="javascript:down('${dto.fname}')">
		     <span class="glyphicon glyphicon-download-alt"></span>
		     </a> 
       		</c:otherwise>
       </c:choose>
            
      </TD>
    </TR>
  </TABLE>
  <TABLE>
	<TR>
  	<c:set var="files" value="${files}"/>
  	<c:set var="noArr" value="${noArr}"/>
  	<c:forEach var="i" begin="0" end="4">
  	<c:choose>
  		<c:when test="${empty files[i]}">
  		<td><img src="${pageContext.request.contextPath}/image/storage/member.jpg" width="100%"><td>
  		</c:when>
  		<c:otherwise>
  		<c:choose>
  			<c:when test="${noArr[i]==dto.no}">
  			<td class="td_padding"><a href="javascript:readGo('${noArr[i]}')">
		    <img class="curImg" src="${pageContext.request.contextPath}/image/storage/${files[i]}" width="100%" border="0">
		    </a>
		    </td>
  			</c:when>
  			<c:otherwise>
  			<td class="td_padding"><a href="javascript:readGo('${noArr[i]}')">
  			<img src="${pageContext.request.contextPath}/image/storage/${files[i]}" width="100%" border="0">
			</a>
			</td>
  			</c:otherwise>
  		</c:choose>
  		</c:otherwise>
  	</c:choose>
  	</c:forEach>
    </TR>
    </TABLE>
  
  <DIV class='bottom'>   
    <input type='button' value='목록' onclick="location.href='./list'">
    <input type='button' value='수정' onclick="update()">
    <input type='button' value='답변' onclick="reply()">
    <input type='button' value='삭제' onclick="idelete()">
  </DIV>


</body>

</html> 
