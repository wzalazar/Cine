<%@page import="Entidades.Horario"%>
<%@page import="Datos.DatosHorarios"%>
<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosSalas"%>
<%@page import="Entidades.Pelicula"%>
<%@page import="Datos.DatosPeliculas"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


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
                                    <h2 class="form"><span>Agregue una funcion</span></h2>
                                </div>
                                <br>
                                <form action="procesaAgregaFuncion.jsp" method="post" class="stdform" id="form1">
                                    <p>
                                        <label>Sala</label>
                                        <span class="field">
                                            <select id="sala" name="sala" class="required">
                                                <option value="">Seleccione una Sala</option>
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
                                            <select id="pelicula" name="pelicula" class="required">
                                                <option value="">Seleccione una Pelicula</option>
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
                                            <select id="selection" name="horario" class="required">
                                                <option value="">Seleccione un Horario</option>
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
                                        <span class="field">
                                            <input type="text"   id="fecha" name="fecha" class="required"/>
                                           
                                    </p>
                                    
                                    <p class="stdform">
                                        <button class="submit submit2 radius2">Agregar</button>
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

