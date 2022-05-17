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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css?v=<%= System.currentTimeMillis()%>">
    <script charset="utf-8" src="${pageContext.request.contextPath}/js/Principal.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@700&family=Poppins:ital,wght@1,100;1,200&display=swap" rel="stylesheet">

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
                    <div class="buttonLista" onclick="enviar(<%out.print(s.getIdLista());%>)">
                        <%
                            out.print(s.getNombre());
                        %>
                    </div>
                </div>
            </form>
        </div>
        <%
            }
        %>
    </div>
    <%
        String nombreLista="";
        String urlLista="";
        if (session.getAttribute("idListaA") != null) {
            LinkedList<Lista> listasA = (LinkedList<Lista>) session.getAttribute("listas");
            Iterator ot = listasA.iterator();
            while (ot.hasNext()) {
                Lista l = (Lista) ot.next();

                if (l.getIdLista().toString().equals(session.getAttribute("idListaA"))) {
                    nombreLista=l.getNombre();
                    urlLista=l.getImage();
                }
            }
        }

    %>
    <div id="layoutCent">
        <div id="infoLista" class="infoLista">
            <div id="imageLista">
                <div>
                    <img src="<%out.print(urlLista);%>.jpeg" height="70px" width="70px">
                </div>
            </div>
            <div id="nombreLista">
                <div>
                    <%
                        out.print(nombreLista);
                    %>
                </div>
            </div>
        </div>
        <div id="cabeceraListas">
            <div class="cabecera" id="cabeceraCancion">
                <div>
                    Cancion
                </div>
            </div>
            <div class="cabecera" id="cabeceraArtista">
                <div>
                    Artista
                </div>
            </div>
        </div>
        <div id="nombreCancion" class="listaCanciones">
            <%
                if (session.getAttribute("idListaA") != null) {
                    LinkedList<Lista> listasA = (LinkedList<Lista>) session.getAttribute("listas");
                    Iterator ot = listasA.iterator();
                    while (ot.hasNext()) {
                        Lista l = (Lista) ot.next();

                        if (l.getIdLista().toString().equals(session.getAttribute("idListaA"))) {
                            LinkedList<Cancion> listaCancion = (LinkedList<Cancion>) l.getListaCancion();
                            Iterator et = listaCancion.iterator();
                            while (et.hasNext()) {
                                Cancion cancion = (Cancion) et.next();
            %>
            <div>
                <%
                    out.print(cancion.getNombreCancion());
                %>
            </div>
            <%
                            }
                        }
                    }
                }
            %>
        </div>
        <div id="nombreArtista" class="listaCanciones">
            <%
                if (session.getAttribute("idListaA") != null) {
                    LinkedList<Lista> listasA = (LinkedList<Lista>) session.getAttribute("listas");
                    Iterator ot = listasA.iterator();
                    while (ot.hasNext()) {
                        Lista l = (Lista) ot.next();

                        if (l.getIdLista().toString().equals(session.getAttribute("idListaA"))) {
                            LinkedList<Cancion> listaCancion = (LinkedList<Cancion>) l.getListaCancion();
                            Iterator et = listaCancion.iterator();
                            while (et.hasNext()) {
                                Cancion cancion = (Cancion) et.next();
            %>
            <div>
                <%
                    out.print(cancion.getNombreArtista());
                %>
            </div>
            <%
                            }
                        }
                    }
                }
            %>
        </div>
    </div>
    <div id="layoutIzq"></div>
    <div id="layoutInf"></div>
</div>

</body>
</html>
