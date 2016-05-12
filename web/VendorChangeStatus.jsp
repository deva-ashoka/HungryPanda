<%@ page import="process.Vendor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String customerUsername = request.getParameter("customerUsername");
    //out.println(customerUsername);

    String customerOrderID = request.getParameter("customerOrderID");
    //out.println(customerOrderID);


    Vendor.changeStatusInCustomerMyOrdersPage(customerUsername, customerOrderID);

    response.sendRedirect("VendorOrders.jsp");


%>
</body>
</html>
