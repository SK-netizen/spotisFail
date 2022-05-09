package services;

import model.Lista;
import model.Usuario;

import java.util.LinkedList;
import java.util.List;


public interface UsuarioService {
    public boolean authenticate(String username, String password);


    public Usuario getUserByUsername(String username);

    public void rellenarListaCancion(Lista lista);

    public Usuario getUserByUserId(Integer idUsuario);

    public List<Usuario> getListOfUsers();

    public LinkedList<Lista> getListasOfUser(Integer idUsuario);

    public Lista getListaUsuario(Integer idUsuario, Integer idLista);

    public boolean deleteUsuario(Integer idUsuairo);

    public boolean register(Usuario user);

}
