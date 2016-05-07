<%@ page import="process.Customer" %><%--
  Created by IntelliJ IDEA.
  User: DSV
  Date: 07/05/16
  Time: 7:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String outletName = request.getParameter("outletName");
    out.println(outletName);

    String vendorOrderID = request.getParameter("vendorOrderID");
    out.println(vendorOrderID);


    Customer.changeStatusInVendorDB(outletName, vendorOrderID);
%>
</body>
</html>
