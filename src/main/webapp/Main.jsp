<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 300px;
        }

        .login-box h2 {
            margin: 0;
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .login-box input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-box input[type="submit"]:hover {
            background-color: #45a049;
        }

        .login-box .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-box .register-link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .admin-box {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        .admin-box input[type="text"],
        .admin-box input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .admin-box input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .admin-box input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function list() {
            var mgr = "1111";
            var code = document.getElementById("code").value;
            if (code !== mgr) {
                alert("코드 불일치");
                return false; // 폼 제출 막기
            } else {
                window.open("list.jsp", "_blank");
                return true; // 폼 제출 허용
            }
        }

        function openRegistrationForm() {
            window.open("registrationForm.jsp", "_blank");
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h2>로그인</h2>
            <form name="login" action="loginck.jsp" method="post">
                <input type="text" name="ID" placeholder="아이디를 입력하세요" required>
                <input type="password" name="PWD" placeholder="비밀번호를 입력하세요" required>
                <input type="submit" value="로그인">
            </form>
            <div class="register-link">
                <a href="#" onclick="openRegistrationForm()">회원가입</a>
            </div>
        </div>
        <div class="admin-box">
            <h2>[관리자용] 회원 목록</h2>
            <form onsubmit="return list();">
                <input type="text" id="code" name="code" placeholder="관리자 코드를 입력하세요">
                <input type="submit" value="확인">
            </form>
        </div>
    </div>
</body>
</html>
