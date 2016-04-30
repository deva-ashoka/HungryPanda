<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp" %>
<%@page import="process.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
</head>
<body>
<center>
    <h2>
        <%
            String sessionVendorString = session.getAttribute("sessionVendor").toString();
            out.println("Hello " + sessionVendorString);
            String sessionOutletString = Vendor.getOutletName(sessionVendorString);
        %>
        <br/>
        <br/>
        <form action="AddToMenu.jsp" method="post">
            Item Name:<input type="text" name="item">
            Price:<input type="number" name="price">
            <input type="submit" value="Add">
        </form>
        <br/>
        <%
            ArrayList menuItemNames = Vendor.getItemNames(sessionOutletString);
            Iterator<String> menuItr = menuItemNames.iterator();
            ArrayList menuPrices = Vendor.getItemPrices(sessionOutletString);
            Iterator<String> menuPriceItr = menuPrices.iterator();
            int i = 1;
            while (menuItr.hasNext() && menuPriceItr.hasNext()) {

                    String itemName = menuItr.next();
                    String itemPrice = menuPriceItr.next();
                    String item = itemName + " - " + "₹" + itemPrice;
        %>
        <br/>
        <%
                    out.println(i + " . " + item);
                    i++;
            }
        %>
        <br/>
        <br/>
    </h2>
    <a href="Logout.jsp">Logout</a>
</center>
</body>
</html>
