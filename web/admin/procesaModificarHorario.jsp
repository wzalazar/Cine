<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Entidades.Horario"%>
<%@page import="Datos.DatosHorarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oHorario" class="Entidades.Horario" scope="page"/>

<jsp:setProperty name="oHorario" property="precio" value="<%=Integer.parseInt(request.getParameter(&quot;precio&quot;)) %>"/>



<%!    
    DatosHorarios oDatosHorarios;
%>



<%
    oDatosHorarios = new DatosHorarios();
    
    String horString = request.getParameter("horario");
    java.sql.Time fecFormatoTime = null;
    SimpleDateFormat sdf = new java.text.SimpleDateFormat("hh:mm:ss", new Locale("es", "ES"));
    fecFormatoTime = new java.sql.Time(sdf.parse(horString).getTime());

    try
    {        
        oHorario.setHorario(fecFormatoTime);
        oDatosHorarios.ModificarHorario(oHorario);
        response.sendRedirect("horarios.jsp");
    }
    catch (Exception ex)
    {
       
    }

%>  