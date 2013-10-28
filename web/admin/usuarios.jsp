<%@page import="Entidades.Espectador"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosEspectadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


<%
    DatosEspectadores oDatosClientes = new DatosEspectadores();
    Hashtable ListaClientes = oDatosClientes.ListarEspectadores();
    Enumeration eClientes = ListaClientes.elements();
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
                    <a href="agregarUsuarios.jsp" class="stdform"><button class="submit radius2 ">Agregar un espectador</button></a>                    
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
                                    <h2 class="table"><span>Lista de Espectadores</span></h2>
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
                                        <col class="con0">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="head0">ID</th>
                                            <th class="head1">Usuario</th>
                                            <th class="head0">Password</th>
                                            <th class="head1">Nombre</th>
                                            <th class="head0">Apellido</th>
                                            <th class="head1">DNI</th>
                                            <th class="head0">Tipo</th>
                                            <th class="head1">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>                                    
                                        <% while (eClientes.hasMoreElements())
                                            {
                                                Espectador aux = (Espectador) eClientes.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdEspectador()%></td>
                                            <td><%=aux.getUsuario()%></td>
                                            <td><%=aux.getPassword()%></td>
                                            <td><%=aux.getNombre()%></td>
                                            <td><%=aux.getApellido()%></td>
                                            <td><%=aux.getDNI()%></td>
                                            <td><%=aux.getTipo()%></td> 
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarUsuarios.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idespectador" value="<%=aux.getIdEspectador()%>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
                                                </form>
                                                <form action="procesaEliminaUsuario.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idespectador" value="<%=aux.getIdEspectador()%>">
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
        <ul style="z-index: 1; top: 0px; left: 0px; display: none;" aria-activedescendant="ui-active-menuitem" role="listbox" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"></ul>                             
    </body>
</html>