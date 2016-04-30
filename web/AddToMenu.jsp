<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ page import="process.*" %>
<%
    String addItem = request.getParameter("item");
    String addPrice = request.getParameter("price");
    String sessionVendorString = session.getAttribute("sessionVendor").toString();
    String sessionOutletString = Vendor.getOutletName(sessionVendorString);

    if (addItem == "" || addPrice == "") { %>
<script> alert("Please enter  the details");</script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign In</title>
</head>
<body>
<h1>Hungry Panda</h1>
<center><h2> <a href="VendorHome.jsp"> Home </a></h2>
</center>
</body>
</html>
<%
    } else {
        Vendor.addToMenu(addItem, addPrice, sessionOutletString);
        response.sendRedirect("VendorHome.jsp");
    }
%>
