<%@page import="Datos.DatosSalas"%>
<%@page session="true" %>
<%@page import="Entidades.Sala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="oSala" class="Entidades.Sala" scope="page"/>

<jsp:setProperty name="oSala" property="nombre" value="<%=request.getParameter(&quot;nombre&quot;)%>"/>
<jsp:setProperty name="oSala" property="filas" value="<%=Integer.parseInt(request.getParameter(&quot;filas&quot;)) %>"/>
<jsp:setProperty name="oSala" property="butacasporfila" value="<%=Integer.parseInt(request.getParameter(&quot;butacasporfila&quot;)) %>"/>


<%!    
DatosSalas oDatosSalas;
%>

<%
    oDatosSalas = new DatosSalas();

    try
    {
        oDatosSalas.AgregarSala(oSala);
        response.sendRedirect("salas.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>        

