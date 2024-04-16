package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "view";
        HttpSession sesion = request.getSession();
        List<Seminario> lista = (ArrayList<Seminario>) sesion.getAttribute("lista");
        switch (action) {
            case "view":
                response.sendRedirect("index.jsp");
                break;
            case "nuevo":
                Seminario se = new Seminario();
                request.setAttribute("seminario", se);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));

                Seminario editSe = new Seminario();
                for (Seminario item : lista) {
                    if (item.getId() == idEditar) {
                        editSe = item;
                        break;
                    }
                }
                request.setAttribute("seminario", editSe);
                String turnoSeleccionado = editSe.getTurno();
                request.setAttribute("turnoSeleccionado", turnoSeleccionado);

                String descripcionSeleccionada = editSe.getDescripcion();
                request.setAttribute("descripcionSeleccionada", descripcionSeleccionada);
                
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                for (Seminario item : lista) {
                    if (item.getId() == idEliminar) {
                        lista.remove(item);
                        break;
                    }
                }
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String turno = request.getParameter("turno");
        String descripcion = request.getParameter("descripcion");

        HttpSession ses = request.getSession();
        List<Seminario> listaSem = (ArrayList<Seminario>) ses.getAttribute("lista");

        if (id == 0) {
            Seminario se = new Seminario();
            int idNuevo = obtenerNuevoId(listaSem);
            se.setId(idNuevo);
            se.setFecha(fecha);
            se.setNombre(nombre);
            se.setApellidos(apellidos);
            se.setTurno(turno);
            se.setDescripcion(descripcion);
            listaSem.add(se);
        } else {
            for (Seminario item : listaSem) {
                if (item.getId() == id) {
                    item.setFecha(fecha);
                    item.setNombre(nombre);
                    item.setApellidos(apellidos);
                    item.setTurno(turno);
                    item.setDescripcion(descripcion);
                    break;
                }
            }
        }
        response.sendRedirect("index.jsp");
    }

    public int obtenerNuevoId(List<Seminario> lista) {
        int nuevoId = 1;
        for (Seminario item : lista) {
            if (item.getId() >= nuevoId) {
                nuevoId = item.getId() + 1;
            }
        }
        return nuevoId;
    }
}
