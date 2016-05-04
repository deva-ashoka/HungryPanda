<%@ page import="process.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="process.Vendor" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="org.bson.BsonReader" %>
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
    String sessionSelectedOutlet = session.getAttribute("sessionSelectedOutlet").toString();
    String sessionCustomerUsername = session.getAttribute("sessionCustomer").toString();
    String sessionCustomerName = session.getAttribute("sessionCustomerName").toString();
    String sessionCustomerMobile = session.getAttribute("sessionCustomerMobile").toString();
    String userDetails = sessionCustomerName + ", " + sessionCustomerMobile;

    String[] values = request.getParameterValues("items");
    int totalBill = 0;
    ArrayList<String> itemNamesOrder = new ArrayList();
    ArrayList<Integer> itemPricesOrder = new ArrayList();
    ArrayList<Integer> qty = new ArrayList();
    ArrayList<Integer> itemTotal = new ArrayList();

    if (values != null) {
        for (String val : values) {
            String[] splitNamePrice = val.split("\\.");
            String itemName = splitNamePrice[0];
            String itemPriceString = splitNamePrice[1];
            String quantityString = request.getParameter(itemName);
            int quantity = Integer.parseInt(quantityString);
            int itemPrice = Integer.parseInt(itemPriceString);
            int eachItemTotal = Customer.getEachItemTotal(itemPrice, quantity);
            itemNamesOrder.add(itemName);
            itemPricesOrder.add(itemPrice);
            qty.add(quantity);
            itemTotal.add(eachItemTotal);
%>
<br/>
<%
            out.println(itemName + " - " + "₹" + itemPrice);
            out.println("Quantity ordered = " + quantity);
            out.println(" Total amount for " + itemName + " = ₹" + eachItemTotal);

            totalBill = Customer.getTotalBill(itemTotal);
        }
        Vendor.addToVendorOrders(sessionSelectedOutlet, userDetails, itemNamesOrder, itemPricesOrder, qty, itemTotal, totalBill);
        Customer.addToCustomerOrders(sessionCustomerUsername, sessionSelectedOutlet, itemNamesOrder, itemPricesOrder, qty, itemTotal, totalBill);
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
<h3>Order Successfully placed!</h3>
</body>
</html>
