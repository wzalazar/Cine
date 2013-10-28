<%@page import="Entidades.Butaca"%>
<%@page import="Datos.DatosButacas"%>
<%@page session="true" %>
<%@page import="Datos.DatosReservas"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entidades.Horario"%>
<%@page import="Entidades.Sala"%>
<%@page import="Datos.DatosHorarios"%>
<%@page import="Datos.DatosSalas"%>
<%@page import="Entidades.Pelicula"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Datos.DatosFunciones"%>
<%@page import="Entidades.Funcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="oReserva" class="Entidades.Reserva" scope="page"/>
<jsp:useBean id="oEspectador" class="Entidades.Espectador" scope="session"/>

<%! DatosReservas oDatosReservas;
    DatosSalas oDatosSalas;
    DatosHorarios oDatosHorarios;
    DatosFunciones oDatosFunciones;
    DatosButacas oDatosButacas;
%>

<%
    oDatosReservas = new DatosReservas();
    oDatosSalas = new DatosSalas();
    oDatosFunciones = new DatosFunciones();
    oDatosHorarios = new DatosHorarios();
    oDatosButacas = new DatosButacas();

    try
    {
        int idFuncion = Integer.parseInt(request.getParameter("ReservaIdFucion"));
        String nombreFuncion="";
        int cantbutacas = Integer.parseInt(request.getParameter("cantbutacas"));
        
        if (idFuncion != 0)
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(idFuncion);
            Date auxdate = new Date();
            oReserva.setoFuncion(oFuncion);
            oReserva.setoEspectador(oEspectador);
            nombreFuncion= request.getParameter("ReservaNombre");
            
            if (nombreFuncion != "")
            {
                oReserva.setNombre(request.getParameter("ReservaNombre"));
                double precio = (oFuncion.getoHorario().getPrecio()) * cantbutacas;
                oReserva.setPrecio(precio);
                oDatosReservas.AgregarReserva(oReserva);
            }
        } 
        
        if (cantbutacas != 0)
        {
            for (int x = 1; x <= cantbutacas; x++)
            {
                int columna = Integer.parseInt(request.getParameter("asientoc" + x));
                int fila = Integer.parseInt(request.getParameter("asientof" + x));
                Butaca oButaca = new Butaca(oReserva.getoFuncion(), fila, columna);
                oDatosButacas.ReservarButaca(oButaca);
            }
        }
        
        if ((idFuncion!=0) && (cantbutacas!=0) && (!nombreFuncion.equals("")))
        {
            %><script>$('.buttonFinish').hide();setTimeout(function(){$('#popup1').fadeOut(3000);$('#fancy1').fadeOut(3000)} , 000)</script><h2 id="gracias" style="color: yellowgreen;font-size: 20px;left: 42px;position: relative;  top: 13px;">Gracias por su reserva.</h2><%

        }
        else
        {
            %><script>$('.buttonFinish').hide();setTimeout(function(){$('#error').fadeOut(1000);$('.buttonFinish').fadeIn(3000);} , 1000)</script><h2 id="error" style="color: red;font-size: 20px;left: 42px;position: relative;  top: 13px;">Error, faltan datos.</h2><%

        }
    }
    catch (Exception ex)
    {
       
    }
%>        


