<%@page import="com.emergentes.Seminario"%>
<%
    Seminario se = (Seminario) request.getAttribute("seminario");
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
        <h1>Nuevo Registro</h1>
        <div id="form-container">

            <form action="MainServlet" method="post">
                <div id="box1">
                    <label>Datos</label>
                    <br>
                    <input type="hidden" name="id" value="<%= se.getId()%>">
                    <br><br>
                    <label for="fecha">Fecha:</label>
                    <input type="date" id="fecha" name="fecha" required value="<%= se.getFecha()%>">
                    <br><br>
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%= se.getNombre()%>">
                    <br><br>
                    <label for="apellidos">Apellidos:</label>
                    <input type="text" id="apellidos" name="apellidos" value="<%= se.getApellidos()%>">
                    <br><br>
                    <label for="turno">Turno</label>

                    <input type="radio" id="mañana" name="turno" value="Mañana" <% if ("Mañana".equals(request.getAttribute("turnoSeleccionado"))) {
                            out.print("checked");
                        } %>
                           <label for="mañana">Mañana</label>
                    <input type="radio" id="tarde" name="turno" value="Tarde" <% if ("Tarde".equals(request.getAttribute("turnoSeleccionado"))) {
                            out.print("checked");
                        } %>
                           <label for="tarde">Tarde</label>
                    <input type="radio" id="noche" name="turno" value="Noche" <% if ("Noche".equals(request.getAttribute("turnoSeleccionado"))) {
                            out.print("checked");
                        } %>
                           <label for="noche">Noche</label>
                </div>
                <div id="box2">
                    <label>Seminarios Disponibles</label>
                    <br><br><br>
                    <input type="radio" id="opcion_ia" name="descripcion" value="Inteligencia Artificial" <% if ("Inteligencia Artificial".equals(request.getAttribute("descripcionSeleccionada"))) {
                            out.print("checked");
                        } %>>
                    <label for="opcion_ia">Inteligencia Artificial</label>
                    <br><br>
                    <input type="radio" id="opcion_ml" name="descripcion" value="Machine Learning" <% if ("Machine Learning".equals(request.getAttribute("descripcionSeleccionada"))) {
                            out.print("checked");
                        } %>>
                    <label for="opcion_ml">Machine Learning</label>
                    <br><br>
                    <input type="radio" id="opcion_sa" name="descripcion" value="Simulacion con Arena" <% if ("Simulacion con Arena".equals(request.getAttribute("descripcionSeleccionada"))) {
                            out.print("checked");
                        } %>>
                    <label for="opcion_sa">Simulación con Arena</label>
                    <br><br>
                    <input type="radio" id="opcion_re" name="descripcion" value="Robotica Educativa" <% if ("Robotica Educativa".equals(request.getAttribute("descripcionSeleccionada"))) {
                            out.print("checked");
                        }%>>
                    <label for="opcion_re">Robótica Educativa</label>
                </div>

                <div id="bott">
                    <input type="submit" value="Enviar Registro">
                </div>
            </form>
        </div>
    </body>
</html>
