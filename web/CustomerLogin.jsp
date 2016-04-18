<%@page contentType="text/html" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign In</title>
</head>
<body>
<h1>Hungry Panda</h1>
<center><h2>Customer - Sign In</h2>
    <form action="CustomerLoginCheck.jsp" method="post">
        <br/>Email:<input type="text" name="email">
        <br/>
        <br/>Password:<input type="password" name="password">
        <br/>
        <br/><input type="submit" value="Submit">
        <br/>
        <br/>Not registered? <a href="CustomerSignup.jsp">Sign Up</a>
    </form>
</center>

</body>
</html>
