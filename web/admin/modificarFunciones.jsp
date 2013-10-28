<%@page import="Entidades.Horario"%>
<%@page import="Entidades.Pelicula"%>
<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosHorarios"%>
<%@page import="Datos.DatosSalas"%>
<%@page import="Datos.DatosPeliculas"%>
<%@page import="Entidades.Funcion"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosFunciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


<%!    
    DatosFunciones oDatosFunciones;
    Funcion aux = new Funcion();
%>

<%
    DatosPeliculas oDatosPeliculas = new DatosPeliculas();
    DatosSalas oDatosSalas = new DatosSalas();
    DatosHorarios oDatosHorarios = new DatosHorarios();
    Hashtable ListaHorarios = oDatosHorarios.ListarHorarios();
    Hashtable ListaSalas = oDatosSalas.ListarSalas();
    Hashtable ListaPeliculas = oDatosPeliculas.ListarPeliculas();
    Enumeration eHorarios = ListaHorarios.elements();
    Enumeration eSalas = ListaSalas.elements();
    Enumeration ePeliculas = ListaPeliculas.elements();
%>

<%
    oDatosFunciones = new DatosFunciones();

    try
    {
        aux = oDatosFunciones.BuscarFuncion(Integer.parseInt(request.getParameter("idfuncion")));        
    }
    catch(Exception ex)
    {
        
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
        <link rel="stylesheet" href="datapicker/jquery-ui.css" />
        <script src="datapicker/jquery-1.8.2.js"></script>
        <script src="datapicker/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    </head>
    <body>

        <%@include file="header.jsp" %>

        <div class="mainwrapper">
            <div class="mainwrapperinner">

                <%@include file="left.jsp" %>

                <div class="maincontent noright">
                    <a href="funciones.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Modificar Función</span></h2>
                                </div>
                                <br>
                                <form action="procesaModificarFuncion.jsp" method="post" class="stdform" id="form1" novalidate="novalidate">
                                    <p>
                                        <label>Sala</label>
                                        <span class="field">
                                            <select id="selection" name="sala">
                                                <option value="<%=aux.getoSala().getIdSala() %>"><%=aux.getoSala().getNombre() %></option>
                                                <% while (eSalas.hasMoreElements())
                                                    {
                                                        Sala aux = (Sala) eSalas.nextElement();
                                                %>
                                                <option value="<%=aux.getIdSala()%>"><%=aux.getNombre()%></option>
                                                <%}%>
                                            </select>
                                        </span>
                                    </p>
                                    <p>
                                        <label>Pelicula</label>
                                        <span class="field">
                                            <select id="pelicula" name="pelicula">
                                                <option value="<%=aux.getoPelicula().getIdPelicula() %>"><%=aux.getoPelicula().getTitulo() %></option>
                                                <% while (ePeliculas.hasMoreElements())
                                                    {
                                                        Pelicula aux = (Pelicula) ePeliculas.nextElement();
                                                %>
                                                <option value="<%=aux.getIdPelicula()%>"><%=aux.getTitulo()%></option>
                                                <%}%>
                                            </select>
                                        </span>
                                    </p>
                                    <p>
                                        <label>Horario</label>
                                        <span class="field">
                                            <select id="horario" name="horario">
                                                <option value="<%=aux.getoHorario().getHorario() %>"><%=aux.getoHorario().getHorario() %></option>
                                                <% while (eHorarios.hasMoreElements())
                                                    {
                                                        Horario aux = (Horario) eHorarios.nextElement();
                                                %>
                                                <option value="<%=aux.getHorario()%>"><%=aux.getHorario()%></option>
                                                <%}%>
                                            </select>
                                        </span>
                                    </p>
                                    <p>
                                        <label>Fecha</label>
                                        
                                        <span class="field"> <input type="text"   id="fecha" name="fecha" class="required"  value=""/></span>
                                        <input type="hidden" class="longinput" id="firstname" name="idfuncion" value="<%=aux.getIdFuncion() %>">
                                    </p>
                                    
                                    <p class="stdform">
                                        <button class="submit submit2 radius2">Modificar</button>
                                    </p>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </body>
<script type="text/javascript" src="js/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/plugins/error.js"></script>
<script>
$(document).ready(function(){
$('#fecha').datepicker({ dateFormat: "dd-mm-yy",minDate: '+1d' });
});
</script>
</html>

