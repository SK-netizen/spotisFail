package controller;

import model.Lista;
import model.Usuario;
import services.UsuarioService;
import services.UsuarioServiceBD;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;


@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
    private UsuarioService userService = new UsuarioServiceBD();

    @Override
    public void init(ServletConfig config) throws ServletException {
    }

    public void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String accion = req.getParameter("action");
        if (accion.equals("UsuarioLogin")) {
            doLogin(req, res);
        } else if (accion.equals("UsuarioAlta")) {
            darAlta(req, res);
        } else if (accion.equals("UsuarioListas")) {
            anadirListaCancion(req,res);
        } else {
            res.sendRedirect("Error.jsp?error=No hay acción");
        }

    }
    public void anadirListaCancion(HttpServletRequest req, HttpServletResponse res){
        req.getSession().setAttribute("idListaA",req.getParameter("idListaA"));
        LinkedList<Lista> listas = (LinkedList<Lista>) req.getSession().getAttribute("listas");
        Iterator it = listas.iterator();
        while(it.hasNext()){
            Lista lista = (Lista) it.next();
            if(lista.getIdLista()==Integer.parseInt(req.getParameter("idListaA"))){
                if(lista.getListaCancion().size()==0){
                    userService.rellenarListaCancion(lista);
                }
                try {
                    req.getRequestDispatcher("WEB-INF/Principal.jsp").forward(req, res);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    public void doLogin(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("user");
        String passRecibido = req.getParameter("password");

        if (!username.equals("admin")) {
            // por seguirdad se guarda el has code mas 34523
            passRecibido = String.valueOf(passRecibido.hashCode() + 34523);
        }
        try {
            boolean result = userService.authenticate(username, passRecibido);
            Usuario user = userService.getUserByUsername(username);
            if (result == true) {
                HttpSession session = req.getSession(true);
                session.setAttribute("idUsuario", String.valueOf(user.getId()));
                session.setAttribute("Nombre", user.getNombre());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("listas", user.getListaUsuario());
                session.setAttribute("mensaje", "Autenticacion correcta");
                req.getRequestDispatcher("WEB-INF/Principal.jsp").forward(req, res);
            } else {
                res.sendRedirect("Error.jsp?error=Error en Password");
                return;
            }
        } catch (Exception e2) {
            // Error SQL: login/passwd mal
            res.sendRedirect("Error.jsp?error=ERROR:Fallo en SQL");
        }
    }

    public LinkedList<Lista> cancionUsuario(HttpServletRequest req, HttpServletResponse res) {
        LinkedList<Lista> listaCanciones = new LinkedList<Lista>();

        return listaCanciones;
    }

    public void darAlta(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String n = req.getParameter("Nombre");
        String apel = req.getParameter("Apellidos");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        // por seguirdad se guarda el has code mas 34523
        String pass = String.valueOf(req.getParameter("password").hashCode() + 34523);
        Usuario usuario1 = new Usuario(-1, n, apel, email, username, pass, new LinkedList<Lista>());

        try {
            boolean result = userService.register(usuario1);
            if (result) {
                req.setAttribute("mensaje", "Dado de alta correctamente");
                req.getRequestDispatcher("index.jsp").forward(req, res);
                return;
            } else {
                res.sendRedirect("Error.jsp?error=El usuario ya existe");
                return;
            }
        } catch (Exception e2) {
            // Error SQL: login/passwd mal
            res.sendRedirect("Error.jsp?error=ERROR:Fallo en SQL");
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
    }

    @Override
    public void destroy() {
    }
}
