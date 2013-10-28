package Datos;

import Entidades.Butaca;
import Entidades.Funcion;
import Entidades.Reserva;
import Entidades.Sala;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosButacas extends BibliotecaDB
{    
    private DatosReservas oDatosReservas;

    public void ReservarButaca(Butaca oButaca) throws SQLException, ClassNotFoundException, Exception
    {
        if (oButaca != null)
        {            
            String sql = "INSERT INTO Butacas (IdFuncion, Fila, Columna, Estado) VALUES ('"
                    + oButaca.getoFuncion().getIdFuncion() + "','"
                    + oButaca.getFila() + "','"
                    + oButaca.getColumna() + "','"
                    + 0 + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }
       
    public Boolean ButacaReservada(Funcion oFuncion, int Fila, int Columna) throws SQLException, ClassNotFoundException, Exception
    {
        Boolean rta = false;
        String sql = "SELECT * FROM Butacas WHERE Fila = " + Fila + " AND Columna = " + Columna + " AND idFuncion = " + oFuncion.getIdFuncion() + " AND Estado = 0";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);
        
        while(Resultado.next())
        {
            rta = true;
        }
        
        Desconectar();
        
        return rta;
    }   
}