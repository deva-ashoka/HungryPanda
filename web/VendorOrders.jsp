<%@ page import="com.mongodb.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="process.Vendor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
</head>
<body>
<%
    String sessionVendorString = session.getAttribute("sessionVendor").toString();
    String sessionOutletName = Vendor.getOutletName(sessionVendorString);


    Mongo client = new Mongo();
    DB database = client.getDB("global");
    DBCollection Orders = database.getCollection(sessionOutletName + "Orders");

    DBCursor cursorCustomer = Orders.find();
    DBCursor cursorNames = Orders.find();
    DBCursor cursorPrices = Orders.find();
    DBCursor cursorQuantity = Orders.find();
    DBCursor cursorItemTotal = Orders.find();
    DBCursor cursorTotalBill = Orders.find();


    int orderNumber = 1;

    while (cursorCustomer.hasNext() && cursorNames.hasNext() && cursorPrices.hasNext()
            && cursorQuantity.hasNext() && cursorItemTotal.hasNext() && cursorTotalBill.hasNext()) {
        out.println(orderNumber + "."); %>
<br/>
<%
    String customer = (String) cursorCustomer.next().get("Customer Details");
    ArrayList<?> itemNames = (BasicDBList) cursorNames.next().get("Item Name");
    ArrayList<?> itemPrices = (BasicDBList) cursorPrices.next().get("Item Price");
    ArrayList<?> quantity = (BasicDBList) cursorQuantity.next().get("Quantity");
    ArrayList<?> itemTotal = (BasicDBList) cursorItemTotal.next().get("Item Total");
    String totalBill = cursorTotalBill.next().get("Total Bill").toString();


    out.println("Ordered by: " + customer); %>
<br/>
<%

    for (int i = 0; i < itemNames.size(); i++) {
        out.println(itemNames.get(i) +
                " - ₹" + itemPrices.get(i).toString() +
                " :: Quanttity Ordered = " + quantity.get(i).toString() +
                " :: Total amount for " + itemNames.get(i) + " = ₹" + itemTotal.get(i).toString()); %>
<br/>
<%
    }
    out.println("Total bill for the order = ₹" + totalBill);
    orderNumber++; %>
<br/>
<br/>
<%
    }
%>
</body>
</html>
