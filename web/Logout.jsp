<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
<% session.removeAttribute("username");
    session.removeAttribute("password");
    session.invalidate();
%>
<h1>Successfully Logged out. Thank You!</h1>
</body>
</html>
