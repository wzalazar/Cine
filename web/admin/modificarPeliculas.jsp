<%@page import="Datos.DatosPeliculas"%>
<%@page import="Entidades.Pelicula"%>
<%@page import="Datos.DatosPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosPeliculas oDatosPeliculas;
    Pelicula aux = new Pelicula();
%>



<%
    oDatosPeliculas = new DatosPeliculas();

    try
    {
        aux = oDatosPeliculas.BuscarPelicula(Integer.parseInt(request.getParameter("idpelicula")));        
    }
    catch(Exception ex)
    {
        
    }

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
                    <a href="peliculas.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Modificar pelicula</span></h2>
                                </div>
                                <br>
                                <form action="procesaModificarPelicula.jsp" method="post" class="stdform" id="form1" novalidate="novalidate">
                                    <p>
                                        <label>Titulo</label>
                                        <span class="field"><input type="text" class="longinput" id="firstname" name="titulo" value="<%=aux.getTitulo() %>"></span>
                                        <input type="hidden" class="longinput required" id="firstname" name="idpelicula" value="<%=aux.getIdPelicula() %>">
                                    </p>

                                    <p>
                                        <label>Director</label>
                                        <span class="field"><input type="text" class="longinput required url" id="lastname" name="poster" value="<%=aux.getPoster() %>"></span>
                                    </p>

                                    <p>
                                        <label>Descripcion</label>
                                        <span class="field"><textarea id="location" class="mediuminput required" name="descripcion" rows="5" cols="80" > <%=aux.getDescripcion() %> </textarea></span>
                                    </p>

                                    <p>
                                        <label>Genero</label>
                                        <span class="field"><input type="text" class="longinput required" id="email" name="genero" value="<%=aux.getGenero() %>"></span> 
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
    <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/plugins/error.js"></script>
</html>

