package Datos;

import Entidades.Espectador;
import Entidades.StringMD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosEspectadores extends BibliotecaDB
{

    public Espectador Login(String Usuario, String Password) throws SQLException, ClassNotFoundException, Exception
    {
        Password = StringMD.getCadenaEncriptada(Password, StringMD.MD5);
        String sql = "SELECT * FROM Usuarios WHERE Usuario= '" + Usuario + "' AND Password= '" + Password + "' AND Estado = 1";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet rows = Consultar(s);        
        int idEspectador;
        Espectador aux = null;

        while (rows.next())
        {
            idEspectador = rows.getInt("IdUsuario");
            aux = BuscarEspectador(idEspectador);
        }
        
        Desconectar();

        return aux;
    }

    public void AgregarEspectador(Espectador oEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        if (oEspectador != null)
        {
            oEspectador.setPassword(StringMD.getCadenaEncriptada(oEspectador.getPassword(), StringMD.MD5));
            String sql = "INSERT INTO Usuarios (Usuario, Password, Nombre, Apellido, DNI, TipoUsuario) VALUES ('"
                    + oEspectador.getUsuario() + "','"
                    + oEspectador.getPassword() + "','"
                    + oEspectador.getNombre() + "','"
                    + oEspectador.getApellido() + "','"
                    + oEspectador.getDNI() + "','"
                    + oEspectador.getTipo() + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void ModificarEspectador(Espectador oEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        if (oEspectador != null)
        {                    
            String sql = "UPDATE Usuarios SET Usuario = '"
                    + oEspectador.getUsuario() + "', Nombre = '"
                    + oEspectador.getNombre() + "', Apellido = '"
                    + oEspectador.getApellido() + "', DNI = '"
                    + oEspectador.getDNI() + "', TipoUsuario = '"
                    + oEspectador.getTipo() + "' WHERE IdUsuario = "
                    + oEspectador.getIdEspectador();            
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public boolean ComprobarPassword(Espectador oEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        boolean rta = false;

        if (oEspectador != null)
        {
            String newpass = StringMD.getCadenaEncriptada(oEspectador.getPassword(), StringMD.MD5);
            Espectador aux = BuscarEspectador(oEspectador.getIdEspectador());
            String oldpass = aux.getPassword();

            if (!newpass.equals(oldpass))
            {
                rta = true;
            }
        }

        return rta;
    }

    public void EliminarEspectador(int IdEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "UPDATE Usuarios SET Estado = 0 WHERE IdUsuario = " + IdEspectador;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }

    public Espectador BuscarEspectador(int IdEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        Espectador aux = null;
        String sql = "SELECT * FROM Usuarios WHERE IdUsuario = " + IdEspectador;
        Conectar();
        PreparedStatement s = CrearSentencia(sql);        
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Espectador(Resultado.getInt("IdUsuario"), Resultado.getString("Usuario"), Resultado.getString("Password"), Resultado.getString("Nombre"), Resultado.getString("Apellido"), Resultado.getString("DNI"), Resultado.getString("TipoUsuario"));
        }
        
        Desconectar();

        return aux;
    }

     public Espectador BuscarEspectadorNombreUsuario(String NombreEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        Espectador aux = null;
        String sql = "SELECT * FROM Usuarios WHERE Usuario = '"+NombreEspectador+"'";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);        
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Espectador(Resultado.getInt("IdUsuario"), Resultado.getString("Usuario"), Resultado.getString("Password"), Resultado.getString("Nombre"), Resultado.getString("Apellido"), Resultado.getString("DNI"), Resultado.getString("TipoUsuario"));
        }
        
        Desconectar();

        return aux;
    }

    public Hashtable ListarEspectadores() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Espectador aux = null;
        String sql = "SELECT * FROM Usuarios WHERE Estado = 1";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Espectador(Resultado.getInt("IdUsuario"), Resultado.getString("Usuario"), Resultado.getString("Password"), Resultado.getString("Nombre"), Resultado.getString("Apellido"), Resultado.getString("DNI"), Resultado.getString("TipoUsuario"));
            ListaRTA.put(aux.getIdEspectador(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }

    public Hashtable ListarEspectadoresDNI(int DNI) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Espectador aux = null;
        String sql = "SELECT * FROM Usuarios WHERE Estado = 1 AND DNI = " + DNI;
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            aux = new Espectador(Resultado.getInt("IdUsuario"), Resultado.getString("Usuario"), Resultado.getString("Password"), Resultado.getString("Nombre"), Resultado.getString("Apellido"), Resultado.getString("DNI"), Resultado.getString("TipoUsuario"));
            ListaRTA.put(aux.getIdEspectador(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}