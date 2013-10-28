package Entidades;

public class Butaca
{
    private int IdButaca;
    private Funcion oFuncion;
    private int Fila;
    private int Columna;

    public int getIdButaca()
    {
        return IdButaca;
    }

    public void setIdButaca(int IdButaca)
    {
        this.IdButaca = IdButaca;
    }

    public Funcion getoFuncion()
    {
        return oFuncion;
    }

    public void setoFuncion(Funcion oFuncion)
    {
        this.oFuncion = oFuncion;
    }

    public int getFila()
    {
        return Fila;
    }

    public void setFila(int Fila)
    {
        this.Fila = Fila;
    }

    public int getColumna()
    {
        return Columna;
    }

    public void setColumna(int Columna)
    {
        this.Columna = Columna;
    }
    
    public Butaca()
    {
    }
    
    public Butaca(Funcion oFuncion, int Fila, int Columna)
    {        
        setoFuncion(oFuncion);
        setFila(Fila);
        setColumna(Columna);
    }

    public Butaca(int IdButaca, Funcion oFuncion, int Fila, int Columna)
    {
        setIdButaca(IdButaca);
        setoFuncion(oFuncion);
        setFila(Fila);
        setColumna(Columna);
    }
}
