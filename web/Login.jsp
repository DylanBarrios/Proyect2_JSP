<%-- 
    Document   : Login
    Created on : 9/09/2019, 03:22:48 AM
    Author     : jara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forbe Magazine</title>
        <%
        session.setAttribute("usuario", request.getParameter("nombre"));
        %>
    </head>
    <body id="fondo">
        <div class="col-lg-4 container">
        <h1>Inicio de Sesion!</h1>
        </div>
        <%@include file="html/FormLogin.html" %>
    </body>
</html>
