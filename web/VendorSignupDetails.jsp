<%@page contentType="text/html" language="java" pageEncoding="UTF-8"

        import="com.mongodb.*"
        import="java.net.UnknownHostException"
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SignupDetails</title>
</head>
<body>
<%
   // try {
        String nameString = request.getParameter("name");
        String emailString = request.getParameter("email");
        String passwordString = request.getParameter("password");
        String mobileString = request.getParameter("mobile");
        String outletNameString = request.getParameter("outletName");

        Mongo client = new Mongo();
        DB database = client.getDB("Login");
        DBCollection vendorCollection = database.getCollection("Vendors");
        BasicDBObject details = new BasicDBObject("Name", nameString).append("Email", emailString).append("Password", passwordString).append("Mobile", mobileString).append("Outlet", outletNameString);
        vendorCollection.insert(details);

        DBCursor cursor = vendorCollection.find();
        while (cursor.hasNext()) {
            out.println(cursor.next());
        }
        // } catch (Exception e) {
       // e.printStackTrace();
    //}
%>
</body>
</html>