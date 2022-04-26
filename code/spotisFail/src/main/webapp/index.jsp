<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf8"/>
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
<%
    //    if (session.getAttribute("Nombre")!=null)   {
// 	   response.sendRedirect("WEB-INF/Principal.jsp");
//    } else {
%>
<%
    if (request.getParameter("mensaje") != null) {
        out.println(request.getParameter("error"));
        // abrir ventana no modal de errror
    }
%>
<div id="content">
    <div id="layoutCent">
        <form action="Action" method="post">
            <div id="formLogin">
                <div class="label" id="labelNombre">
                    <label>Usuario: </label>
                </div>
                <div class="inputText" id="inputNombre">
                    <input type="text" name="user" id="user" value="admin"/>
                </div>
                <div class="label" id="labelPass">
                    <label>Password:</label>
                </div>
                <div class="inputText" id="inputPass">
                    <input type="password" name="password" id="password" value="admin"/>
                </div>
                <div class="boton" id="buttonLogin">
                    <input type="submit" value="Login"/>
                    <input type="hidden" name="action" value="UsuarioLogin"/>
                </div>
                <div class="boton" id="buttonValidar">
                    <div>
                        <a href="Registro.html">Registrarse</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div id="layoutInf">
        <div id="contentPie">
            <div>
                <p>Contenido pie pagina</p>
            </div>
            <div>
                <p>666-666-666</p>
            </div>
            <div>
                <p>rohermoso@alumnos.unex.es</p>
            </div>
        </div>
    </div>
</div>
<%//} %>
</body>
</html>




