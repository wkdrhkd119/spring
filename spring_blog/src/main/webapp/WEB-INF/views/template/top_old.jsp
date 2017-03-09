<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<style type="text/css">

li#admin{
float:right;
padding-right: 30px
}

ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
.table{
	width: 100%;
} 
.table,.td{
	border-style: none;
}
.img{
	width :100%;
	height :20%;
}
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img class="img" src="${pageContext.request.contextPath}/images/main-03.jpg">
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <ul id="menu">
     <li><a href="${pageContext.request.contextPath }/">홈</a></li> 
     <li><a href="${pageContext.request.contextPath }/memo/list">메모목록</a></li>
     <li><a href="${pageContext.request.contextPath }/memo/create">메모생성</a></li>
     <li><a href="${pageContext.request.contextPath }/address/list">주소목록</a></li>
     <li><a href="${pageContext.request.contextPath }/address/create">주소생성</a></li>
     <li><a href="${pageContext.request.contextPath }/bbs/list">게시판목록</a></li>
     <li><a href="${pageContext.request.contextPath }/bbs/create">글생성</a></li> 
     <li><a href="${pageContext.request.contextPath }/team/list">팀목록</a></li>
     <li><a href="${pageContext.request.contextPath }/team/create">팀생성</a></li>
     <li><a href="${pageContext.request.contextPath }/image/list">이미지목록</a></li>
     <li><a href="${pageContext.request.contextPath }/image/create">이미지생성</a></li>
     
     <c:choose>
     <c:when test="${empty sessionScope.id }">
     <li><a href="${pageContext.request.contextPath }/member/agree">회원가입</a></li>
     <li><a href="${pageContext.request.contextPath }/member/login">로그인</a></li> 
     </c:when>
     
     <c:when test="${not empty sessionScope.id && sessionScope.grade=='H'}">
     <li><a href="${pageContext.request.contextPath}/member/read">나의정보</a></li>
     <li><a href="${pageContext.request.contextPath}/member/update">회원수정</a></li>
     <li><a href="${pageContext.request.contextPath}/member/delete">회원탈퇴</a></li>
     <li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
     </c:when>
     </c:choose>
     
     <c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
     <li id="admin"><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
     <li id="admin"><a href="${pageContext.request.contextPath}/admin/list">회원목록</a></li>
     </c:if>
    
     </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->

<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">