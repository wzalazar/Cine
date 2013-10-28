<%@page import="Entidades.Reserva"%>
<%@page import="Datos.DatosReservas"%>
<%@page import="Entidades.Funcion"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosFunciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@include file="Validacion.jsp" %>

<link href="css/style_window.css" rel="stylesheet" type="text/css"/>
<link href="css/reserva.css" rel="stylesheet" type="text/css"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/jquery.form.js" type="text/javascript"></script>
<script src="js/plugins/jquery.smartWizard-2.0.min.js" type="text/javascript"></script>


<%
    DatosReservas oDatosReservas = new DatosReservas();
    Hashtable oListaReservas = oDatosReservas.ListarReservasEspectador(oEspectador);
    Enumeration eLista = oListaReservas.elements();
%>


<div id="popup3">
    <div style="margin:0;" class="maincontent">
        <div class="maincontentinner">
            <div class="content1">
                <div class="contenttitle">
                    <h2 id="default" class="form"><span>Lista de mis reservas</span></h2>
                </div>
                <div class="content" style="height: 400px; overflow: auto">
                    <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="table2">
                        <colgroup>
                            <col class="con1">
                            <col class="con0">
                            <col class="con1">
                            <col class="con0">
                            <col class="con1">
                            <col class="con0">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="head0">Nombre de reserva</th>
                                <th class="head1">Sala</th>
                                <th class="head0">Pelicula</th>
                                <th class="head1">Horario</th>
                                <th class="head0">Fecha</th>
                                <th class="head1">Precio</th>
                            </tr>
                        </thead>   

                        <tbody>                             
                            <% while (eLista.hasMoreElements()) {
                                    Reserva aux = (Reserva) eLista.nextElement();
                            %> 
                            <tr id="tr">
                                <td><%=aux.getNombre()%></td> 
                                <td><%=aux.getoFuncion().getoSala().getNombre()%></td>
                                <td><%=aux.getoFuncion().getoPelicula().getTitulo()%></td>
                                <td><%=aux.getoFuncion().getoHorario().getHorario()%></td>
                                <td><%=aux.getoFuncion().getFecha()%></td>
                                <td><%=aux.getPrecio()%></td>
                            </tr> 
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>





