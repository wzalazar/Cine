package Datos;

import Entidades.Funcion;
import Entidades.Horario;
import Entidades.Pelicula;
import Entidades.Sala;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosFunciones extends BibliotecaDB
{
    private DatosSalas oDatosSalas = new DatosSalas();
    private DatosPeliculas oDatosPeliculas = new DatosPeliculas();
    private DatosHorarios oDatosHorarios = new DatosHorarios();

    public void AgregarFuncion(Funcion oFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        if (oFuncion != null)
        {
            String sql = "INSERT INTO Funciones (IdSala, IdPelicula, Horario, Fecha) VALUES ('"
                    + oFuncion.getoSala().getIdSala() + "','"
                    + oFuncion.getoPelicula().getIdPelicula() + "','"
                    + oFuncion.getoHorario().getHorario() + "','"
                    + oFuncion.getFecha() + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void ModificarFuncion(Funcion oFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        if (oFuncion != null)
        {
            String sql = "UPDATE Funciones SET IdSala = '"
                    + oFuncion.getoSala().getIdSala() + "', IdPelicula = '"
                    + oFuncion.getoPelicula().getIdPelicula() + "', Horario = '"
                    + oFuncion.getoHorario().getHorario() + "', Fecha = '"
                    + oFuncion.getFecha() + "' WHERE IdFuncion = "
                    + oFuncion.getIdFuncion();
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void EliminarFuncion(int IdFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "UPDATE Funciones SET Estado = 0 WHERE IdFuncion = " + IdFuncion;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }

    public Funcion BuscarFuncion(int IdFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE IdFuncion = " + IdFuncion;
        PreparedStatement s = CrearSentencia(sql);        
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sala oSala = oDatosSalas.BuscarSala(Resultado.getInt("IdSala"));
            Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(Resultado.getInt("IdPelicula"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getTime("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSala, oPelicula, oHorario, Resultado.getDate("Fecha"));
        }
        
        Desconectar();        

        return aux;
    }

    public  Hashtable ListarFunciones() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1";
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {            
            Sala oSala = oDatosSalas.BuscarSala(Resultado.getInt("IdSala"));
            Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(Resultado.getInt("IdPelicula"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getTime("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSala, oPelicula, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarFuncionesPelicula(Pelicula oPeliculas) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND IdPelicula = " + oPeliculas.getIdPelicula();
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sala oSala = oDatosSalas.BuscarSala(Resultado.getInt("IdSala"));
            Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(Resultado.getInt("IdPelicula"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getDate("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSala, oPelicula, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
     public Hashtable ListarFuncionesPeliculaId(int id) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;       
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND IdPelicula = " + id;
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);
        
        while (Resultado.next())
        {
            Sala oSala = oDatosSalas.BuscarSala(Resultado.getInt("IdSala"));
            Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(Resultado.getInt("IdPelicula"));
            Horario oHorario =(Horario) oDatosHorarios.BuscarHorario(Resultado.getTime("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSala, oPelicula, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarFuncionesSala(Sala oSalas) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND IdSala = " + oSalas.getIdSala();
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sala oSala = oDatosSalas.BuscarSala(Resultado.getInt("IdSala"));
            Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(Resultado.getInt("IdPelicula"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getDate("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSala, oPelicula, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarFuncionesHorario(Horario oHorarios) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND Horario = " + oHorarios.getHorario();
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sala oSala = oDatosSalas.BuscarSala(Resultado.getInt("IdSala"));
            Pelicula oPelicula = oDatosPeliculas.BuscarPelicula(Resultado.getInt("IdPelicula"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getDate("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSala, oPelicula, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}