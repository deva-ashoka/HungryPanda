<%@ page import="process.Vendor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>


    <%//printing the menu of the selected Outlet
        String selectedOutlet = request.getParameter("selectedOutlet");
        ArrayList printItemNames = new ArrayList();
        ArrayList printMenuPrice = new ArrayList();
        printItemNames = Vendor.getItemNames(selectedOutlet);
        printMenuPrice = Vendor.getItemPrices(selectedOutlet);
        Iterator<String> itemNameItr = printItemNames.iterator();
        Iterator<String> menuPriceItr = printMenuPrice.iterator();%>
    <!-- to get the tick boxes -->

    <form action="CustomerOrderConfirm.jsp" method ="post">
    <%
        int totalOrder=0;
        while (itemNameItr.hasNext() && menuPriceItr.hasNext()) { %>
            <input type="checkbox" name="itemName" value="<%=itemNameItr%>">
        <%
                out.println(itemNameItr.next());
                out.println(" - " + "₹" + menuPriceItr.next());
                %>
        <input type="number" name="quantity" value="" min="1" max="100">
        <br>
        <%
            } %>
        <input type = "submit" value="Place Order">


    </form>



</head>
<body>

</body>
</html>
