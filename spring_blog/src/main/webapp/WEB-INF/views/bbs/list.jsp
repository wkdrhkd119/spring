<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(bbsno) {
	var url = "read"
	url += "?bbsno=" +bbsno;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url
}

function down(filename) {
	var url = "${pageContext.request.contextPath}/download";
	url += "?dir=/bbs/storage";
	url += "&filename=" +filename;
	
	location.href=url;
}

</script>
<style type="text/css"> 

.search{
	width: 100%;
	text-align: center;
	margin: 3px auto;
}

.th{
	text-align: center;
}

table{
	margin: 0 auto;
}
</style> 
</head> 

<body>

<DIV class="title">게시판 목록</DIV>
 
<div class="search">
<form action="./list"  method="post">

<select name="col"><%-- 검색할 컬럼 --%>

	<option value="wname" 
	<c:if test="${col=='wname'}">selected='selected'</c:if>
	>성명</option>
	
	
	<option value="title"
	<c:if test="${col=='title'}">selected='selected'</c:if>
	>제목</option>
		
	<option value="content"
	<c:if test="${col=='content'}">selected='selected'</c:if>
	>내용</option>
	
	<option value="tot">전체출력</option>
</select>

<input type="text" name="word" value="${word}"><%-- 검색어 --%>
<input type="submit" value="검색">
<input type='button' value='등록' onclick="location.href='./create'">
</form>
</div>

  <TABLE class="table" style="width: 50%;">
    <TR>
  
      <TH scope="row" class="th">번호</TH>
      <TH scope="row" class="th">제목</TH>
      <TH scope="row" class="th">성명</TH>
      <TH scope="row" class="th">조회수</TH>
      <TH scope="row" class="th">등록일</TH>
      <TH scope="row" class="th">파일명</TH>
    
    </TR>

<c:choose>

<c:when test="${fn:length(list)==0}">    
	<tr>
	<td colspan="8">등록된 글이 없습니다.</td>
	</tr>
</c:when>

<c:otherwise>
<c:forEach items="${list}" var="dto">

	 <TR>
      <TD>${dto.bbsno}</TD>
      
      <TD align="left">
      <c:forEach begin="1" end="${dto.indent}"> 
	  <c:out value="&nbsp;" escapeXml="false"></c:out>
	  </c:forEach>

	  <c:if test="${dto.indent>0}">[답변]</c:if> <!-- <img src="./img/p.jpg" width="20px" height="20px"> --> 
	  <c:set var="rcount" value="${util:rcount(dto.bbsno,irdao)}"/>
      <a href="javascript:read('${dto.bbsno}')" >
      ${dto.title}
      <c:if test="${rcount>0}"><span style="color:red;">(${rcount})</span></c:if>
      </a>
	
	  <c:if test="${util:newImg(fn:substring(dto.wdate,0,10))}">     
      <img src="${pageContext.request.contextPath}/images/new.gif">
      </c:if>
      </TD>
      
      <TD>${dto.wname}</TD>
	  <TD>${dto.viewcnt}</TD>
      <TD>${fn:substring(dto.wdate,0, 10)}</TD>
     
      <TD>
      <c:choose>
      <c:when test="${empty dto.filename}">파일없음</c:when>
      <c:otherwise>
      <a href="javascript:down('${dto.filename}')">
      <span class='glyphicon glyphicon-save-file'></span>	
      </a>
      </c:otherwise>
      </c:choose>
     </TD>
     
    </TR>
 
</c:forEach> 
</c:otherwise> 
</c:choose>    
  </TABLE>
  
  <DIV class='bottom'>
   ${paging}
  </DIV>


</body>

</html> 
