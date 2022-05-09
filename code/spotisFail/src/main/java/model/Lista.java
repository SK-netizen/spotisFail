package model;

import java.util.LinkedList;
import java.util.Objects;

public class Lista {
    private Integer idLista;
    private String Nombre;
    private String Image;

    private LinkedList<Cancion> listaCancion;

    public Lista(){
        idLista=0;
        Nombre="";
        Image="";
        listaCancion = new LinkedList<Cancion>();
    }
    public Lista(Integer id, String nombre, String ima){
        idLista=id;
        Nombre=nombre;
        Image=ima;
        listaCancion = new LinkedList<Cancion>();
    }
    public void addCancion(Cancion cancion){
        listaCancion.add(cancion);
    }

    public void setListaCancion(LinkedList<Cancion> listaCancion) {
        this.listaCancion = listaCancion;
    }

    public void setImage(String image) {
        Image = image;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public void setIdLista(Integer idLista) {
        this.idLista = idLista;
    }

    public String getImage() {
        return Image;
    }

    public LinkedList<Cancion> getListaCancion() {
        return listaCancion;
    }

    public String getNombre() {
        return Nombre;
    }

    public Integer getIdLista() {
        return idLista;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Lista lista = (Lista) o;
        return Objects.equals(idLista, lista.idLista) && Objects.equals(Nombre, lista.Nombre) && Objects.equals(Image, lista.Image) && Objects.equals(listaCancion, lista.listaCancion);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idLista, Nombre, Image, listaCancion);
    }

    @Override
    public String toString() {
        return "Lista{" +
                "idLista=" + idLista +
                ", Nombre='" + Nombre + '\'' +
                ", Image='" + Image + '\'' +
                ", listaCancion=" + listaCancion.toString() +
                '}';
    }
}
