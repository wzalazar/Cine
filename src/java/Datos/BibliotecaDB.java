package Datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BibliotecaDB {

    private Connection Conexion;
    private Statement Sentencia;
    private ResultSet Resultado;

    public BibliotecaDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
        }
    }

    public Connection getConexion() throws SQLException {
        return Conexion;
    }

    public void Conectar() throws SQLException, Exception
    {  
      //  Conexion = DriverManager.getConnection("jdbc:mysql://127.5.104.1:3306/cinemautnweb", "admin", "b_mFTvT_jZsT"); 
      //Conexion = DriverManager.getConnection("jdbc:mysql://127.5.104.1:3306/cinemautn", "admin", "jPy9upUMJ9p3");     
        Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root", "");        
        Conexion.setAutoCommit(false);
    }

    public void Desconectar() 
    {
        try 
        {
            Conexion.setAutoCommit(true);
            Conexion.close();
        } 
        catch (SQLException e) 
        {
        }
    }

    public int Actualizar(PreparedStatement sentencia) throws Exception {
        try {
            int res = sentencia.executeUpdate();
            return res;
        } catch (SQLException e) {
            throw new Exception("Error al ejecutar sentencia \n codigo" + e.getErrorCode() + "Explicacion:" + e.getMessage());
        }
    }

    public ResultSet Consultar(PreparedStatement sentencia) throws Exception {
        try {
            ResultSet rows = sentencia.executeQuery();
            return rows;
        } catch (SQLException e) {
            throw new SQLException("Error al ejecutar consulta" + e.getMessage());
        }
    }

    public PreparedStatement CrearSentencia(String sql) throws Exception {
        try {
            Conectar();
            PreparedStatement s = getConexion().prepareStatement(sql);
            return s;
        } catch (SQLException e) {

            throw new SQLException("Error al ejecutar sentencia \n codigo" + e.getErrorCode() + "Explicacion:" + e.getMessage());
        }

    }

    public void EjecutarSentencia(String sql) throws Exception {
        Conectar();
        Sentencia = Conexion.createStatement();
        Sentencia.execute(sql);
        Desconectar();
    }
}
