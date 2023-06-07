<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        div#wrapper {
            margin: 25px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        header {
            width: 100%;
            height: 150px;
            text-align: center;
            margin-bottom: 10px;
            font-size: 24pt;
            background-color: #CFECEC;
            padding-top: 20px;
        }

        section {
            width: 100%;
            max-width: 1500px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #CFECEC;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <header>회원 리스트</header>
        <section>
            <table>
                <tr>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>출생년도</th>
                    <th>출생월</th>
                    <th>출생일</th>
                    <th>양력/음력</th>
                    <th>폰 번호</th>
                    <th>수신동의</th>
                    <th>이메일</th>
                    <th>수신동의</th>
                    <th>우편번호</th>
                    <th>지번주소</th>
                    <th>도로명주소</th>
                    <th>상세주소</th>
                    <th>가입일자</th>
                </tr>
                <%
                String sql = "SELECT * FROM t_shopping_member";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();

                while(rs.next()){
                    String memberId = rs.getString("member_id");
                    String memberPwd = rs.getString("member_pw");
                    String memberName = rs.getString("member_Name");
                    String memberGen = rs.getString("member_Gender");
                    String birthY = rs.getString("member_birth_y");
                    String birthM = rs.getString("member_birth_m");
                    String birthD = rs.getString("member_birth_d");
                    String birthSl = rs.getString("member_birth_gn");
                    String tel = rs.getString("phone");
                    String smsyn = rs.getString("smssts_yn");
                    String email = rs.getString("email");
                    String esmsyn = rs.getString("emailsts_yn");
                    String post = rs.getString("zipcode");
                    String zibun = rs.getString("jibunaddress");
                    String road = rs.getString("roadaddress");
                    String rest = rs.getString("namujiaddress");
                    String join = rs.getString("joindate");

                %>
                <tr>
                    <td><%=memberId %></td>
                    <td><%=memberPwd %></td>
                    <td><%=memberName %></td>
                    <td><%=memberGen %></td>
                    <td><%=birthY %></td>
                    <td><%=birthM %></td>
                    <td><%=birthD %></td>
                    <td><%=birthSl %></td>
                    <td><%=tel %></td>
                    <td><%=smsyn %></td>
                    <td><%=email %></td>
                    <td><%=esmsyn %></td>
                    <td><%=post %></td>
                    <td><%=zibun %></td>
                    <td><%=road %></td>
                    <td><%=rest %></td>
                    <td><%=join %></td>
                </tr>
                <%} %>
            </table>
        </section>
    </div>
</body>
</html>