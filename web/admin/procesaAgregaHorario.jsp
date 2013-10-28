<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Datos.DatosHorarios"%>
<%@page session="true" %>
<%@page import="Entidades.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="oHorario" class="Entidades.Horario" scope="page"/>
<jsp:setProperty name="oHorario" property="precio" value="<%= Integer.parseInt(request.getParameter(&quot;precio&quot;))%>"/>




<%!
    DatosHorarios oDatosHorarios;
%>

<%

    String horString = request.getParameter("horario");
    java.sql.Time fecFormatoTime = null;
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss", new Locale("es", "ES"));
    fecFormatoTime = new java.sql.Time(sdf.parse(horString).getTime());

    oDatosHorarios = new DatosHorarios();
    
    oHorario.setHorario(fecFormatoTime);

    try
    {
        oDatosHorarios.AgregarHorario(oHorario);
        response.sendRedirect("horarios.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>        

