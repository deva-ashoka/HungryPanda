<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
</head>
<body>
<center>
    <h2>
        <% String sessionCustomerString=session.getAttribute("sessionCustomer").toString();
            out.println("Hello "+sessionCustomerString);
        %>
    </h2>
    <br/>
    <a href="Logout.jsp">Logout</a>
</center>
</body>
</html>
