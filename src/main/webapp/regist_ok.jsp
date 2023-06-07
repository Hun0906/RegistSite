<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	String year = request.getParameter("member_birth_y");	
	String month = request.getParameter("member_birth_m");	
	String day = request.getParameter("member_birth_d");
	String solu = request.getParameter("member_birth_gn");
	String hp1 = request.getParameter("hp1");	
	String hp2 = request.getParameter("hp2");	
	String hp3 = request.getParameter("hp3");
	String phone = hp1 + "-" + hp2 + "-" + hp3;
	String hpsms = request.getParameter("smssts_yn");	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 +"@"+email2;
	String emailsms = request.getParameter("emailsts_yn");
	String zipcd = request.getParameter("zipcode");
	String zibun = request.getParameter("jibunAddress");
	String road = request.getParameter("roadAddress");
	String extra = request.getParameter("namujiAddress");
	
	//users 테이블이 있어야한다. create table users ....
	String sql = "INSERT INTO t_shopping_member (member_id, member_pw, member_name, member_gender, phone, smssts_yn, email, emailsts_yn, zipcode, roadaddress, jibunaddress, namujiaddress, member_birth_y, member_birth_m, member_birth_d, member_birth_gn) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, uid);
		pstmt.setString(2, pw);
		pstmt.setString(3, new String(name.getBytes("UTF-8"), "UTF-8"));;
		pstmt.setString(4, gender);
		pstmt.setString(5, phone);
		pstmt.setString(6, hpsms);
		pstmt.setString(7, email);
		pstmt.setString(8, emailsms);
		pstmt.setString(9, zipcd);
		pstmt.setString(10, new String(road.getBytes("UTF-8"), "UTF-8"));
		pstmt.setString(11, new String(zibun.getBytes("UTF-8"), "UTF-8"));
		pstmt.setString(12, new String(extra.getBytes("UTF-8"), "UTF-8"));
		pstmt.setString(13, year);
		pstmt.setString(14, month);
		pstmt.setString(15, day);
		pstmt.setString(16,	solu);

		int rows = pstmt.executeUpdate();
		
		out.println("수행된 열수: " + rows);
		

		pstmt.close();

	
%>