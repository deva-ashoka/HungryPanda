<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
</head>
<body>
<h1>Hungry Panda</h1>
<center> <h2>Customer - Sign Up</h2>
    <form action="CustomerSignupDetails.jsp" method="post">
        <br/>Name:<input type="text" name="name" required>
        <br/>
        <br/>Username:<input type="text" name="username" required>
        <br/>
        <br/>Password:<input type="password" name="password" required>
        <br/>
        <br/>Mobile Number:<input type="number" name="mobile" required>
        <br/>
        <br/>Room:<input type="text" name="room" required>
        <br/>
        <br/><input type="submit" value="Submit">
    </form>
</center>
</body>
</html>
