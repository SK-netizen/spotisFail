<%@ page import="java.util.LinkedList" %>
<%@ page import="model.Lista" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Cancion" %><%--
  Created by IntelliJ IDEA.
  User: sk-netizen
  Date: 20/4/22
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
    <script charset="utf-8" src="${pageContext.request.contextPath}/js/Principal.js"></script>

</head>
<body>

<div id="grid">
    <div id="layout1" class="layout1" height="160">
        <div id="encabezado">
            <h1>SpotisFail</h1>
        </div>
        <div id="menu">
            <a id="pagina1" class="pagina" href="${pageContext.request.contextPath}/WEB-INF/Principal.jsp">Inicio</a>
            <a id="pagina2" class="pagina" href="">Explorar</a>
            <a id="pagina3" class="pagina" href="">Listas</a>
        </div>
    </div>
    <div id="layoutDer">
        <%
            LinkedList<Lista> listas = (LinkedList<Lista>) session.getAttribute("listas");
            Iterator it = listas.iterator();
            while (it.hasNext()) {
                Lista s = (Lista) it.next();
        %>
        <div>
            <form action="Action" method="post" id="selectionLista<%out.print(s.getIdLista());%>">
                <div>
                    <input type="hidden" name="action" value="UsuarioListas"/>
                    <input type="hidden" name="idListaA" value="<%out.print(s.getIdLista());%>"/>
                    <p onclick="enviar(<%out.print(s.getIdLista());%>)">
                        <%
                            out.print(s.getNombre());
                        %>
                    </p>
                </div>
            </form>
        </div>
        <%
            }
        %>

    </div>
    <div id="layoutCent">
        <%
            if (session.getAttribute("idListaA") != null) {
                LinkedList<Lista> listasA = (LinkedList<Lista>) session.getAttribute("listas");
                Iterator ot = listasA.iterator();
                while (ot.hasNext()) {
                    Lista l = (Lista) ot.next();

                    if (l.getIdLista().toString().equals (session.getAttribute("idListaA"))) {
                        LinkedList<Cancion> listaCancion = (LinkedList<Cancion>) l.getListaCancion();
                        Iterator et = listaCancion.iterator();
                        while (et.hasNext()) {
                            Cancion cancion = (Cancion) et.next();
        %>
        <div>
            <p>
                <%
                    out.print(cancion.getNombreCancion());
                %>
            </p>
        </div>
        <%
                        }
                    }
                }
            }
        %>
    </div>
    <div id="layoutIzq"></div>
    <div id="layoutInf"></div>
</div>

</body>
</html>
