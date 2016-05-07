<%@ page import="process.Vendor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" >
    <link href="css/customerOrder.css" rel="stylesheet" >
    <title></title>
</head>
<body>
    <div class = "jumbotron">
        <div class = "container">
            <h1>Please Order</h1>
            <br/>
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
            <input type="checkbox" name="items" value="<%=itemName%>,<%=itemPrice%>">
            <label for="option-<%=itemName%>.<%=itemPrice%>"> <% out.println(item);%> </label>
            <input type="number" name = "<%=itemName%>" placeholder="Quantity">
            <br/>
            <%
                }
            %>
        </div>
            <input type="submit" value="Place Order">
        </form>
    </div>
</body>
</html>
