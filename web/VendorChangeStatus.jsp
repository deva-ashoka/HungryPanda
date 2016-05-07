<%@ page import="process.Vendor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String customerUsername = request.getParameter("customerUsername");
    out.println(customerUsername);

    String orderID = request.getParameter("orderID");
    out.println(orderID);


    Vendor.changeStatus(customerUsername, orderID);




%>
</body>
</html>
