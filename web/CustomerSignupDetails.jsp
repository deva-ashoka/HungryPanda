<%@page contentType="text/html" language="java" pageEncoding="UTF-8"
        import="authenticate.*"
%>

<%
    String nameString = request.getParameter("name");
    String usernameString = request.getParameter("username");
    String passwordString = request.getParameter("password");
    String mobileString = request.getParameter("mobile");
    String roomString = request.getParameter("room");

    if (SignUp.customerUsernameAlreadyExists(usernameString)){ %>
<script>
    alert("Username already exists, please try with a different username");
    window.location = 'CustomerSignup.jsp';
</script>
<%
    }
    else {
        SignUp.signUpCustomer(nameString, usernameString, passwordString, mobileString, roomString); %>
<script>
    alert("Thank You for Registering with HungryPanda");
    window.location = 'CustomerLogin.jsp';
</script>
<%
    }
%>
