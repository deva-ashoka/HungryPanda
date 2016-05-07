<%@ page import="process.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" errorPage="Error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" >
    <link href="css/customerHome.css" rel="stylesheet" >
    <title>Home</title>
</head>
<body>
<center>
    <div class = "jumbotron">
        <form action="CustomerOrder.jsp" method="post">
            <h1>
                <%
                    String sessionCustomerString = session.getAttribute("sessionCustomer").toString();
                    String customerName = Customer.getName(sessionCustomerString);
                    String customerMobile = Customer.getMobile(sessionCustomerString);
                    session.setAttribute("sessionCustomerName", customerName);
                    session.setAttribute("sessionCustomerMobile", customerMobile);

                    out.println("Hello " + customerName);
                %>
            </h1>
            <br/>
            <h2>
                Please select the outlet:
            </h2>
            <br/>
            <%
                ArrayList outlets = Customer.getOutlets();
                Iterator<String> outletItr = outlets.iterator();
                int i = 1;
                while (outletItr.hasNext()) {
                    String outlet = outletItr.next();
            %>
            <br/> <input type="submit" name ="selectedOutlet" value="<%=outlet%>">
            <br/>
            <%
                    i++;
                }
            %>
            <br/>
            <a href="CustomerOrders.jsp">My Orders</a>
            <br/>
            <br/>
            <a href="Logout.jsp">Logout</a>
        </form>
    </div>
</center>
</body>
</html>
