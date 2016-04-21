<%@page import="authenticate.*" %>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8" %>
<%
    String emailCheck = request.getParameter("email");
    String passwordCheck = request.getParameter("password");

    if (emailCheck == "" || passwordCheck == "") { %>
<script> alert("Please enter both the details");</script>
<%
    } else {
        int pass = LoginCheck.checkVendorLogin(emailCheck, passwordCheck);

        if (pass == 1) {
            session.setAttribute("sessionVendor", emailCheck);
            response.sendRedirect("VendorHome.jsp");
        } else
            response.sendRedirect("Error.jsp");
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign In</title>
</head>
<body>
<h1>Hungry Panda</h1>
<center><h2> <a href="VendorLogin.jsp"> Click here to Sign In </a></h2>
</center>
</body>
</html>