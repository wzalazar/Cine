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
<%@page session="true" %>
<%@page import="Entidades.Funcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.DatosPeliculas"%>

<jsp:useBean id="oFuncion" class="Entidades.Funcion" scope="page"/>

<%!    DatosPeliculas oDatosPeliculas;
    DatosSalas oDatosSalas;
    DatosHorarios oDatosHorarios;
    DatosFunciones oDatosFunciones;
%>

<%
    oDatosPeliculas = new DatosPeliculas();
    oDatosSalas = new DatosSalas();
    oDatosFunciones = new DatosFunciones();
    oDatosHorarios = new DatosHorarios();

    try
    {
        String horString = request.getParameter("horario");
        java.sql.Time fecFormatoTime = null;
        SimpleDateFormat sdf = new java.text.SimpleDateFormat("hh:mm:ss", new Locale("es", "ES"));
        fecFormatoTime = new java.sql.Time(sdf.parse(horString).getTime());

        String fecString = request.getParameter("fecha");
        java.sql.Date fecFormatoDate = null;
        SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("dd-MM-yyyy", new Locale("es", "ES"));
        fecFormatoDate = new java.sql.Date(sdf2.parse(fecString).getTime());

        int idPelicula = Integer.parseInt(request.getParameter("pelicula"));
        int idSala = Integer.parseInt(request.getParameter("sala"));


        Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(idPelicula);
        Sala oSala = oDatosSalas.BuscarSala(idSala);
        Horario oHorario = oDatosHorarios.BuscarHorario(fecFormatoTime);

        oFuncion.setFecha(fecFormatoDate);
        oFuncion.setoHorario(oHorario);
        oFuncion.setoPelicula(oPelicula);
        oFuncion.setoSala(oSala);

        oDatosFunciones.AgregarFuncion(oFuncion);
        response.sendRedirect("funciones.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>        


