<%@ page import="process.Vendor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="CustomerOrderConfirm.jsp" method="post">
    <%
        //printing the menu of the selected Outlet
        String selectedOutlet = request.getParameter("selectedOutlet");
        session.setAttribute("sessionSelectedOutlet", selectedOutlet);

        ArrayList itemNames = Vendor.getItemNames(selectedOutlet);
        Iterator<String> itemNameItr = itemNames.iterator();

        ArrayList itemPrices = Vendor.getItemPrices(selectedOutlet);
        Iterator<String> itemPriceItr = itemPrices.iterator();

        while (itemNameItr.hasNext() && itemPriceItr.hasNext()) {
            String itemName = itemNameItr.next();
            String itemPrice = itemPriceItr.next();
            String item = itemName + " - " + "₹" + itemPrice;
    %>
    <!-- to get the tick boxes -->
    <input type="checkbox" name="items" value="<%=itemName%>.<%=itemPrice%>">
    <label for="option-<%=itemName%>.<%=itemPrice%>"> <% out.println(item);%> </label>
    <input type="number" name = "<%=itemName%>">
    <br/>
    <%
        }
    %>
    <input type="submit" value="Place Order">
</form>
</body>
</html>
