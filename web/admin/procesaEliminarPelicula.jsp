<%@page import="Entidades.Pelicula"%>
<%@page import="Datos.DatosPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosPeliculas oDatosPeliculas;    
%>


<%
    oDatosPeliculas = new DatosPeliculas();

    try
    {        
        oDatosPeliculas.EliminarPelicula(Integer.parseInt(request.getParameter("idpelicula")));
        response.sendRedirect("peliculas.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  

