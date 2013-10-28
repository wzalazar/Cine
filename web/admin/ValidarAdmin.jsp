<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Validacion.jsp" %>

<%    
    if (!"Administrador".equals(oAdmin.getTipo())) 
    {
        response.sendRedirect("index.jsp");
    }   
%>

