<%@ page import="process.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h2>
    Your Order:
</h2>
<%
    String[] values = request.getParameterValues("items");
    int totalBill = 0;
    if (values != null) {
        for (String val : values) {
            String[] splitNamePrice = val.split("\\.");
            String itemName = splitNamePrice[0];
            String itemPriceString = splitNamePrice[1];
            String quantityString = request.getParameter(itemName);
            int quantity = Integer.parseInt(quantityString);
            int itemPrice = Integer.parseInt(itemPriceString);
            int eachItemTotal = Customer.getEachItemTotal(itemPrice, quantity);
%>
<br/>
<%
            out.println(itemName + " - " + "₹" + itemPrice);
            out.println("Quantity ordered = " + quantity);
            out.println(" Total amount for " + itemName + " = ₹" + eachItemTotal);

            totalBill = Customer.getTotalBill(eachItemTotal);
        }
    }
%>
<br/>
<br/>
<br/>
<%
    out.println("Your total bill is: ₹" + totalBill);
%>
<br/>
<br/>
<br/>
<input type="submit" value="Confirm Order">
</body>
</html>
