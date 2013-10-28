<%@page import="Entidades.Espectador"%>
<%@page import="Datos.DatosEspectadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosEspectadores oDatosEspectador;
    Espectador aux = new Espectador();
%>



<%
    oDatosEspectador = new DatosEspectadores();

    try
    {
        aux = oDatosEspectador.BuscarEspectador(Integer.parseInt(request.getParameter("idespectador")));        
    }
    catch (Exception ex)
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
                    <a href="usuarios.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Modificar espectador</span></h2>
                                </div>
                                <br>
                                <form action="procesaModificarUsuario.jsp" method="post" class="stdform" id="form1" novalidate="novalidate">
                                    <p>
                                        <label>Usuario</label>
                                        <span class="field"><input type="text" class="longinput required" id="usuario" name="usuario" value="<%=aux.getUsuario() %>"></span>
                                        <input type="hidden" class="longinput required" id="firstname" name="idespectador" value="<%=aux.getIdEspectador() %>">
                                    </p>
                                    
                                    <p>
                                        <label>Nombre</label>
                                        <span class="field"><input type="text" class="longinput required" id="nombre" name="nombre" value="<%=aux.getNombre() %>"></span>
                                    </p>

                                    <p>
                                        <label>Apellido</label>
                                        <span class="field"><input type="text" class="longinput required" id="apellido" name="apellido" value="<%=aux.getApellido() %>"></span> 
                                    </p>

                                    <p>
                                        <label>DNI</label>
                                        <span class="field"><input type="text" class="longinput required number" id="dni" name="dni" value="<%=aux.getDNI() %>"></span> 
                                    </p>

                                    <p>
                                        <label>Tipo de Usuario</label>
                                        <span class="field">
                                        <select id="selection" name="tipo" class="required">
                                                <option value="<%=aux.getTipo() %>"><%=aux.getTipo() %></option>                                                
                                                <option value="Administrador">Administrador</option>
                                                <option value="Espectador">Espectador</option>                                               
                                        </select>
                                        </span>
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

