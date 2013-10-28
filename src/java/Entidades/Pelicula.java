package Entidades;

public class Pelicula
{
    private int IdPelicula;
    private String Titulo;
    private String Descripcion;
    private String Genero;
    private String poster;
    private int IdVideo;

    public int getIdPelicula()
    {
        return IdPelicula;
    }

    public void setIdPelicula(int IdPelicula)
    {
        this.IdPelicula = IdPelicula;
    }

    public String getTitulo()
    {
        return Titulo;
    }

    public void setTitulo(String Titulo)
    {
        this.Titulo = Titulo;
    }

    public String getDescripcion()
    {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion)
    {
        this.Descripcion = Descripcion;
    }

    public String getGenero()
    {
        return Genero;
    }

    public void setGenero(String Genero)
    {
        this.Genero = Genero;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public int getIdVideo()
    {
        return IdVideo;
    }

    public void setIdVideo(int IdVideo)
    {
        this.IdVideo = IdVideo;
    }
        
    public Pelicula()
    {
        
    }

    public Pelicula(int IdPelicula, String Titulo, String Descripcion, String Genero, String poster, int Idvideo)
    {
        setIdPelicula(IdPelicula);
        setTitulo(Titulo);
        setDescripcion(Descripcion);
        setGenero(Genero);
        setPoster(poster);
        setIdVideo(Idvideo);
    }   
}
