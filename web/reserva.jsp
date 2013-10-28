<%@page import="Entidades.Funcion"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosFunciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Validacion.jsp" %>

<%
            DatosFunciones oDatosFunciones = new DatosFunciones();
            Hashtable ListaFunciones = oDatosFunciones.ListarFuncionesPeliculaId(Integer.parseInt(request.getParameter("id")));
            Enumeration eFunciones = ListaFunciones.elements();
            int idPelicula = Integer.parseInt(request.getParameter("id"));
            int filas = 0;
            int butacas = 0;
            String titulo = "titulo";
            String poster = "titulo";
            String descripcion = "titulo";
            String genero = "titulo";
%>

<link href="css/style_window.css" rel="stylesheet" type="text/css"/>
<link href="css/reserva.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.form.js" type="text/javascript"></script>
<script src="js/plugins/jquery.smartWizard-2.0.min.js" type="text/javascript"></script>

<div id="popup2">
    <div class="maincontent" style="margin:0; visibility: hidden; width: 0px; height: 0px;">
        <div class="maincontentinner">
            <div class="content1">
                <div class="contenttitle">
                    <h2 class="form" id="default"><span>LLene el formulario para hacer una reserva</span></h2>
                </div>
                <br />
                <br />
                <form  method="post"  id="formAjaxSala" action="ajaxSala.jsp" class="stdform stdform2" style="position:relative; height:600px !important">

                    <div class="wizard" id="wizard">
                        <ul class="hormenu">
                            <li> <a href="#wiz1step1"> <span class="h2">PASO 1</span> <span class="dot"><span></span></span> <span class="label">SELECCIONAR FUNCION</span> </a> </li>
                            <li> <a href="#wiz1step2"> <span class="h2">PASO 2</span> <span class="dot"><span></span></span> <span class="label">SELECCIONAR BUTACA</span> </a> </li>
                            <li> <a href="#wiz1step3"> <span class="h2">PASO 3</span> <span class="dot"><span></span></span> <span class="label">CONFIRMAR RESERVA</span> </a> </li>
                        </ul>
                        <br clear="all">
                        <br>
                        <br>
                        <div class="formwiz" id="wiz1step1">
                            <h2>PASO 1: SELECCIONAR FUNCION</h2>
                            <br>
                            <div class="content">
                                <div class="maincontentinner">
                                    <div id="ajax"></div>
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
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th class="head1">Sala</th>
                                                    <th class="head0">Pelicula</th>
                                                    <th class="head1">Horario</th>
                                                    <th class="head0">Fecha</th>
                                                    <th class="head1">Precio</th>
                                                    <th class="head0">Opcion</th>
                                                </tr>
                                            </thead>   

                                            <tbody>                                
                                                <% while (eFunciones.hasMoreElements()) {
                                                                Funcion aux = (Funcion) eFunciones.nextElement();
                                                                filas = aux.getoSala().getFilas();
                                                                butacas = aux.getoSala().getButacasporfila();
                                                                titulo = aux.getoPelicula().getTitulo();
                                                                poster = aux.getoPelicula().getPoster();
                                                                descripcion = aux.getoPelicula().getDescripcion();
                                                                genero = aux.getoPelicula().getGenero();
                                                %>
                                                <tr id="tr<%= aux.getIdFuncion()%>">
                                                    <td><%=aux.getoSala().getNombre()%></td>
                                                    <td><%=aux.getoPelicula().getTitulo()%></td> 
                                                    <td><%=aux.getoHorario().getHorario()%></td> 
                                                    <td><%=aux.getFecha()%></td>
                                                    <td><%=aux.getoHorario().getPrecio()%></td>
                                                    <td class="center">
                                                        <img id="loadingFunciones" src="images/loader3.gif"/><input style="display:none" type="radio" class="mostarFuncion"  name="idfuncion" id="<%=aux.getoSala().getIdSala()%>" value="<%= aux.getIdFuncion()%>">
                                                        <input style="display:none" type="submit" id="elegir" value="Elegir"/>
                                                    </td>
                                                </tr> 
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="formwiz" id="wiz1step2">
                            <h2>PASO 2: ELEGIR BUTACA</h2>
                            <br>
                            <div id="ajaxDisplay"></div>
                        </div>

                        <div id="wiz1step3">

                            <div class="par terms">
                                <div class="boxed-container">
                                    <div class="boxed three columns alpha" style="float: left;margin-left: 0; width: 570px;">
                                        <div class="boxed-content" style="background-color: white; padding-top: 3px; height: 390px"><img height="135" class="imgopacity" alt="" src="<%= poster%>"/>
                                            <h3 class="titleUppercase"><%= genero%></h3>
                                            <div class="sep"><span class="sep2"></span></div>
                                            <p> <%= titulo%> </p>
                                            <table>
                                                <tr>
                                                    <th class="head1">Sala</th>
                                                    <th class="head0">Pelicula</th>
                                                    <th class="head1">Horario</th>
                                                    <th class="head0">Fecha</th>
                                                    <th class="head1">Precio</th>
                                                </tr></div>

                                        <tbody id="reserva-confimacion">
                                        </tbody>
                                        </table>                                        
                                        <div id="mostrartasientos">
                                            Asientos:&nbsp;&nbsp;&nbsp;
                                            <select id="selectmostrartasientos" style="margin-top: -10px;padding: 5px !important; height: 30px;">
                                            </select>
                                        </div>
                                        <div id="error_reserva"></div>
                                    </div>
                                </div>
                                <div style="float:left;width: 390px;">
                                    <div style="height: 183px; margin-bottom: 5px;overflow: hidden;">
                                        <p><%= descripcion%></p>
                                    </div>
                                    <div>
                                        <h2 style="  font-size: 16px;   left: 42px;  position: relative;   top: 30px;">PASO 3: ¡CONFIRME SU RESERVA!</h2>
                                        <p style="left: 42px; top: 20px; position: relative;">Indique un nombre para la reserva: </p><input style="margin-left: 42px; margin-top: 15px;" type="text" name="nombreReserva" id="nombreReserva" />
                                        <div id="ajaxReserva"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--#wiz1step3--> 

                    </div>
                    <!--#wizard-->
                    <input type="hidden" id="inputIdSala" name="idSala" value="" />
                    <input type="hidden" name="id" value="<%= idPelicula%>" />
                </form>
            </div>  
            <form id="guardarReserva" action="procesaAgregaReserva.jsp" method="post">
                <input type="hidden" name="ReservaNombre" id="ReservaNombre" value="" />
                <input type="hidden" name="ReservaIdFucion" id="ReservaIdFucion" value="0" />
                <input type="hidden" name="ReservaIdCliente" id="ReservaIdCliente" value="0" />
                <input type="hidden" id="cantbutacas" name="cantbutacas"  value="0" />
                <input type="submit" id="btnGuardarReserva" value="" />
            </form>
            <div id="reservaAsientos"></div>


        </div>
    </div>
    <img class="cargando" style="position:absolute; bottom: 20px;" src="images/loader7.gif "/>

</div>
<script>

    $(document).ready(function(){

        $('.buttonFinish').hide();
        $('#wizard').smartWizard(
        {
            onFinish: onFinishCallback,
            selected: 0, 
            labelFinish:"Reservar",
            enableFinishButton: false,
            onShowStep:onShowStepCallback
        });
       
        function onShowStepCallback(obj){
            var step_num= obj.attr('rel'); 
            if (step_num==3)
            {
      
                $('.buttonFinish').show();
            }
            else
            {
                $('.buttonFinish').hide();
            }
        }

        function onFinishCallback(){

            //$('.buttonFinish').show();
            $("#guardarReserva").append($('#reservaAsientos').children());
            var valor=$('#nombreReserva').val();
            $('#ReservaNombre').attr("value",valor);
            $('#btnGuardarReserva').click();

        }

         $('#guardarReserva').ajaxForm({
            target: '#ajaxReserva',
            success: function() {
                $('#ajaxReserva').fadeIn('slow');
            }
        });

        $('#formAjaxSala').ajaxForm({

            target: '#ajaxDisplay',
            success: function() {
                $('#ajaxDisplay').fadeIn('slow');
            }
        });
        
       

        $('.buttonFinish').addClass("finish");

    

        $("input[name=idfuncion]").change(function () {
            var radio=$("input[name='idfuncion']:checked");
            var funcion = $("input[name='idfuncion']:checked").val();
            $('#ReservaIdFucion').attr("value",funcion);
            idsala=$(radio).attr("id");
            // alert(idsala);
            $('#inputIdSala').attr("value",idsala);
            $('#elegir').click();
            tr=$('#tr'+funcion+'').clone();
            tr.find('input').remove();
            var nuevo=$(tr).find();
            $('#reserva-confimacion').children().remove();
            $('#reserva-confimacion').append(tr).wrap(table);
   
        })

        var cantidad=$('#loadingFunciones').size();
        for (x=0;x<=cantidad;x++)
        {
            $('img#loadingFunciones').remove();
        }
        $('.maincontent').css("visibility","visible");
        $('.cargando').fadeOut();
        $(".maincontent").animate({
            width: "100%",
            height: "100%"
        }, 1500 );

        $('.mostarFuncion').show();
   
    })
</script>

