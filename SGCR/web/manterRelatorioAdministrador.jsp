<%-- 
    Document   : manterRelatorioAdministrador
    Created on : 27/03/2018, 08:31:45
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório</title>
    </head>
    <body>
        <h1>Relatório</h1>
        <form action="RelatorioController?acao=prepararRelatorio" method="post">
          <input type="submit"/>
        </form>
    </body>
</html>
