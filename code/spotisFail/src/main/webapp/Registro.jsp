<%--
  Created by IntelliJ IDEA.
  User: sk-netizen
  Date: 26/4/22
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RegistroSpotisFail</title>
    <link rel="stylesheet" type="text/css" href="css/Registro.css"/>
    <script charset="utf-8" src="js/Registro.js"></script>
</head>
<body>
<%
    if (request.getParameter("mensaje") != null) {
        out.println(request.getParameter("error"));
        // abrir ventana no modal de errror
    }
%>
<div id="content">
    <div id="layoutCent">
        <form action="Action" method="post" id="formulario">
            <div id="formLogin">
                <div class="etiqueta" id="labelNombre">
                    <label>Nombre</label>
                </div>
                <div class="inputText" id="inputNombre">
                    <input type="text" name="Nombre" id="Nombre"/>
                </div>

                <div class="etiqueta" id="labelApellidos">
                    <label>Apellidos</label>
                </div>
                <div class="inputText" id="inputApellidos">
                    <input type="text" name="Apellidos" id="Apellidos"/>
                </div>
                <div class="etiqueta" id="labelEmail">
                    <label>Email</label>
                </div>
                <div class="inputText" id="inputEmail">
                    <input type="text" name="email" id="email"/>
                </div>
                <div class="etiqueta" id="labelPassword">
                    <label>Password</label>
                </div>
                <div class="inputText" id="inputPassword">
                    <input type="password" name="password" id="password"/>
                </div>
                <div class="etiqueta" id="labelUsername">
                    <label>Username</label>
                </div>
                <div class="inputText" id="inputUsername">
                    <input type="text" name="username" id="username"/>
                </div>
                <div class="boton" id="buttonLogin">
                    <input type="button" value="Confirmar" name="enviar" id="enviar" onclick="validacion()"/>
                    <input type="hidden" name="action" value="UsuarioAlta"/>
                </div>
                <div class="boton" id="buttonRegistro">
                    <div>
                        <a href="index.jsp">Cancelar</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div id="layoutInf">
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


</body>
</html>
