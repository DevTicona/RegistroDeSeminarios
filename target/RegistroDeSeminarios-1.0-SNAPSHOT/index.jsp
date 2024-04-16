<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Seminario"%>
<%
    if (session.getAttribute("lista") == null) {
        ArrayList<Seminario> listaAux = new ArrayList<Seminario>();
        session.setAttribute("lista", listaAux);
    }
    List<Seminario> listaSem = (ArrayList<Seminario>) session.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <h1>Registro en Seminarios</h1>
        <a href="MainServlet?action=nuevo" class="button">Nuevo Registro</a>
        <div class="container2">
            
          
            <table class="styled-table">

            <tr>
                <th>Id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>
            </tr>

            <%
                if (listaSem != null) {
                    for (Seminario se : listaSem) {

            %>
            <tr>
                <td><%= se.getId()%></td>
                <td><%= se.getFecha()%></td>
                <td><%= se.getNombre()%></td>
                <td><%= se.getApellidos()%></td>
                <td><%= se.getTurno()%></td>
                <td><%= se.getDescripcion()%></td>
                <td><a href="MainServlet?action=editar&id=<%= se.getId()%>">Editar</a></td>
                <td><a href="MainServlet?action=eliminar&id=<%= se.getId()%>">Eliminar</td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        </div>
    </body>
</html>
