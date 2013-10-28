<%@page import="Entidades.Funcion"%>
<%@page import="Datos.DatosFunciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosFunciones oDatosFunciones;    
%>


<%
    oDatosFunciones = new DatosFunciones();

    try
    {        
        oDatosFunciones.EliminarFuncion(Integer.parseInt(request.getParameter("idfuncion")));
        response.sendRedirect("funciones.jsp");
    }
    catch (Exception ex)
    {
        
    }
%>  

