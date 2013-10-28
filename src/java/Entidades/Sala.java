package Entidades;

import java.util.Hashtable;

public class Sala
{
    private int IdSala;
    private String Nombre;
    private int Filas;
    private int Butacasporfila;

    public int getIdSala()
    {
        return IdSala;
    }

    public void setIdSala(int IdSala)
    {
        this.IdSala = IdSala;
    }

    public String getNombre()
    {
        return Nombre;
    }

    public void setNombre(String Nombre)
    {
        this.Nombre = Nombre;
    }
    
    public int getButacasporfila()
    {
        return Butacasporfila;
    }

    public void setButacasporfila(int Capacidad)
    {
        this.Butacasporfila = Capacidad;
    }

    public int getFilas()
    {
        return Filas;
    }

    public void setFilas(int Filas)
    {
        this.Filas = Filas;
    }    

    public Sala()
    {
    }
    
    public Sala(String Nombre, int Butacasporfila, int filas)
    {
        setNombre(Nombre);
        setButacasporfila(Butacasporfila);
        setFilas(filas);
    }

    public Sala(int IdSala, String Nombre, int Butacasporfila, int Filas)
    {
        setIdSala(IdSala);
        setNombre(Nombre);       
        setButacasporfila(Butacasporfila);
        setFilas(Filas);
    }
}
