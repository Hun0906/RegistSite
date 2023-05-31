<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>Registration Form(회원가입)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	padding: 5px;
}
</style>
<script>
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}

function fn_overlapped(){
    var _id=$("#_member_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"overlapped.jsp",
       dataType:"json",
       data: {id:_id},
       success:function (data,textStatus){
    	   
    //	   alert(data.result);
    	   
          if(data.result=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_member_id').prop("disabled", true);
       	    $('#member_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>
<script>
    function validateForm() {
        // ID validation
        var id = document.forms["registrationForm"]["id"].value;
        var idRegex = /^[A-Za-z0-9]+$/;
        if (!idRegex.test(id)) {
            alert("ID는 영문자와 숫자만 가능합니다.");
            return false;
        }
        if (id.length < 5 || id.length > 8) {
            alert("ID는 5자리 이상 8자리 이하이어야 합니다.");
            return false;
        }

        // Password validation
        var pwd1 = document.forms["registrationForm"]["pwd1"].value;
        var pwd2 = document.forms["registrationForm"]["pwd2"].value;
        if (pwd1 != pwd2) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        
     	// Name validation
        var name = document.forms["registrationForm"]["name"].value;
        if (name == "") {
            alert("이름을 입력해주세요.");
            return false;
        }
        
        // Gender validation
        var gender = document.forms["registrationForm"]["gender"].value;
        if (gender == "") {
            alert("성별을 선택해주세요.");
            return false;
        }

        // Birth date validation
        var birthYear = document.forms["registrationForm"]["birthYear"].value;
        var birthMonth = document.forms["registrationForm"]["birthMonth"].value;
        var birthDay = document.forms["registrationForm"]["birthDay"].value;
        if (birthYear == "" || birthMonth == "" || birthDay == "") {
            alert("생년월일을 선택해주세요.");
            return false;
        }
        
     	// Lunar or solar validation
        var calendarType = document.forms["registrationForm"]["calendarType"].value;
        if (calendarType == "") {
            alert("양력/음력을 선택해주세요.");
            return false;
        }
    }
</script>
</head>
<body>
	<h3>REGISTRATION FORM</h3>
	<form action="regist_ok.jsp" onsubmit="return validateForm()"
		method="post">
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td><input type="text" name="_member_id" id="_member_id"
							size="20" required pattern="[A-Za-z0-9]{5,8}"
							title="영문자와 숫자로 이루어진 5자리 이상 8자리 이하의 ID를 입력하세요." /> <input
							type="hidden" name="member_id" id="member_id" /> <input
							type="button" id="btnOverlapped" value="중복체크"
							onClick="fn_overlapped()" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td><input name="member_pw" type="password" size="20" required /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호 재확인</td>
						<td><input name="member_confirm_pw" type="password" size="20" required /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이름</td>
						<td><input name="member_name" type="text" size="20" required /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">성별</td>
						<td><input type="radio" name="member_gender" value="102" />
							남자<span style="padding-left: 120px"></span> <input type="radio"
							name="member_gender" value="101" />여자</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">법정생년월일</td>
						<td><select name="member_birth_y">

								<c:forEach var="year" begin="1" end="100">
									<c:choose>
										<c:when test="${year==80}">
											<option value="${ 1920+year}" selected>${ 1920+year}
											</option>
										</c:when>
										<c:otherwise>
											<option value="${ 1920+year}">${ 1920+year}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>

						</select>년 <select name="member_birth_m">
								<c:forEach var="month" begin="1" end="12">
									<c:choose>
										<c:when test="${month==5 }">
											<option value="${month }" selected>${month }</option>
										</c:when>
										<c:otherwise>
											<option value="${month }">${month}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>월 <select name="member_birth_d">
								<c:forEach var="day" begin="1" end="31">
									<c:choose>
										<c:when test="${day==10 }">
											<option value="${day}" selected>${day}</option>
										</c:when>
										<c:otherwise>
											<option value="${day}">${day}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>일 <span style="padding-left: 50px"></span> <input type="radio"
							name="member_birth_gn" value="2" />양력 <span
							style="padding-left: 50px"></span> <input type="radio"
							name="member_birth_gn" value="1" />음력</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">전화번호</td>
						<td><select name="tel1">
								<option>없음</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
								<option value="0508">0508</option>
								<option value="070">070</option>
						</select> - <input size="10px" type="text" name="tel2" required
							pattern="[0-9]{3,4}" title="숫자로 이루어진 3자리 이상 4자리 이하의 전화번호를 입력하세요.">
							- <input size="10px" type="text" name="tel3" required
							pattern="[0-9]{4}" title="숫자로 이루어진 4자리의 전화번호를 입력하세요."></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">휴대폰번호</td>
						<td><select name="hp1">
								<option>없음</option>
								<option selected value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input size="10px" type="text" name="hp2" required
							pattern="[0-9]{3,4}"
							title="숫자로 이루어진 3자리 이상 4자리 이하의 휴대폰 번호를 입력하세요."> - <input
							size="10px" type="text" name="hp3" required pattern="[0-9]{4}"
							title="숫자로 이루어진 4자리의 휴대폰 번호를 입력하세요."><br> <br>
							<input type="checkbox" name="smssts_yn" value="Y" /> 쇼핑몰에서 발송하는
							SMS 소식을 수신합니다.</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이메일<br>(e-mail)
						</td>
						<td><input size="10px" type="text" name="email1" /> @ <input
							size="10px" type="text" name="email2" /> <select name="email2"
							onChange="" title="직접입력">
								<option value="non">직접입력</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="naver.com">naver.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="paran.com">paran.com</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="empal.com">empal.com</option>
								<option value="korea.com">korea.com</option>
								<option value="freechal.com">freechal.com</option>
						</select><br> <br> <input type="checkbox" name="emailsts_yn"
							value="Y" /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td><input type="text" id="zipcode" name="zipcode" size="10">
							<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
							<p>
								지번 주소: <input type="text" id="roadAddress" name="roadAddress" size="50"><br>
								<br> 도로명 주소: <input type="text" id="jibunAddress"
									name="jibunAddress" size="50"><br>
								<br> 나머지 주소: <input type="text" name="namujiAddress"
									size="50" />
								<!--   <span id="guide" style="color:#999"></span> -->
							</p></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="clear">
			<br>
			<br>
			<table align=center>
				<tr>
					<td><input type="submit" value="회원 가입"> <input
						type="reset" value="다시입력"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>