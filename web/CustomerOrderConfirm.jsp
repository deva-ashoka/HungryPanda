<%@ page import="process.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="process.Vendor" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="org.bson.BsonReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/customerOrderConfirm.css" rel="stylesheet">
    <title></title>
</head>
<body>
<div class="jumbotron">
    <h1>
        Your Order:
    </h1>
    <div class="container">
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

            String vendorOrderID = "";

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
            Customer.addToCustomerOrders(sessionCustomerUsername, sessionSelectedOutlet, itemNamesOrder, itemPricesOrder, qty, itemTotal, totalBill);
            String customerOrderID = Customer.getLastOrderID(sessionCustomerUsername);

            Vendor.addToVendorOrders(sessionSelectedOutlet, sessionCustomerUsername, customerOrderID, userDetails, itemNamesOrder, itemPricesOrder, qty, itemTotal, totalBill);
             vendorOrderID = Customer.getVendorOrderID(sessionSelectedOutlet, customerOrderID);

            }
        %>
        <br/>
        <br/>
        <%
            out.println("Your total bill is: ₹" + totalBill);
            session.setAttribute("vendorOrderID", vendorOrderID);
        %>
        <br/>
        <br/>
        <!--<form method="post" action="CustomerOrders.jsp">
            <input type="hidden" name="vendorOrderID" value="<%=vendorOrderID%>">
            <input type="submit" value="My Orders Page">
        </form> -->
        <br/>
        <br/>
    </div>
    <h2>Order Successfully placed!</h2>
    <br/>
    <a href="CustomerOrders.jsp"> <h2> My Orders </h2></a>
</div>
</body>
</html>
