<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%@page import="login.*"%>
<%

   String emailCheck=request.getParameter("email");
    String passwordCheck=request.getParameter("password");

    int pass = LoginCheck.CustomerLoginCheck(emailCheck, passwordCheck);

    if(pass == 1){
        session.setAttribute("sessionCustomer",emailCheck);
        response.sendRedirect("CustomerHome.jsp");
    }
    else
        response.sendRedirect("Error.jsp");
%>
