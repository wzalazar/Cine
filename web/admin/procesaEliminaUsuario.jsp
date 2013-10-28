<%@page import="Entidades.Espectador"%>
<%@page import="Datos.DatosEspectadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosEspectadores oDatosEspectador;    
%>


<%
    oDatosEspectador = new DatosEspectadores();

    try
    {        
        oDatosEspectador.EliminarEspectador(Integer.parseInt(request.getParameter("idespectador")));
        response.sendRedirect("usuarios.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  
