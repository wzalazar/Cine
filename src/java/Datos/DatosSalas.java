package Datos;

import Entidades.Sala;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosSalas extends BibliotecaDB
{

    public void AgregarSala(Sala oSala) throws SQLException, ClassNotFoundException, Exception
    {
        if (oSala != null)
        {
            Conectar();
            String sql = "INSERT INTO Salas (Nombre, Filas, Butacasporfila) VALUES ('"
                    + oSala.getNombre() + "','"
                    + oSala.getFilas() + "','"
                    + oSala.getButacasporfila() + "')";
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void ModificarSala(Sala oSala) throws SQLException, ClassNotFoundException, Exception
    {
        if (oSala != null)
        {
            Conectar();
            String sql = "UPDATE Salas SET Nombre = '"
                    + oSala.getNombre() + "' WHERE IdSala = "
                    + oSala.getIdSala();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void EliminarSala(int IdSala) throws SQLException, ClassNotFoundException, Exception
    {
        Conectar();
        String sql = "UPDATE Salas SET Estado = 0 WHERE IdSala = " + IdSala;
        EjecutarSentencia(sql);
        Desconectar();
    }

    public Sala BuscarSala(int IdSala) throws SQLException, ClassNotFoundException, Exception
    {
        Sala aux = null;
        String sql = "SELECT * FROM Salas WHERE IdSala = " + IdSala; 
        PreparedStatement s = CrearSentencia(sql);
        System.out.println(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Sala(Resultado.getInt("IdSala"), Resultado.getString("Nombre"), Resultado.getInt("Butacasporfila"), Resultado.getInt("Filas"));
        }
        
        Desconectar();
        
        return aux;
    }
    
    public Hashtable ListarSalas() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Sala aux = null;
        String sql = "SELECT * FROM Salas WHERE Estado = 1";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Sala(Resultado.getInt("IdSala"), Resultado.getString("Nombre"), Resultado.getInt("Butacasporfila"), Resultado.getInt("Filas"));
            ListaRTA.put(aux.getIdSala(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarSalasCapacidad(int Capacidad) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Sala aux = null;
        String sql = "SELECT * FROM Salas WHERE Estado = 1 AND CantidadButacas > " + Capacidad;
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Sala(Resultado.getInt("IdSala"), Resultado.getString("Nombre"), Resultado.getInt("Butacasporfila"), Resultado.getInt("Filas"));
            ListaRTA.put(aux.getIdSala(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}
