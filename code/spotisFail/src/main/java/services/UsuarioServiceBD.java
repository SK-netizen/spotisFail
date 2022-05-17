package services;

import model.Cancion;
import model.Lista;
import model.Usuario;
import util.ConexionUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class UsuarioServiceBD implements UsuarioService {
    public boolean authenticate(String username, String password) {
        Usuario user = getUserByUsername(username);
        if (user != null && user.getUsername().equals(username)
                && user.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }
    }

    public Usuario getUserByUsername(String username) {
        Usuario user = null;
        ResultSet resultados = null;
        try {
            Statement sentencia = ConexionUtil.openStatement();
            synchronized (sentencia) {
                // Cogemos todos los datos de la asignaturas
                resultados = sentencia
                        .executeQuery("SELECT * FROM Usuario where username='" + username + "'");
            }
            if (resultados.next() == false) {
                return null;
            } else {

                user = new Usuario(
                        Integer.parseInt(resultados.getString("idUsuario")),
                        resultados.getString("Nombre"),
                        resultados.getString("Apellidos"),
                        resultados.getString("email"),
                        resultados.getString("username"),
                        resultados.getString("password"),
                        getListasOfUser(Integer.parseInt(resultados.getString("idUsuario")))
                );

                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Se cierra resultSet
            if (resultados != null) {
                try {
                    resultados.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return user;
    }

    public Usuario getUserByUserId(Integer idUsuario) {
        Usuario user = null;
        ResultSet resultados = null;
        try {
            Statement sentencia = ConexionUtil.openStatement();
            synchronized (sentencia) {
                // Cogemos todos los datos de la asignaturas
                resultados = sentencia
                        .executeQuery("SELECT * FROM Usuario where idUsuario='"
                                + idUsuario.toString() + "'");
            }
            if (resultados.next() == false) {
                return null;
            } else {
                user = new Usuario(
                        Integer.parseInt(resultados.getString("idUsuario")),
                        resultados.getString("Nombre"),
                        resultados.getString("Apellidos"),
                        resultados.getString("email"),
                        resultados.getString("username"),
                        resultados.getString("password"),
                        getListasOfUser(idUsuario));

                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Se cierra resultSet
            if (resultados != null) {
                try {
                    resultados.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return user;
    }

    public boolean register(Usuario user) {
        ResultSet resultados = null;
        if (getUserByUsername(user.getUsername()) != null)
            return false;
        try {
            Statement sentencia = ConexionUtil.openStatement();
            synchronized (sentencia) {
                String query = "INSERT INTO Usuario (Nombre,Apellidos,email,password,username) "
                        + "VALUES ('"
                        + user.getNombre()
                        + "','"
                        + user.getApellidos()
                        + "','"
                        + user.getEmail()
                        + "','"
                        + user.getPassword()
                        + "','"
                        + user.getUsername()
                        + "')";
                sentencia.executeUpdate(query);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Se cierra resultSet
            if (resultados != null) {
                try {
                    resultados.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return true;
    }

    @Override
    public LinkedList<Lista> getListasOfUser(Integer idUsuario) {
        LinkedList<Lista> lista = new LinkedList<Lista>();
        try {
            // recuperamos el id de las listas que tenga el usuario en listaUsuario
            ResultSet resultados = null;
            recuperarIdListas(idUsuario, resultados, lista);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error getListaOfUser");
        }
        return lista;
    }

    private void recuperarIdListas(Integer idUsuario, ResultSet resultados, LinkedList<Lista> lista) {
        try {
            Statement sentencia = ConexionUtil.openStatement();
            synchronized (sentencia) {
                // Cogemos todos los datos de la asignaturas
                String ss = "SELECT idLista FROM listaUsuario where idUsuario=" + idUsuario.toString();
                resultados = sentencia
                        .executeQuery(ss);
            }
            while (resultados.next()) {
                anadirListaUsuario(resultados.getString(1), lista);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Fallo recuperarIdListas");
        }
    }

    public void anadirListaUsuario(String idLista, LinkedList<Lista> lista) {
        try {
            Statement senten = ConexionUtil.openStatement();
            ResultSet result = null;
            synchronized (senten) {
                result = senten.executeQuery("select * from Lista where idLista=" + idLista);
            }
            while (result.next()) {
                Lista l = new Lista(Integer.parseInt(result.getString(1)), result.getString(2), result.getString(3));
                lista.add(l);
            }
            result.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Fallo anadirListaUsuario");
        }
    }

    public void rellenar(Lista lista, String idCancion){
        try{
            ArtistaServiceBD artistaServiceBD = new ArtistaServiceBD();
            Statement senten = ConexionUtil.openStatement();
            ResultSet result = null;
            synchronized (senten){
                result=senten.executeQuery("select * from Cancion where idCancion="+idCancion);
            }
            while(result.next()){
                Cancion cancion=new Cancion(
                        Integer.parseInt(result.getString(1)),
                        Integer.parseInt(result.getString(2)),
                        artistaServiceBD.getNombreArtistaById(result.getString(3)),
                        result.getString(4),
                        result.getString(5),
                        result.getString(6),
                        result.getString(7)
                );
                lista.addCancion(cancion);
            }
            result.close();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("Fallo rellenar");
        }
    }
    public void rellenarListaCancion(Lista lista){
        try {
            Statement senten = ConexionUtil.openStatement();
            ResultSet result = null;
            synchronized (senten) {
                result = senten.executeQuery("select idCancion from listaCancion where idLista=" + lista.getIdLista());
            }
            while (result.next()) {
                rellenar(lista, result.getString(1));
            }
            result.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Fallo rellenarListaCancion");
        }
    }

    public List<Usuario> getListOfUsers() {
        Usuario user = null;
        ResultSet resultados = null;
        List<Usuario> l = new ArrayList<Usuario>();
      /*  try {
            Statement sentencia = ConexionUtil.openStatement();
            synchronized (sentencia) {
                // Cogemos todos los datos de la asignaturas
                resultados = sentencia.executeQuery("SELECT * FROM Usuario ");
            }

            while (resultados.next()) {
                user = new Usuario(
                        Integer.parseInt(resultados.getString("idUsuario")),
                        resultados.getString("Nombre"),
                        resultados.getString("Apellidos"),
                        resultados.getString("email"),
                        resultados.getString("username"),
                        resultados.getString("password"));
                l.add(user);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Se cierra resultSet
            if (resultados != null) {
                try {
                    resultados.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

       */
        return l;
    }

    @Override
    public Lista getListaUsuario(Integer idUsuario, Integer idLista) {
        return null;
    }

    @Override
    public boolean deleteUsuario(Integer idUsuairo) {
        return false;
    }


}
