<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp" %>
<%@ page import="process.*" %>
<%
    String check = (String) session.getAttribute("sessionVendor");
    if (check != null) { %>
<%
    String addItem = request.getParameter("item");
    String addPrice = request.getParameter("price");
    String sessionVendorString = (String) session.getAttribute("sessionVendor");
    String sessionOutletString = (String) session.getAttribute("sessionVendorOutletName");

    if (addItem.equals("") || addPrice.equals("")) { %>
<script> alert("Please enter the details");
    history.back();
</script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add to Menu</title>
</head>
<body>
<h1>Hungry Panda</h1>
<center><h2><a href="VendorHome.jsp"> Home </a></h2>
</center>
</body>
</html>
<%
    } else {
        Vendor.addToMenu(addItem, addPrice, sessionOutletString);
        response.sendRedirect("VendorHome.jsp");
    }
%>
<%
} else { %>
<script>
    alert("Please Login");
    window.location = 'VendorLogin.jsp';
</script>
<%
    }
%>