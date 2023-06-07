<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
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
<style>
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	padding: 5px;
}
</style>
</head>
<body>
	<h1>Registration Form</h1>
	<form name="registrationForm" action="regist_ok.jsp"
		onsubmit="return validateForm()" method="POST">
		<table>
			<tr>
				<td><label for="id">ID:</label></td>
				<td><input type="text" id="id" name="id" required
					pattern="[A-Za-z0-9]{5,8}"
					title="영문자와 숫자로 이루어진 5자리 이상 8자리 이하의 ID를 입력하세요." /></td>
			</tr>
			<tr>
				<td><label for="pwd1">Password:</label></td>
				<td><input type="password" id="pwd1" name="pwd1" required /></td>
			</tr>
			<tr>
				<td><label for="pwd2">Confirm Password:</label></td>
				<td><input type="password" id="pwd2" name="pwd2" required /></td>
			</tr>
			 <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name" required /></td>
            </tr>
			<tr>
				<td><label for="gender">Gender:</label></td>
				<td><input type="radio" id="male" name="gender" value="male"
					required /> <label for="male">male</label> <input type="radio"
					id="female" name="gender" value="female" required /> <label
					for="female">female</label></td>
			</tr>
			 <tr>
                <td><label for="birthdate">Birthdate:</label></td>
                <td>
                    <select id="birthYear" name="birthYear" required>
                        <option value="" disabled selected>Year</option>
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
                    </select>
                    <select id="birthMonth" name="birthMonth" required>
                        <option value="" disabled selected>Month</option>
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
                    </select>
                    <select id="birthDay" name="birthDay" required>
                        <option value="" disabled selected>Day</option>
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
                    </select>
                    <input type="radio" id="solar" name="calendarType" value="solar" required />
                    <label for="solar">양력</label>
                    <input type="radio" id="lunar" name="calendarType" value="lunar" required />
                    <label for="lunar">음력</label>
                </td>
            </tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" value="Register" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
