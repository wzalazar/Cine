/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Datos;

import java.sql.SQLException;

/**
 *
 * @author Kevin Magallanes
 */
public interface Datos {
       public void modificar() throws SQLException, ClassNotFoundException, Exception;
    public void eliminar() throws SQLException, ClassNotFoundException, Exception;
    public void agregar() throws SQLException, ClassNotFoundException, Exception;
    public void buscar() throws SQLException, ClassNotFoundException, Exception;
    public void lista() throws ClassNotFoundException, Exception;
    public void Caducar() throws SQLException, ClassNotFoundException, Exception;
    
    
}
