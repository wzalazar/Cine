package Entidades;

import java.sql.Time;
import java.util.Date;

public class Horario
{
    private Time Horario;
    private double Precio;

    public Date getHorario()
    {
        return Horario;
    }

    public void setHorario(Time Horario)
    {
        this.Horario = Horario;
    }

    public double getPrecio()
    {
        return Precio;
    }

    public void setPrecio(double Precio)
    {
        this.Precio = Precio;
    }
    
    public Horario()
    {        
    }

    public Horario(Time Horario, double Precio)
    {
        setHorario(Horario);
        setPrecio(Precio);
    }
}
