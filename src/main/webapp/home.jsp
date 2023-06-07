<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<script>
function logout(){
	if(confirm("로그아웃 하시겠습니까?")){
		session.removeAttribute("ID");
		alert("로그아웃 완료");
		return true;
	}else{
		return false;
	}
}
</script>
</head>

<body>
<%
String user = (String)session.getAttribute("ID");
%>
<table style ="text-align:center">
<tr><td><h1 style = "text-align:center"><%=user%>님</h1></td></tr>
<tr><td><a href="Upadte.jsp">회원정보 수정</a></td></tr>
<tr><td><a href="Main.jsp" onclick="return logout();">로그아웃</a></td></tr>
<tr><td><a href="Delete.jsp">회원 탈퇴</a></td></tr>
</table>

</body>
</html>