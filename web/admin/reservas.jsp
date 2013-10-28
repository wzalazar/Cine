<%@page import="Datos.DatosReservas"%>
<%@page import="Entidades.Reserva"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="ValidarAdmin.jsp" %>

<%
    DatosReservas oDatosReservas = new DatosReservas();
    Hashtable ListaReservas = oDatosReservas.ListarReservas();    
    Enumeration eReservas = ListaReservas.elements();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %>

       <!-- START OF MAIN CONTENT -->
        <div class="mainwrapper">
            <div class="mainwrapperinner">
              <%@include file="left.jsp" %>
                <div class="maincontent noright">                    
                    <div>
                        <tr>
                            <th class="head0">&nbsp;</th>
                        </tr> 
                    </div>
                    <div class="content">
                        <div class="maincontentinner">
                            <ul class="maintabmenu">
                                <li class="current"></li>
                            </ul><!--maintabmenu-->
                            <div class="content">
                                <div class="contenttitle radiusbottom0">
                                    <h2 class="table"><span>Lista de Reservas</span></h2>
                                </div><!--contenttitle-->              	
                                <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="table2">
                                    <colgroup>
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="head0">ID</th>
                                            <th class="head1">Horario</th>
                                            <th class="head0">Funcion</th>
                                            <th class="head1">Sala</th>
                                            <th class="head0">Pelicula</th>
                                            <th class="head1">Espectador</th>
                                            <th class="head0">Nombre</th>
                                            <th class="head1">Fecha Reserva</th>
                                            <th class="head0">Fecha</th>
                                            <th class="head1">Precio</th>
                                            <th class="head0">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>                                    
                                        <% while (eReservas.hasMoreElements())
                                            {
                                                Reserva aux = (Reserva) eReservas.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdReserva() %></td> 
                                            <td><%=aux.getoFuncion().getoHorario().getHorario() %></td>
                                            <td><%=aux.getoFuncion().getIdFuncion() %></td> 
                                            <td><%=aux.getoFuncion().getoSala().getNombre() %></td> 
                                            <td><%=aux.getoFuncion().getoPelicula().getTitulo() %></td>
                                            <td><%=aux.getoEspectador().getUsuario() %></td>
                                            <td><%=aux.getNombre() %></td>
                                            <td><%=aux.getFecha() %></td> 
                                            <td><%=aux.getoFuncion().getFecha() %></td> 
                                            <td><%=aux.getPrecio() %></td>
                                            <td class="center" style="width: 166px;">                                                
                                                <form action="procesaEliminarReserva.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idreserva" value="<%=aux.getIdReserva() %>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Eliminar</button>
                                                    </p>
                                                </form> 
                                            </td>
                                        </tr> 
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>