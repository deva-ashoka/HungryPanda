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
    String roomString = request.getParameter("room");


    Mongo client = new Mongo();
    DB database = client.getDB("Login");
    DBCollection customerCollection = database.getCollection("Customers");
    BasicDBObject details = new BasicDBObject("Name", nameString).append("Email", emailString).append("Password", passwordString).append("Mobile", mobileString).append("Room",roomString);
    customerCollection.insert(details);

    DBCursor cursor = customerCollection.find();
    while (cursor.hasNext()) {
        out.println(cursor.next());
    }
    // } catch (Exception e) {
    // e.printStackTrace();
    //}
%>
</body>
</html>