
<%@page import="Entidades.Funcion"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosFunciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


<%
    DatosFunciones oDatosFunciones = new DatosFunciones();
    Hashtable ListaFunciones = oDatosFunciones.ListarFunciones();
    Enumeration eFunciones = ListaFunciones.elements();
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
                    <a href="agregarFunciones.jsp" class="stdform"><button class="submit radius2 ">Agregar una funcion</button></a>                    
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
                                    <h2 class="table"><span>Lista de Funciones</span></h2>
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
                                            <th class="head1">Sala</th>
                                            <th class="head0">Pelicula</th>
                                            <th class="head1">Horario</th>
                                            <th class="head0">Fecha</th>
                                            <th class="head0">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>                                    
                                        <% while (eFunciones.hasMoreElements())
                                            {
                                                Funcion aux = (Funcion) eFunciones.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdFuncion() %></td> 
                                            <td><%=aux.getoSala().getNombre() %></td>
                                            <td><%=aux.getoPelicula().getTitulo() %></td> 
                                            <td><%=aux.getoHorario().getHorario() %></td> 
                                            <td><%=aux.getFecha() %></td>
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarFunciones.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idfuncion" value="<%=aux.getIdFuncion()%>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
                                                </form>
                                                    <form action="procesaEliminarFuncion.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idfuncion" value="<%=aux.getIdFuncion() %>">
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
    </body>
</html>