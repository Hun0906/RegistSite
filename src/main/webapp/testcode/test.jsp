<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
<script src ="http://dmaps.daum.net/map_js_init/postcode.vs.js"></script>
<title>Registration Form</title>
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
    function checkDuplicate() {
      // 중복 체크 로직을 구현하세요.
      // 아이디 중복 체크를 진행하고 결과에 따라 사용자에게 알림을 보여줍니다.
    }

    function validateForm() {
      // 폼 유효성 검사 로직을 구현하세요.
      // 필요한 조건에 따라 각 입력 필드를 검사하고 결과에 따라 사용자에게 알림을 보여줍니다.
    }
  </script>
</head>
<body>
	<h1>Registration Form</h1>
	<form name="registrationForm" action="regist_ok.jsp"
		onsubmit="return validateForm()" method="POST">
		<table>
			<tr>
				<td><label for="id">아이디</label></td>
				<td><input type="text" id="id" name="id" required
					pattern="[A-Za-z0-9]{5,8}"
					title="영문자와 숫자로 이루어진 5자리 이상 8자리 이하의 ID를 입력하세요." />
					<button type="button" onclick="checkDuplicate()">중복체크</button></td>


			</tr>
			<tr>
				<td><label for="pwd1">비밀번호</label></td>
				<td><input type="password" id="pwd1" name="pwd1" required /></td>
			</tr>
			<tr>
				<td><label for="pwd2">비밀번호 재확인</label></td>
				<td><input type="password" id="pwd2" name="pwd2" required /></td>
			</tr>
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" id="name" name="name" required /></td>
			</tr>
			<tr>
				<td><label for="gender">성별</label></td>
				<td><input type="radio" id="male" name="gender" value="male"
					required /> <label for="male">남성</label> <input type="radio"
					id="female" name="gender" value="female" required /> <label
					for="female">여성</label></td>
			</tr>
			<tr>
				<td><label for="birthYear">생년월일</label></td>
				<td><select id="birthYear" name="birthYear" required>
						<option value="" disabled selected>년도</option>
						<option value="1990">1990년</option>
						<option value="1991">1991년</option>
						<option value="1992">1992년</option>
						<option value="1993">1993년</option>
						<option value="1994">1994년</option>
						<option value="1995">1995년</option>
						<option value="1996">1996년</option>
						<option value="1997">1997년</option>
						<option value="1998">1998년</option>
						<option value="1999">1999년</option>
						<option value="2000">2000년</option>
						<option value="2001">2001년</option>
						<option value="2002">2002년</option>
						<option value="2003">2003년</option>
						<option value="2004">2004년</option>
						<option value="2005">2005년</option>
						<option value="2006">2006년</option>
						<option value="2007">2007년</option>
						<option value="2008">2008년</option>
						<option value="2009">2009년</option>
						<option value="2010">2010년</option>
				</select> <select id="birthMonth" name="birthMonth" required>
						<option value="" disabled selected>월</option>
						<option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
				</select> <select id="birthDay" name="birthDay" required>
						<option value="" disabled selected>일</option>
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
						<option value="8">8일</option>
						<option value="9">9일</option>
						<option value="10">10일</option>
						<option value="11">11일</option>
						<option value="12">12일</option>
						<option value="13">13일</option>
						<option value="14">14일</option>
						<option value="15">15일</option>
						<option value="16">16일</option>
						<option value="17">17일</option>
						<option value="18">18일</option>
						<option value="19">19일</option>
						<option value="20">20일</option>
						<option value="21">21일</option>
						<option value="22">22일</option>
						<option value="23">23일</option>
						<option value="24">24일</option>
						<option value="25">25일</option>
						<option value="26">26일</option>
						<option value="27">27일</option>
						<option value="28">28일</option>
						<option value="29">29일</option>
						<option value="30">30일</option>
						<option value="31">31일</option>
				</select> <input type="radio" id="solar" name="calendarType" value="solar"
					required /> <label for="solar">양력</label> <input type="radio"
					id="lunar" name="calendarType" value="lunar" required /> <label
					for="lunar">음력</label></td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td><select id="tel1" name="tel1" required>
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
				</select> - <input type="text" id="tel2" name="tel2" required
					pattern="[0-9]{3,4}" title="숫자로 이루어진 3자리 이상 4자리 이하의 전화번호를 입력하세요." />
					 - <input type="text" id="tel3" name="tel3" required
					pattern="[0-9]{4}" title="숫자로 이루어진 4자리의 전화번호를 입력하세요." /></td>
			</tr>
			<tr>
				<td><label for="mobile">휴대폰 번호</label></td>
				<td><select id="mobile1" name="mobile1" required>
							<option>없음</option>
							<option selected value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
				</select> - <input type="text" id="mobile2" name="mobile2" required
					pattern="[0-9]{3,4}" title="숫자로 이루어진 3자리 이상 4자리 이하의 휴대폰 번호를 입력하세요." />
					- <input type="text" id="mobile3" name="mobile3" required
					pattern="[0-9]{4}" title="숫자로 이루어진 4자리의 휴대폰 번호를 입력하세요." /><br><br>
				<input type="checkbox"	name="smssts_yn" value="Y" checked /> 쇼핑몰에서 발송하는 SMS 소식을 수신합니다.</td>	
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td><input size="10px"   type="text" name="email1" /> @ <input  size="10px"  type="text"name="email2" /> 
						  <select name="email2" onChange=""	title="직접입력">
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
							</select><br> <br> <input type="checkbox" name="emailsts_yn" value="Y" checked /> 쇼핑몰에서 발송하는 e-mail을 수신합니다.</td>
				</tr>
			</tr>
			<tr>
				<td><label for="juso">주소</label></td>
				<td>
					  <input type="text" id="zipcode" name="zipcode" size="10" > <a href="javascript:execDaumPostcode()">우편번호검색</a>
					  <br>
					  <p> 
					   지번 주소:<br><input type="text" id="roadAddress"  name="roadAddress" size="50"><br><br>
					  도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50"><br><br>
					  나머지 주소: <input type="text"  name="namujiAddress" size="50" />
					 <!--   <span id="guide" style="color:#999"></span> -->
					   </p>
					</td>
			<tr>
				<td></td>
				<td><input type="submit" value="회원가입" /></td>
			</tr>
		</table>
	</form>
</body>
</html>