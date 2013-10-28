<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

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
                    <a href="usuarios.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Agregue un espectador</span></h2>
                                </div>
                                <br>
                                <form action="procesaAgregaUsuario.jsp" method="post" class="stdform" id="form1">
                                    <p>
                                        <label>Usuario</label>
                                        <span class="field"><input type="text" class="longinput required" id="usuario" name="usuario"></span>
                                    </p>

                                    <p>
                                        <label>Password</label>
                                        <span class="field"><input type="password" class="longinput required" id="password" name="password"></span>
                                    </p>

                                    <p>
                                        <label>Nombre</label>
                                        <span class="field"><input type="text" class="longinput required" id="nombre" name="nombre"></span>
                                    </p>

                                    <p>
                                        <label>Apellido</label>
                                        <span class="field"><input type="text" class="longinput required" id="apellido" name="apellido"></span> 
                                    </p>

                                    <p>
                                        <label>DNI</label>
                                        <span class="field"><input type="text" class="longinput required" id="dni" name="dni"></span> 
                                    </p>

                                    <p>
                                        <label>Tipo de Usuario</label>
                                        <span class="field">
                                        <select id="selection" name="tipo" class="required">
                                                <option value="">Seleccione un Tipo</option>                                                
                                                <option value="Administrador">Administrador</option>
                                                <option value="Espectador">Espectador</option>                                               
                                        </select>
                                        </span>
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
<script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/plugins/error.js"></script>
</html>

