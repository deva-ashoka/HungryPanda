<%@page contentType="text/html" language="java" pageEncoding="UTF-8"
        import="authenticate.*"
%>

<%
    String nameString = request.getParameter("name");
    String emailString = request.getParameter("email");
    String passwordString = request.getParameter("password");
    String mobileString = request.getParameter("mobile");
    String outletNameString = request.getParameter("outletName");

    if (nameString == "" || emailString == "" || passwordString == "" || mobileString == "" || outletNameString == "") { %>
<script> alert("Please enter all the details");</script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign In</title>
</head>
<body>
<h1>Hungry Panda</h1>
<center><h2> <a href="VendorSignup.jsp"> Click here to Sign Up </a></h2>
</center>
</body>
</html>
<%
} else {
    SignUp.signUpVendor(nameString, emailString, passwordString, mobileString, outletNameString);
    response.sendRedirect("VendorLogin.jsp");
}
%>


