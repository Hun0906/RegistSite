<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		Connection conn = null;

		String url = "jdbc:mysql://localhost:3306/testexm";
		String id = "root";                     //MySQL에 접속을 위한 계정의 ID
		String pwd = "root";            //MySQL에 접속을 위한 계정의 암호
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);

		out.println("<h1>MySQL DB 연결 성공</h1>");
	
	%>
	
	<table border=1>
	<%
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM emp";
	pstmt = conn.prepareStatement(sql);

	// 4) 실행
	rs = pstmt.executeQuery();

	// 5) 결과를 테이블에 출력
	while (rs.next()) {
		String ename = rs.getString("ename");
		String job = rs.getString("job");
		int mgr = rs.getInt("mgr");
		String hiredate = rs.getString("hiredate");	
		
%>
<tr>
	<td><%=ename%></td>
	<td><%=job%></td>
	<td><%=mgr%></td>	
	<td><%=hiredate%></td>
</tr>
<%
	}
%>

</table>
	
</body>
</html>