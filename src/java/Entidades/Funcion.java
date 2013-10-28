package Entidades;

import java.util.Date;

public class Funcion
{

    private int IdFuncion;
    private Sala oSala;
    private Pelicula oPelicula;
    private Horario oHorario;
    private Date Fecha;

    public int getIdFuncion()
    {
        return IdFuncion;
    }

    public void setIdFuncion(int IdFuncion)
    {
        this.IdFuncion = IdFuncion;
    }

    public Sala getoSala()
    {
        return oSala;
    }

    public void setoSala(Sala oSala)
    {
        this.oSala = oSala;
    }

    public Pelicula getoPelicula()
    {
        return oPelicula;
    }

    public void setoPelicula(Pelicula oPelicula)
    {
        this.oPelicula = oPelicula;
    }

    public Horario getoHorario()
    {
        return oHorario;
    }

    public void setoHorario(Horario oHorario)
    {
        this.oHorario = oHorario;
    }

    public Date getFecha()
    {
        return Fecha;
    }

    public void setFecha(Date Fecha)
    {
        this.Fecha = Fecha;
    }

    public Funcion()
    {
    }

    public Funcion(Sala oSala, Pelicula oPelicula, Horario oHorario, Date Fecha)
    {        
        setoSala(oSala);
        setoPelicula(oPelicula);
        setoHorario(oHorario);
        setFecha(Fecha);
    }
    
    public Funcion(int IdFuncion, Sala oSala, Pelicula oPelicula, Horario oHorario, Date Fecha)
    {
        setIdFuncion(IdFuncion);
        setoSala(oSala);
        setoPelicula(oPelicula);
        setoHorario(oHorario);
        setFecha(Fecha);
    }
}
