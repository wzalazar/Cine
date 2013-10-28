<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosSalas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosSalas oDatosSalas;
%>


<%
    oDatosSalas = new DatosSalas();

    try
    {        
        oDatosSalas.EliminarSala(Integer.parseInt(request.getParameter("idsala")));
        response.sendRedirect("salas.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  
