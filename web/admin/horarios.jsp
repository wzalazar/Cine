<%@page import="Entidades.Horario"%>
<%@page import="Datos.DatosHorarios"%>
<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosSalas"%>
<%@page import="Entidades.Espectador"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosEspectadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


<%
    DatosHorarios oDatosHorarios = new DatosHorarios();
    Hashtable ListaHorarios = oDatosHorarios.ListarHorarios();
    Enumeration eHorarios = ListaHorarios.elements();
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
                    <a href="agregarHorarios.jsp" class="stdform"><button class="submit radius2 ">Agregar un horario</button></a>                    
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
                                    <h2 class="table"><span>Lista de Horarios</span></h2>
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
                                            <th class="head0">Horario</th>
                                            <th class="head1">Precio</th>                                          
                                            <th class="head1">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>                                    
                                        <% while (eHorarios.hasMoreElements())
                                            {
                                                Horario aux = (Horario) eHorarios.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getHorario()%></td>
                                            <td><%=aux.getPrecio()%></td>
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarHorarios.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idhorario" value="<%=aux.getHorario()%>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
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
