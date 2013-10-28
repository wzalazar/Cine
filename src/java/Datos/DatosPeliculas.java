package Datos;

import Entidades.Pelicula;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosPeliculas extends BibliotecaDB
{
    public void AgregarPelicula(Pelicula oPelicula) throws SQLException, ClassNotFoundException, Exception
    {
        if(oPelicula != null)
        {
            String sql = "INSERT INTO Peliculas (Titulo, Descripcion, Genero, Imagen, IdVideo) VALUES ('"
                    + oPelicula.getTitulo() + "','"
                    + oPelicula.getDescripcion()+ "','" 
                    + oPelicula.getGenero() + "','"
                    + oPelicula.getPoster() + "','"
                    + oPelicula.getIdVideo() + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }
    
    public void ModificarPelicula(Pelicula oPelicula) throws SQLException, ClassNotFoundException, Exception
    {
        if(oPelicula != null)
        {
            String sql = "UPDATE Peliculas SET Titulo = '"
                    + oPelicula.getTitulo() + "', Descripcion = '"
                    + oPelicula.getDescripcion() + "',  Genero = '"
                    + oPelicula.getGenero() + "', Imagen = '"
                    + oPelicula.getPoster() + "' WHERE IdPelicula = "
                    + oPelicula.getIdPelicula();
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }
    
    public void EliminarPelicula(int IdPelicula) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "UPDATE Peliculas SET Estado = 0 WHERE IdPelicula = " + IdPelicula;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }
    
    public Pelicula BuscarPelicula(int IdPelicula) throws SQLException, ClassNotFoundException, Exception
    {
        Pelicula aux = null;
        String sql = "SELECT * FROM Peliculas WHERE IdPelicula = " + IdPelicula;        
        PreparedStatement s = CrearSentencia(sql);
        System.out.println(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Pelicula(Resultado.getInt("IdPelicula"), Resultado.getString("Titulo"), Resultado.getString("Descripcion"), Resultado.getString("Genero"), Resultado.getString("Imagen"), Resultado.getInt("IdVideo"));
        }
        
        Desconectar();

        return aux;
    }
    
    public Hashtable ListarPeliculas() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Pelicula aux = null;
        String sql = "SELECT * FROM Peliculas WHERE Estado = 1";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Pelicula(Resultado.getInt("IdPelicula"), Resultado.getString("Titulo"), Resultado.getString("Descripcion"), Resultado.getString("Genero"), Resultado.getString("Imagen"), Resultado.getInt("IdVideo"));
            ListaRTA.put(aux.getIdPelicula(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    } 
    
    public Hashtable ListarPeliculasGenero(String Genero) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Pelicula aux = null;
        String sql = "SELECT * FROM Peliculas WHERE Estado = 1 AND Genero = '" + Genero + "'";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Pelicula(Resultado.getInt("IdPelicula"), Resultado.getString("Titulo"), Resultado.getString("Descripcion"), Resultado.getString("Genero"), Resultado.getString("Imagen"), Resultado.getInt("IdVideo"));
            ListaRTA.put(aux.getIdPelicula(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}
