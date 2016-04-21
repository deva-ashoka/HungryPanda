<%@page contentType="text/html" language="java" pageEncoding="UTF-8"
        import="authenticate.*"
%>

<%
    String nameString = request.getParameter("name");
    String emailString = request.getParameter("email");
    String passwordString = request.getParameter("password");
    String mobileString = request.getParameter("mobile");
    String roomString = request.getParameter("room");

    if (nameString == "" || emailString == "" || passwordString == "" || mobileString == "" || roomString == "") { %>
<script> alert("Please enter both the details");</script>
<%
    } else {
        SignUp.signUpCustomer(nameString, emailString, passwordString, mobileString, roomString);
    }
%>
