package Datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Entidades.Espectador;
import Entidades.StringMD;

public class Autenticacion extends BibliotecaDB{
	
	DatosEspectadores dE= new DatosEspectadores();

	
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
            aux = dE.BuscarEspectador(idEspectador);
        }
        
        Desconectar();

        return aux;
    }
	
	
	public boolean ComprobarPassword(Espectador oEspectador) throws SQLException, ClassNotFoundException, Exception
    {
        boolean rta = false;

        if (oEspectador != null)
        {
            String newpass = StringMD.getCadenaEncriptada(oEspectador.getPassword(), StringMD.MD5);
            Espectador aux = dE.BuscarEspectador(oEspectador.getIdEspectador());
            String oldpass = aux.getPassword();

            if (!newpass.equals(oldpass))
            {
                rta = true;
            }
        }

        return rta;
    }
	
	
}
