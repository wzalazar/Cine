<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosSalas"%>
<%@page import="Entidades.Espectador"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosEspectadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


<%
    DatosSalas oDatosSalas = new DatosSalas();
    Hashtable ListaSalas = oDatosSalas.ListarSalas();
    Enumeration eSalas = ListaSalas.elements();
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
                    <a href="agregarSalas.jsp" class="stdform"><button class="submit radius2 ">Agregar una sala</button></a>                    
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
                                    <h2 class="table"><span>Lista de Salas</span></h2>
                                </div><!--contenttitle-->              	
                                <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="table2">
                                    <colgroup>
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">
                                        <col class="con0">                                        
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="head0">ID</th>
                                            <th class="head1">Nombre</th>
                                            <th class="head0">Filas</th>                                            
                                            <th class="head0">Butacas por Fila</th>                                            
                                            <th class="head1">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>                                    
                                        <% while (eSalas.hasMoreElements())
                                            {
                                                Sala aux = (Sala) eSalas.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdSala() %></td>
                                            <td><%=aux.getNombre() %></td>                                            
                                            <td><%=aux.getFilas() %></td> 
                                            <td><%=aux.getButacasporfila() %></td> 
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarSalas.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idsala" value="<%=aux.getIdSala() %>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
                                                </form>
                                                    <form action="procesaEliminarSala.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idsala" value="<%=aux.getIdSala() %>">
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
