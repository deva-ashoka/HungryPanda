<%@ page import="process.Customer" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String outletName = request.getParameter("outletName");
    //out.println(outletName);

    String vendorOrderID = request.getParameter("vendorOrderID");
    //out.println(vendorOrderID);


    Customer.changeStatusInVendorOrdersPage(outletName, vendorOrderID);

    response.sendRedirect("CustomerOrders.jsp");
%>
</body>
</html>
