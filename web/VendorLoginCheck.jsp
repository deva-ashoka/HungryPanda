<%@page import="login.*"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%
    String emailCheck=request.getParameter("email");
    String passwordCheck=request.getParameter("password");

    int pass = LoginCheck.VendorLoginCheck(emailCheck, passwordCheck);

    if(pass == 1){
        session.setAttribute("sessionVendor",emailCheck);
        response.sendRedirect("VendorHome.jsp");
    }
    else
        response.sendRedirect("Error.jsp");
%>
