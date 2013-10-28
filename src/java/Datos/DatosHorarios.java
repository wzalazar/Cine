package Datos;

import Entidades.Horario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Hashtable;

public class DatosHorarios extends BibliotecaDB
{

    public void AgregarHorario(Horario oHorario) throws SQLException, ClassNotFoundException, Exception
    {
        if (oHorario != null)
        {
            if(!ExisteHorario(oHorario))
            {
                String sql = "INSERT INTO Horarios (Horario, Precio) VALUES ('"
                        + oHorario.getHorario() + "','"
                        + oHorario.getPrecio() + "')";
                Conectar();
                EjecutarSentencia(sql);
                Desconectar();
            }
        }
    }

    public void ModificarHorario(Horario oHorario) throws SQLException, ClassNotFoundException, Exception
    {
        if (oHorario != null)
        {
            String sql = "UPDATE Horarios SET Precio = "
                    + oHorario.getPrecio() + " WHERE Horario = '"
                    + oHorario.getHorario() + "'";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void EliminarHorario(Date Horario) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "UPDATE Horarios SET Estado = 0 WHERE Horario = " + Horario;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }
    
    public Horario BuscarHorario(Date Horario) throws SQLException, ClassNotFoundException, Exception
    {
        Horario aux = null;
        String sql = "SELECT * FROM Horarios WHERE Horario = '" + Horario + "'";
        //Conectar();
        PreparedStatement s = CrearSentencia(sql);      
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Horario(Resultado.getTime("Horario"), Resultado.getDouble("Precio"));
        }
        
        Desconectar();

        return aux;
    }
    
    public boolean ExisteHorario(Horario oHorario) throws SQLException, ClassNotFoundException, Exception
    {
        boolean rta = false;
        String sql = "SELECT * FROM Horarios WHERE Horario = '" + oHorario.getHorario() + "'";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            rta = true;
        }
        
        Desconectar();

        return rta;
    }
    
    public Hashtable ListarHorarios() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Horario aux = null;
        String sql = "SELECT * FROM Horarios WHERE Estado = 1";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Horario(Resultado.getTime("Horario"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getHorario(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarHorariosPrecio(double Precio) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Horario aux = null;
        String sql = "SELECT * FROM Horarios WHERE Estado = 1 AND Precio > " + Precio;
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Horario(Resultado.getTime("Horario"), Resultado.getDouble("Precio"));
            ListaRTA.put(aux.getHorario(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}