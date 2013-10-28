package Entidades;

import java.util.Date;

public class Reserva
{
    private int IdReserva;
    private Funcion oFuncion;
    private Espectador oEspectador;
    private String Nombre;
    private Date Fecha;
    private double Precio;

    public int getIdReserva()
    {
        return IdReserva;
    }

    public void setIdReserva(int IdReserva)
    {
        this.IdReserva = IdReserva;
    }

    public Funcion getoFuncion()
    {
        return oFuncion;
    }

    public void setoFuncion(Funcion oFuncion)
    {
        this.oFuncion = oFuncion;
    }

    public Espectador getoEspectador()
    {
        return oEspectador;
    }

    public void setoEspectador(Espectador oEspectador)
    {
        this.oEspectador = oEspectador;
    }

    public String getNombre()
    {
        return Nombre;
    }

    public void setNombre(String Nombre)
    {
        this.Nombre = Nombre;
    }

    public Date getFecha()
    {
        return Fecha;
    }

    public void setFecha(Date Fecha)
    {
        this.Fecha = Fecha;
    }

    public double getPrecio()
    {
        return Precio;
    }

    public void setPrecio(double Precio)
    {
        this.Precio = Precio;
    }  
    
    public Reserva()
    {
    }
    
    public Reserva(Funcion oFuncion, Espectador oEspectador, String Nombre, Date Fecha, double Precio)
    {
        setoFuncion(oFuncion);
        setoEspectador(oEspectador);
        setNombre(Nombre);
        setFecha(Fecha);
        setPrecio(Precio);
    }

    public Reserva(int IdReserva, Funcion oFuncion, Espectador oEspectador, String Nombre, Date Fecha, double Precio)
    {
        setIdReserva(IdReserva);
        setoFuncion(oFuncion);
        setoEspectador(oEspectador);
        setNombre(Nombre);
        setFecha(Fecha);
        setPrecio(Precio);
    }
}
