package Datos;

import Entidades.Espectador;
import Entidades.Funcion;
import Entidades.Pelicula;
import Entidades.Reserva;
import Entidades.Sala;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Hashtable;

public class DatosReservas extends BibliotecaDB
{
    private DatosEspectadores oDatosEspectadores = new DatosEspectadores();
    private DatosFunciones oDatosFunciones = new DatosFunciones();

    public void AgregarReserva(Reserva oReserva) throws SQLException, ClassNotFoundException, Exception
    {
        if (oReserva != null)
        {
            String sql = "INSERT INTO Reservas (Horario, IdFuncion, IdSala, IdPelicula, IdUsuario, Nombre, Fecha, Precio) VALUES ('"
                    + oReserva.getoFuncion().getoHorario().getHorario() + "','"
                    + oReserva.getoFuncion().getIdFuncion() + "','"
                    + oReserva.getoFuncion().getoSala().getIdSala() + "','"
                    + oReserva.getoFuncion().getoPelicula().getIdPelicula() + "','"
                    + oReserva.getoEspectador().getIdEspectador() + "','"
                    + oReserva.getNombre() + "','"
                    + oReserva.getoFuncion().getFecha() + "','"
                    + oReserva.getPrecio() + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void ModificarReserva(Reserva oReserva) throws SQLException, ClassNotFoundException, Exception
    {
        if (oReserva != null)
        {
            String sql = "UPDATE Reservas SET Horario = '"
                    + oReserva.getoFuncion().getoHorario().getHorario() + "', IdFuncion = '"
                    + oReserva.getoFuncion().getIdFuncion() + "', IdSala = "
                    + oReserva.getoFuncion().getoSala().getIdSala() + "', IdPelicula = "
                    + oReserva.getoFuncion().getoPelicula().getIdPelicula() + "', IdUsuario = "
                    + oReserva.getoEspectador().getIdEspectador() + "', Nombre = "
                    + oReserva.getNombre() + "', FechaReserva = "
                    + oReserva.getFecha() + "', Fecha = "
                    + oReserva.getoFuncion().getFecha() + "', Precio = "
                    + oReserva.getPrecio() + " WHERE IdReserva = "
                    + oReserva.getIdReserva();
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void EliminarReserva(int IdReserva) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "UPDATE Reservas SET Estado = 0 WHERE IdReserva = " + IdReserva;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }

    public Reserva BuscarReserva(int IdReserva) throws SQLException, ClassNotFoundException, Exception
    {
        Reserva aux = null;
        String sql = "SELECT * FROM Reservas WHERE IdReserva = " + IdReserva;        
        PreparedStatement s = CrearSentencia(sql);
        System.out.println(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(Resultado.getInt("IdFuncion"));
            Espectador oEspectador = oDatosEspectadores.BuscarEspectador(Resultado.getInt("IdUsuario"));
            aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion, oEspectador, Resultado.getString("Nombre"), Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
        }
        
        Desconectar();

        return aux;
    }

    public Hashtable ListarReservas() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Reserva aux = null;
        String sql = "SELECT * FROM Reservas WHERE Estado = 1";
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(Resultado.getInt("IdFuncion"));
            Espectador oEspectador = oDatosEspectadores.BuscarEspectador(Resultado.getInt("IdUsuario"));
            aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion, oEspectador, Resultado.getString("Nombre"), Resultado.getDate("FechaReserva"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getIdReserva(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public void CaducarReservas() throws SQLException, ClassNotFoundException, Exception
    {
        Date fechaactual = new Date();        
        Calendar c = new GregorianCalendar();   
        int mes = c.get(Calendar.MONTH);
        String fecha = Integer.toString(c.get(Calendar.YEAR)) + "-" + (mes + 1) + "-" + Integer.toString(c.get(Calendar.DATE));       
        String sql = "UPDATE Reservas SET Estado = 0 WHERE Fecha < " + fecha;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }

    public Hashtable ListarReservasEspectador(Espectador oEspectadors) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Reserva aux = null;
        String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdUsuario = " + oEspectadors.getIdEspectador();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(Resultado.getInt("IdFuncion"));
            Espectador oEspectador = oDatosEspectadores.BuscarEspectador(Resultado.getInt("IdUsuario"));
            aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion, oEspectador, Resultado.getString("Nombre"), Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getIdReserva(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }

    public Hashtable ListarReservasPelicuka(Pelicula oPelicula) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Reserva aux = null;
        String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdPelicula = " + oPelicula.getIdPelicula();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(Resultado.getInt("IdFuncion"));
            Espectador oEspectador = oDatosEspectadores.BuscarEspectador(Resultado.getInt("IdUsuario"));
            aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion, oEspectador, Resultado.getString("Nombre"), Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getIdReserva(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }

    public Hashtable ListarReservasSala(Sala oSala) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Reserva aux = null;
        String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdSala = " + oSala.getIdSala();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(Resultado.getInt("IdFuncion"));
            Espectador oEspectador = oDatosEspectadores.BuscarEspectador(Resultado.getInt("IdUsuario"));
            aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion, oEspectador, Resultado.getString("Nombre"), Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getIdReserva(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }

    public Hashtable ListarReservasFuncion(Funcion oFuncions) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Reserva aux = null;
        String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdFuncion = " + oFuncions.getIdFuncion();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Funcion oFuncion = oDatosFunciones.BuscarFuncion(Resultado.getInt("IdFuncion"));
            Espectador oEspectador = oDatosEspectadores.BuscarEspectador(Resultado.getInt("IdUsuario"));
            aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion, oEspectador, Resultado.getString("Nombre"), Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getIdReserva(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}
