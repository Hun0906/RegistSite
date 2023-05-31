<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration_ok</title>
</head>
<body>
 <h1>Registration Successful</h1>
    <h3>Selected Information:</h3>
    <p>
        ID: <%= request.getParameter("id") %><br/>
        Gender: <%= request.getParameter("gender") %><br/>
        Birth Month: <%= request.getParameter("birthMonth") %><br/>
        Resident Registration Number: <%= request.getParameter("residentNumber") %><br/>
    </p>
</body>
</html>