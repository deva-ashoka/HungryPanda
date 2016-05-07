<%@page contentType="text/html" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" >
    <link href="css/signInPage.css" rel="stylesheet" >
    <title>Sign In</title>
</head>
<body>
    <div class = "jumbotron">
        <div class = "container">
        <h1>Hungry Panda</h1>
        </div>
        <div class = "nav">

        <center><h2>Customer - Sign In</h2>
            <form method="post" action="CustomerLoginCheck.jsp">
                <br/>Username:<input type="text" name="username">
                <br/>
                <br/>Password:<input type="password" name="password">
                <br/>
                <br/><input type="submit" value="Submit">
                <br/>
                <br/>Not registered? <a href="CustomerSignup.jsp">Sign Up</a>
            </form>
        </center>
        </div>

    </div>

</body>
</html>
