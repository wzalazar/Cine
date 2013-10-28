<%@page import="Datos.DatosPeliculas"%>
<%@page session="true" %>
<%@page import="Entidades.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.DatosPeliculas"%>

<jsp:useBean id="oPelicula" class="Entidades.Pelicula" scope="page"/>

<jsp:setProperty name="oPelicula" property="titulo" value="<%=request.getParameter(&quot;titulo&quot;)%>"/>
<jsp:setProperty name="oPelicula" property="descripcion" value="<%=request.getParameter(&quot;descripcion&quot;)%>"/>
<jsp:setProperty name="oPelicula" property="genero" value="<%=request.getParameter(&quot;genero&quot;)%>"/>
<jsp:setProperty name="oPelicula" property="poster" value="<%=request.getParameter(&quot;poster&quot;)%>"/>
<jsp:setProperty name="oPelicula" property="idVideo" value="<%=Integer.parseInt(request.getParameter(&quot;idvideo&quot;))%>"/>


<%!    
DatosPeliculas oDatosPeliculas;
%>

<%
    oDatosPeliculas = new DatosPeliculas();

    try
    {
        oDatosPeliculas.AgregarPelicula(oPelicula);
        response.sendRedirect("peliculas.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>        

