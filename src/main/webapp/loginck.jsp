<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheck</title>
</head>
<body>
	<%
	String loginid = request.getParameter("ID");
	String loginpwd = request.getParameter("PWD");

	String sql = "SELECT member_id, member_pw FROM t_shopping_member WHERE member_id = ? AND member_pw = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, loginid);
	pstmt.setString(2, loginpwd);
	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		session.setAttribute("ID", loginid);
		response.sendRedirect("home.jsp");
	} else {
		out.println("<script>alert('아이디/패스워드가 올바르지 않습니다.'); location.href='Main.jsp';</script>");
	}
	%>
</body>
</html>