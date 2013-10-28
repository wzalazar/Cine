<%@page import="Entidades.Pelicula"%>
<%@page import="Datos.DatosPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oPelicula" class="Entidades.Pelicula" scope="page"/>

<jsp:setProperty name="oPelicula" property="titulo" value="<%=request.getParameter(&quot;titulo&quot;)%>"/>
<jsp:setProperty name="oPelicula" property="poster" value="<%=request.getParameter(&quot;poster&quot;)%>"/>
<jsp:setProperty name="oPelicula" property="descripcion" value="<%=request.getParameter(&quot;descripcion&quot;) %>"/>
<jsp:setProperty name="oPelicula" property="idPelicula" value="<%= Integer.parseInt(request.getParameter(&quot;idpelicula&quot;))%>"/>
<jsp:setProperty name="oPelicula" property="genero" value="<%=request.getParameter(&quot;genero&quot;) %>"/>


<%!    
    DatosPeliculas oDatosPeliculas;
%>



<%
    oDatosPeliculas = new DatosPeliculas();

    try
    {        
        oDatosPeliculas.ModificarPelicula(oPelicula);
        response.sendRedirect("peliculas.jsp");
    }
    catch (Exception ex)
    {
       
    }
%>  