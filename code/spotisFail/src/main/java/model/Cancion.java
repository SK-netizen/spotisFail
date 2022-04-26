package model;

import java.util.Objects;

public class Cancion {
    private Integer idCancion;
    private Integer idArtista;
    private String UrlCancion;
    private String anio;
    private String nombreCancion;
    private String Genero;

    public Integer getIdArtista() {
        return idArtista;
    }

    public Integer getIdCancion() {
        return idCancion;
    }

    public String getAnio() {
        return anio;
    }

    public String getGenero() {
        return Genero;
    }

    public String getNombreCancion() {
        return nombreCancion;
    }

    public String getUrlCancion() {
        return UrlCancion;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public void setGenero(String genero) {
        Genero = genero;
    }

    public void setIdArtista(Integer idArtista) {
        this.idArtista = idArtista;
    }

    public void setIdCancion(Integer idCancion) {
        this.idCancion = idCancion;
    }

    public void setNombreCancion(String nombreCancion) {
        this.nombreCancion = nombreCancion;
    }

    public void setUrlCancion(String urlCancion) {
        UrlCancion = urlCancion;
    }

    @Override
    public String toString() {
        return "Cancion{" +
                "idCancion=" + idCancion +
                ", idArtista=" + idArtista +
                ", UrlCancion='" + UrlCancion + '\'' +
                ", anio='" + anio + '\'' +
                ", nombreCancion='" + nombreCancion + '\'' +
                ", Genero='" + Genero + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cancion cancion = (Cancion) o;
        return Objects.equals(idCancion, cancion.idCancion) && Objects.equals(idArtista, cancion.idArtista) && Objects.equals(UrlCancion, cancion.UrlCancion) && Objects.equals(anio, cancion.anio) && Objects.equals(nombreCancion, cancion.nombreCancion) && Objects.equals(Genero, cancion.Genero);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCancion, idArtista, UrlCancion, anio, nombreCancion, Genero);
    }
}
