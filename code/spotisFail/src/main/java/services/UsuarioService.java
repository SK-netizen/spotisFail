package services;

import model.Usuario;

import java.util.List;


public interface UsuarioService {
    public boolean authenticate(String username, String password);


    public Usuario getUserByUsername(String username);

    public Usuario getUserByUserId(String userId);

    public List<Usuario> getListOfUsers();

    public boolean register(Usuario user);
}
