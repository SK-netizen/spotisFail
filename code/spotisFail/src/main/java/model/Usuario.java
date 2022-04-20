package model;

import java.util.Objects;

public class Usuario {
    private Integer id;
    private String Nombre;
    private String Apellidos;
    private String email;
    private String username;
    private String password;

    public Usuario() {
        id=-1;
        Nombre="";
        Apellidos="";
        email="";
        username="";
        password="";
    }
    public Usuario(Integer id, String Nombre, String Apellidos, String email, String username, String password){
        this.id=id;
        this.Nombre=Nombre;
        this.Apellidos=Apellidos;
        this.email=email;
        this.username=username;
        this.password=password;
    }

    public Integer getId() {
        return id;
    }

    public String getApellidos() {
        return Apellidos;
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

    public void setApellidos(String apellidos) {
        Apellidos = apellidos;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(Integer id) {
        this.id = id;
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
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuario usuario = (Usuario) o;
        return id == usuario.id && Objects.equals(Nombre, usuario.Nombre) && Objects.equals(Apellidos, usuario.Apellidos) && Objects.equals(email, usuario.email) && Objects.equals(username, usuario.username) && Objects.equals(password, usuario.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, Nombre, Apellidos, email, username, password);
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id +
                ", Nombre='" + Nombre + '\'' +
                ", Apellidos='" + Apellidos + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
