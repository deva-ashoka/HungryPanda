<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp" %>
<%@page import="process.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" >
    <link href="css/vendorHome.css" rel="stylesheet" >
    <title>Home</title>
</head>
<body>
<center>
    <div class = "jumbotron">

        <h1>
            <%
                String sessionVendorString = session.getAttribute("sessionVendor").toString();
                String vendorName = Vendor.getVendorName(sessionVendorString);
                String outletName = Vendor.getOutletName(sessionVendorString);
                out.println("Hello " + vendorName);
            %>
            <br/>
            <br/>
            <div class = "container">
            <form action="AddToMenu.jsp" method="post">
                Item Name:<input type="text" name="item">
                Price:<input type="number" name="price">
                <input type="submit" value="Add">
            </form>
            </div>
            <br/>
            <%
                ArrayList menuItemNames = Vendor.getItemNames(outletName);
                Iterator<String> menuItr = menuItemNames.iterator();
                ArrayList menuPrices = Vendor.getItemPrices(outletName);
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
        </h1>
        <h2>
            <a href="VendorOrders.jsp">Orders</a>
            <br/>
            <br/>
            <a href="Logout.jsp">Logout</a>
        </h2>
    </div>
</center>
</body>
</html>
