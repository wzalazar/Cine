<%@page import="Entidades.Reserva"%>
<%@page import="Datos.DatosReservas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosReservas oDatosReservas;  
%>


<%
    oDatosReservas = new DatosReservas();

    try
    {        
        oDatosReservas.EliminarReserva(Integer.parseInt(request.getParameter("idreserva")));
        response.sendRedirect("reservas.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  

