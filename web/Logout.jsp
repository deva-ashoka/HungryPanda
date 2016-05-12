<%@page contentType="text/html" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/logout.css" rel="stylesheet">
    <title>Logout</title>
</head>
<body>
<% session.removeAttribute("username");
    session.removeAttribute("password");
    session.invalidate();
%>
<div class="jumbotron">
    <h1>Successfully Logged out! Thank You!</h1>
    <div>

</body>
</html>
