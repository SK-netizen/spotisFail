<%--
  Created by IntelliJ IDEA.
  User: sk-netizen
  Date: 20/4/22
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Scroll.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
    <script charset="utf-8" src="../js/Scroll.js"></script>
    <script charset="utf-8" src="../js/Principal.js"></script>

</head>
<body>
<div id="layout1" class="layout1" height="160">
<div id="encabezado">
    <h1>BiblioCUMe.net</h1>
</div>
<div id="menu">
    <a id="pagina1" class="pagina" href="index.html">Libros</a>
    <a id="pagina2" class="pagina" href="html/pagina2.html">Novedades</a>
    <a id="pagina3" class="pagina" href="html/pagina3.html">Reservas</a>
    <a id="pagina4" class="pagina" href="html/pagina4.html">Game</a>
</div>
</div>
<div id="layout">
    <p><%=session.getAttribute("Nombre")%></p>
    <div id="layoutDer"></div>
    <div id="layoutCent"></div>
    <div id="layoutIzq"></div>
    <div id="layoutInf"></div>
</div>
</body>
</html>
