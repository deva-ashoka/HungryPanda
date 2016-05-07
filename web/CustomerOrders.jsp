<%@ page import="java.util.ArrayList" %>
<%@ page import="process.Customer" %>
<%@ page import="java.util.Iterator" %><%--
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Orders</title>
</head>
<body>
            <%

                String sessionCustomerUsername = session.getAttribute("sessionCustomer").toString();

                ArrayList<String> outlets = Customer.getCustomersOrdersOutlets(sessionCustomerUsername);
                ArrayList<ArrayList<?>> itemNames = Customer.getCustomerOrdersItemNames(sessionCustomerUsername);
                ArrayList<ArrayList<?>> itemPrices = Customer.getCustomerOrdersItemPrices(sessionCustomerUsername);
                ArrayList<ArrayList<?>> quantity = Customer.getCustomerOrdersQuantity(sessionCustomerUsername);
                ArrayList<ArrayList<?>> itemTotals = Customer.getCustomerOrdersItemTotal(sessionCustomerUsername);
                ArrayList<String> totalBills = Customer.getCustomerOrdersTotalBill(sessionCustomerUsername);

                Iterator<String> outletsItr = outlets.iterator();
                Iterator itemNamesItr = itemNames.iterator();
                Iterator itemPricesItr = itemPrices.iterator();
                Iterator quantityItr = quantity.iterator();
                Iterator itemTotalsItr = itemTotals.iterator();
                Iterator<String> totalBillsItr = totalBills.iterator();

                int orderNumber =1;

                while(outletsItr.hasNext() && itemNamesItr.hasNext() && itemPricesItr.hasNext() && quantityItr.hasNext()
                        && itemTotalsItr.hasNext() && totalBillsItr.hasNext()){
                    out.println(orderNumber + "."); %>
            <br/>
            <%
                String outlet = outletsItr.next();
                out.println("Ordered from Outlet: " + outlet); %>
            <br/>
            <%

                ArrayList<?> namesInEachOrder = (ArrayList<?>)itemNamesItr.next();
                Iterator namesInEachOrderItr = namesInEachOrder.iterator();

                ArrayList<?> pricesInEachOrder = (ArrayList<?>)itemPricesItr.next();
                Iterator pricesInEachOrderItr = pricesInEachOrder.iterator();

                ArrayList<?> quantityInEachOrder = (ArrayList<?>)quantityItr.next();
                Iterator quantityInEachOrderItr = quantityInEachOrder.iterator();

                ArrayList<?> itemTotalInEachOrder = (ArrayList<?>)itemTotalsItr.next();
                Iterator itemTotalInEachOrderItr = itemTotalInEachOrder.iterator();

                while(namesInEachOrderItr.hasNext() && pricesInEachOrderItr.hasNext() && quantityInEachOrderItr.hasNext()
                        && itemTotalInEachOrderItr.hasNext()){
                    String name = namesInEachOrderItr.next().toString();
                    String price = pricesInEachOrderItr.next().toString();
                    String qty = quantityInEachOrderItr.next().toString();
                    String totalForItem = itemTotalInEachOrderItr.next().toString();

                    out.println(name + " - ₹" + price + " :: Quantity = " + qty + " :: Total for " + name + " = ₹" + totalForItem); %>
            <br/>
            <%
                }
                String totalBill = totalBillsItr.next();
                out.println("Total Bill = ₹" + totalBill); %>
            <br/>
            <br/>
            <%
                    orderNumber++;
                }
            %>
</body>
</html>
