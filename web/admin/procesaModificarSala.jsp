<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosSalas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oSala" class="Entidades.Sala" scope="page"/>

<jsp:setProperty name="oSala" property="idSala" value="<%=Integer.parseInt(request.getParameter(&quot;idsala&quot;)) %>"/>
<jsp:setProperty name="oSala" property="nombre" value="<%=request.getParameter(&quot;nombre&quot;)%>"/>


<%!    
    DatosSalas oDatosSalas;
%>



<%
    oDatosSalas = new DatosSalas();

    try
    {        
        oDatosSalas.ModificarSala(oSala);
        response.sendRedirect("salas.jsp");
    }
    catch (Exception ex)
    {
        
    }
%>  