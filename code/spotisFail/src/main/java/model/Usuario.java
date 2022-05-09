package model;

import java.util.LinkedList;
import java.util.Objects;

public class Usuario {
    private Integer idUsuario;
    private String Nombre;
    private String Apellidos;
    private String email;
    private String username;
    private String password;
    private LinkedList<Lista> listaUsuario;

    public Usuario() {
        idUsuario=-1;
        Nombre="";
        Apellidos="";
        email="";
        username="";
        password="";
        listaUsuario=new LinkedList<Lista>();
    }
    public Usuario(Integer idUsuario, String Nombre, String Apellido, String email, String username, String password, LinkedList<Lista> lista){
        this.idUsuario=idUsuario;
        this.Nombre=Nombre;
        this.Apellidos=Apellidos;
        this.email=email;
        this.username=username;
        this.password=password;
        listaUsuario=lista;
    }

    public LinkedList<Lista> getListaUsuario() {
        return listaUsuario;
    }
    public Integer getId() {
        return idUsuario;
    }

    public String getApellido() {
        return Apellidos;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public String getEmail() {
        return email;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public void setListaUsuario(LinkedList<Lista> listaUsuario) {
        this.listaUsuario = listaUsuario;
    }
    public void setIdUsuario(Integer idUsuario){
        this.idUsuario=idUsuario;
    }
    public void setApellidos(String apellidos) {
        Apellidos = apellidos;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuario usuario = (Usuario) o;
        return idUsuario.equals(usuario.idUsuario) && Nombre.equals(usuario.Nombre) && Apellidos.equals(usuario.Apellidos) && email.equals(usuario.email) && username.equals(usuario.username) && password.equals(usuario.password) ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUsuario, Nombre, Apellidos, email, username, password);
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "idUsuario=" + idUsuario +
                ", Nombre='" + Nombre + '\'' +
                ", Apellidos='" + Apellidos + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
