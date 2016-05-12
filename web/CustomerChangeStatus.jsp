<%@ page import="process.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp" %>
<%
    String check = (String) session.getAttribute("sessionCustomer");
    if (check != null) { %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<%
    String outletName = request.getParameter("outletName");

    String vendorOrderID = request.getParameter("vendorOrderID");


    Customer.changeStatusInVendorOrdersPage(outletName, vendorOrderID);

    response.sendRedirect("CustomerOrders.jsp");
%>
</body>
</html>
<%
} else { %>
<script>
    alert("Please Login");
    window.location = 'CustomerLogin.jsp';
</script>
<%
    }
%>