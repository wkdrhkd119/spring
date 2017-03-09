<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function readGo(bbsno){
	var url = "read";
	url = url +"?bbsno="+bbsno;
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}

function down(filename) {
	var url = "${pageContext.request.contextPath}/download";
	url += "?dir=/bbs/storage";
	url += "&filename=" +filename;
	
	location.href=url;
}

function blist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}	

function bupdate() {
	var url = "update";
	url += "?bbsno=${dto.bbsno}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}

function bdelete(bbsno) {
	var url = "delete";
	url += "?bbsno=${dto.bbsno}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	url += "&oldfile=${dto.filename}";
	location.href=url;
}

function breply(bbsno) {
	var url = "reply";
	url += "?bbsno=${dto.bbsno}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}

	//댓글관련 javascript 시작//
	// no  -> bbsno의 값
	// ino -> bbsno의 식별자
	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?no=${dto.bbsno}";
				url = url + "&ino=bbsno";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&bflag=../bbs/read";//로그인 하여 read로 이동
				location.href = url;
			} else {
				tarea.blur();// 포커스 제거
			}
		}
	}

	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?no=${dto.bbsno}";
				url = url + "&ino=bbsno";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&bflag=../bbs/read";
				location.href = url;
				return false;
			} else {

				return false;
			}
		} else if (f.content.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.content.focus();
			return false;
		}
	}
	
	function rupdate(rnum, rcontent) {
		var f = document.rform;
		f.content.value = rcontent;
		f.rnum.value = rnum;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	
	function rdelete(rnum) {
		if (confirm("정말삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?rnum=" + rnum;
			url = url + "&bbsno=${dto.bbsno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
</script>
<style type="text/css"> 

table{
	margin: 0 auto;
}

.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
.rlist{
  line-height:1.2em;
  font-size: 15px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
hr{
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  width: 45%;            /* 화면의 30% */ 
}
</style>  

<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 

  <TABLE style="width: 31%;">
    <TR>
      <TH>제목</TH>
      <TD>${dto.title}</TD>
    </TR>
     
     <TR>
      <TD colspan="2">${dto.content}</TD>
     </TR> 
      
     <TR> 
      <TH>성명</TH>
      <TD>${dto.wname}</TD>
     </TR> 
      
     <TR> 
      <TH>조회수</TH>
      <TD>${dto.wdate}</TD>
     </TR> 
      
     <TR> 
      <TH>등록</TH>
      <TD>${fn:substring(dto.wdate,0, 10)}</TD>
    </TR>
    
    <TR> 
      <TH>파일명</TH>
      <TD>
      <c:choose>
      
      <c:when test="${empty dto.filename}">파일없음</c:when>
      
 	  <c:otherwise>
 	  ${dto.filename}(${dto.filesize div 1024}KB) 
      <a href="javascript:down('${dto.filename}')">
      <span class="glyphicon glyphicon-save"></span></a>
 	  </c:otherwise>
 	  	
   	  </c:choose>
      </TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="location.href='./create'">
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='수정' onclick="bupdate()">
    <input type='button' value='삭제' onclick="bdelete()">
    <input type='button' value='답변' onclick="breply()">
  </DIV>
  
  <hr>
  <c:forEach var="rdto" items="${rlist}">
  <div class="rlist">
   ${rdto.id}<br/>
   <p>${rdto.content}</p>
   ${rdto.regdate}
   <c:if test="${sessionScope.id==rdto.id || sessionScope.grade=='A'}">
   <span style="float: right;">
   <a href="javascript:rupdate('${rdto.rnum}','${rdto.content }')">수정</a>|
   <a href="javascript:rdelete('${rdto.rnum}')">삭제</a>
   </span>
   </c:if>
  </div>
  </c:forEach>
  
  <div class="rcreate">
  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
  <textarea rows="1" cols="37" name="content" onclick="rcheck(this)"></textarea>
  <input type="submit" name="rsubmit" value="등록">
  <input type="hidden" name="bbsno" value="${dto.bbsno}">
  <input type="hidden" name="id" value="${sessionScope.id}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">           
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="rnum" value="0">
  </form>
  </div>
  <c:set var="noArr" value="${noArr}"/>
  <c:forEach var="i" begin="0" end="1">
  <c:choose>
  	<c:when test="${noArr[i]<dto.bbsno}">
  	  <a href="javascript:readGo('${noArr[i]}')">이전글??</a>
  	</c:when>
	<c:otherwise>
	  <a href="javascript:readGo('${noArr[i]}')">다음글</a>
	</c:otherwise>  	
  </c:choose>
  </c:forEach>
  <div class="bottom">
  ${paging}
  </div>

</body>

</html> 
