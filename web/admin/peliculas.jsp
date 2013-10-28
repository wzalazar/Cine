

<%@page import="Entidades.Pelicula"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%
    Datos.DatosPeliculas oDatosPeliculas = new DatosPeliculas();
    Hashtable ListaPeliculas = oDatosPeliculas.ListarPeliculas();
    Enumeration ePeliculas = ListaPeliculas.elements();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
    </head>
    <body>        

        <%@include file="header.jsp" %>

        <div class="mainwrapper">
            <div class="mainwrapperinner">
              <%@include file="left.jsp" %>
                <div class="maincontent noright">
                    <a href="agregarPeliculas.jsp" class="stdform"><button class="submit radius2 ">Agregar una pelicula</button></a>                    
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
                                    <h2 class="table"><span>Lista de Peliculas</span></h2>
                                </div><!--contenttitle-->              	
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
                                            <th class="head0">ID</th>
                                            <th class="head1">Poster</th>
                                            <th class="head0">Titulo</th>
                                            <th class="head1">Descripcion</th>                                            
                                            <th class="head0">Genero</th> 
                                            <th class="head1">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>
                                        <% while (ePeliculas.hasMoreElements())
                                            {
                                                Pelicula aux = (Pelicula) ePeliculas.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdPelicula()%></td>
                                            <td><img src="<%=aux.getPoster()%>"/></td>
                                            <td><%=aux.getTitulo()%></td>
                                           
                                            <td><%=aux.getDescripcion()%></td>                                            
                                            <td><%=aux.getGenero()%></td>                                            
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarPeliculas.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idpelicula" value="<%=aux.getIdPelicula() %>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
                                                </form>
                                                    <form action="procesaEliminarPelicula.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idpelicula" value="<%=aux.getIdPelicula() %>">
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
