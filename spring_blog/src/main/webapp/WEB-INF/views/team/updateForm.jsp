<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

	fieldset{
	margin: auto;
	}
	
	th,td{
	padding: 3px;
	}
	
	table, tr, td{
	border: 1px solid black;
	border-collapse: collapse;
	left: auto; 	
	}
	
	img{
	width: 300px;
	height: 300px;
	border-radius: 8px;
	
	}
	div{
	text-align: center;
	}
	
</style>
<script type="text/javascript">
function tlist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}


function input(f) {
	/* if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus;
		return false;
	}
	
	if(f.gender[0].checked == false && f.gender[1].checked == false){
		alert("성별을 체크하세요");
		f.gender[0].focus;
		return false;
	}  수정시에는 필요 없음. */ 
	
	if(f.phone.value==""){
		alert("전화번호를 입력하세요");
		f.phone.focus;
		return false;
	}
	
	if(f.zipcode.value==""){
		alert("우편번호를 입력하세요");
		f.zipcode.focus;
		return false;
	}
	
	if(f.address.value==""){
		alert("주소를 입력하세요");
		f.address.focus;
		return false;
	}
	
	if(f.address1.value==""){
		alert("상세주소를 입력하세요");
		f.address1.focus;
		return false;
	}
	
	var cnt = 0;
	for(var i=0; i<f.skill.length; i++){
		if(f.skill[i].checked){
			cnt += 1;
		}
	}
	
	if(cnt==0){
		alert("보유기술을 체크하세요.");
		f.skill[0].focus;
	}
	
	if(f.skill1.selectedIndex == 0){
		alert("취미를 선택하세요.")
		f.skill1.focus;
		return false;
	}
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</head> 
<body>

<fieldset style="width: 35%">
<legend align="center"><h3>나의 팀정보 수정</h3></legend>

<form name="frm" 
	  action="update"  
	  method="post" 
	  onsubmit="return input(this)" 
	  enctype="multipart/form-data">

<input type="hidden" name="no" value="${param.no}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="oldfile" value="${dto.filename}">


<table style="width: 100%">
	<div><img src="${pageContext.request.contextPath}/team/storage/${dto.filename}"></div>
	<tr>
		<th>이름</th>
		<td>${dto.name}</td>
	</tr>
	
	<tr>
		<th>성별</th>
		<td>${dto.gender}</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" value="${dto.phone}"></td>
	</tr>
	
	<tr>
		<th>우편번호</th>
		<td><input type="text" name="zipcode" size="6" maxlength="5" 
				   id="sample6_postcode" placeholder="우편번호" value="${dto.zipcode}">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td><input type="text" name="address1" id="sample6_address" placeholder="주소" value="${dto.address1}"><br>
			<input type="text" name="address2" id="sample6_address2" placeholder="상세주소" value="${dto.address2}">상세주소</td>
	</tr>
	
	<tr>
		<th>보유기술</th>
		<td>
			
			<label><input type="checkbox" name="skill" size="45" value="JSP" 
					<c:if test="${fn:indexOf(dto.skillstr,'JSP')!=-1}">checked="checked"</c:if>
					>JSP</label>
				
			<label><input type="checkbox" name="skill" size="45" value="SQL"
					<c:if test="${fn:indexOf(dto.skillstr,'SQL')!=-1}">checked="checked"</c:if>
					>SQL</label>
					
			<label><input type="checkbox" name="skill" size="45" value="PHP"
					<c:if test="${fn:indexOf(dto.skillstr,'PHP')!=-1}">checked="checked"</c:if>
					>PHP</label>
					
			<label><input type="checkbox" name="skill" size="45" value="JAVA"
					<c:if test="${fn:indexOf(dto.skillstr,'JAVA')!=-1}">checked="checked"</c:if>
					>JAVA</label>
					
			<label><input type="checkbox" name="skill" size="45" value="Spring" 
				   <c:if test="${fn:indexOf(dto.skillstr,'Spring')!=-1}">checked="checked"</c:if>
				   >Spring</label>
		</td> 
	</tr>
	
	<tr>
		<th>취미</th>
		<td><select name="hobby">
			<option>취미를 선택하세요.</option>
			<option value="기술서적읽기">기술서적읽기</option>
			<option value="영화보기">영화보기</option>
			<option value="보드게임">보드게임</option>
			<option value="운동">운동</option>
			</select>
			<script type="text/javascript">
			document.frm.hobby.value='${dto.hobby}';
			</script>
		</td>
			
	</tr>
	
	<tr>
		<th>사진변경</th>
		<td><input type="file" name="fileMF"><br>(${dto.filename})</td>
	</tr>
	
	
	<tr>
		<td align="center"  colspan="2">
		<input type="submit" value="수정">
		<input type="button" value="목록" onclick="tlist()">
		<input type="reset" value="다시입력"></td>
	</tr>
	
</table>
</form>
</fieldset>

</body>
</html> 
