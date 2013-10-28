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
                    <a href="salas.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Agregue una sala</span></h2>
                                </div>
                                <br>
                                <form action="procesaAgregarSala.jsp" method="post" class="stdform" id="form1" novalidate="novalidate">
                                    <p>
                                        <label>Nombre</label>
                                        <span class="field"><input type="text" class="longinput required" id="nombre" name="nombre"></span>
                                    </p>
                                    <p>
                                        <label>Filas</label>
                                        <span class="field"><input type="text" class="longinput required number" id="filas" name="filas"></span>
                                    </p>
                                    <p>
                                        <label>Butacas Por Fila</label>
                                        <span class="field"><input type="text" class="longinput required number" id="butacasporfila" name="butacasporfila"></span>
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

