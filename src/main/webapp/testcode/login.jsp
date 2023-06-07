<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function id_validation(user_id) {
		alert(user_id);

		var id_len = user_id.length;

		if (id_len >= 5 && id_len <= 8) {
			//	alert("ok:" + id_len);

			var regex = /^[A-Za-z0-9+]*$/;

			if (regex.test(user_id)) {
				alert('id check pass');
				return true;
			} else {
				document.Registform.user_id.focus();
				alert('id check error');
				return false;
			}

		} else {
			alert("error:" + id_len);

			document.Registform.user_id.focus();
			return false;
		}
	}

	function passid_validation(pwd1, pwd2) {
		alert(pwd1 + ":" + pwd2)

		if ((pwd1.length >= 5 && pwd1.length <= 8) && (pwd1 == pwd2)) {
			return true;
		} else {
			alert("Password should be same!");
			document.Registform.user_pwd1.focus();
			return false;
		}

	}

	function gender_validation(gender) {
		alert(gender);
		return true;
	}

	function validateForm() {
		//console.log('확인');

		var user_id = document.Registform.user_id.value;
		var user_pwd1 = document.Registform.user_pwd1.value;
		var user_pwd2 = document.Registform.user_pwd2.value;
		var user_gender = document.Registform.user_gender.value;

		if (id_validation(user_id)) {
			if (passid_validation(user_pwd1, user_pwd2)) {
				alert('passid_validation true');

				if (gender_validation(user_gender)) {
					alert('gender_validation true');
					return true;
				} else {
					alert('gender_validation false');

					return false;
				}

				return true;
			} else {
				alert('passid_validation false');

				return false;
			}

			alert('id_validation true');
			return true;

		} else {
			alert('id_validation false');
			return false;
		}

		alert('validateForm true');
		return true;
	}
</script>


</head>
<body>
	<h1>회원가입</h1>


	<form name="Registform" action=regist_ok.jsp method=get
		onSubmit="return validateForm();">

		<table border=1>

			<tr>
				<td>User id:<input name=user_id id=user_id value=honggil! />
				</td>
			</tr>
			<tr>
				<td>User pwd:<input name=user_pwd1 id=user_pwd1 value=12345 />
					, confirm <input name=user_pwd2 id=user_pwd2 value=12345 />
				</td>
			</tr>

			<tr>
				<td>Gender:<input type="radio" name="user_gender" value="Male"
					checked /><span>Male</span> , <input type=radio name=user_gender
					value=Female />Female
				</td>
			</tr>


			<tr>
				<td>User name:<input name=user_name id=user_name />
				</td>
			</tr>
		</table>
		<input type=submit value='회원 가입' />

	</form>

</body>
</html>