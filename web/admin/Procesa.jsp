<%@page import="Datos.DatosReservas"%>
<%@page session="true" %>
<%@page import="Entidades.Espectador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.DatosEspectadores"%>

<jsp:useBean id="oAdmin" class="Entidades.Espectador" scope="session"/>

<jsp:setProperty name="oAdmin" property="usuario" value="<%=request.getParameter(&quot;Usuario&quot;)%>"/>
<jsp:setProperty name="oAdmin" property="password" value="<%=request.getParameter(&quot;Password&quot;)%>"/>

<%!    DatosEspectadores oDatosEspectador;
DatosReservas oDatosReservas;
Espectador aux = null;
%>

<%
    oDatosEspectador = new DatosEspectadores();
    oDatosReservas = new DatosReservas();
    
    try
    {
        aux = oDatosEspectador.Login(oAdmin.getUsuario(), oAdmin.getPassword());

        if ((aux != null) && (aux.getTipo().equals("Administrador")))
        {
            oAdmin.setIdEspectador(aux.getIdEspectador());
            oAdmin.setNombre(aux.getNombre());
            oAdmin.setApellido(aux.getApellido());
            oAdmin.setDNI(aux.getDNI());
            oAdmin.setUsuario(aux.getUsuario());
            oAdmin.setTipo(aux.getTipo());
            oDatosReservas.CaducarReservas();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("Logueado", oAdmin);
            response.sendRedirect("dashboard.jsp");
        }
        else
        {
            oDatosEspectador.Desconectar();
            response.sendRedirect("index.jsp");
        }
    }
    finally
    {
        oDatosEspectador.Desconectar();
    }
%>