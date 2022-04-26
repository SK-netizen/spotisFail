package model;

import java.util.Objects;

public class Artista {
    private Integer idArtista;
    private String Nombre;
    private String Image;

    public void setNombre(String nombre) {
        Nombre = nombre;
    }
    public void setIdArtista(Integer idArtista){
        this.idArtista=idArtista;
    }

    public void setImage(String image) {
        Image = image;
    }

    public Integer getIdArtista() {
        return idArtista;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getImage() {
        return Image;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Artista artista = (Artista) o;
        return Objects.equals(idArtista, artista.idArtista) && Objects.equals(Nombre, artista.Nombre) && Objects.equals(Image, artista.Image);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idArtista, Nombre, Image);
    }

    @Override
    public String toString() {
        return "Artista{" +
                "idArtista=" + idArtista +
                ", Nombre='" + Nombre + '\'' +
                ", Image='" + Image + '\'' +
                '}';
    }
}
