<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>


<%
	Connection conn = null;

		String url = "jdbc:mysql://localhost:3306/login";
		String id = "root";                     //MySQL에 접속을 위한 계정의 ID
		String pwd = "root";            //MySQL에 접속을 위한 계정의 암호
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pwd);

	//	out.println("<h1>MySQL DB 연결 성공</h1>");
	
		
	String uid = request.getParameter("member_id");
	String pw = request.getParameter("member_pw");
	String name = request.getParameter("member_name");	
	String gender = request.getParameter("member_gender");	
	
	
	
	//users 테이블이 있어야한다. create table users ....
	String sql = "INSERT INTO t_shopping_member(member_id, member_pw, member_name, member_gender)" + "VALUES(?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, uid);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);

		int rows = pstmt.executeUpdate();
		
		out.println("수행된 열수: " + rows);
		

		pstmt.close();

	
%>