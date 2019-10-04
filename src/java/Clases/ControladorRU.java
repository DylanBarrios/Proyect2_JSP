package Clases;

import Clases.UserCreationException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jara
 */
@WebServlet("/ControladorRU")
@MultipartConfig(maxFileSize = 16177215)
public class ControladorRU extends HttpServlet {

    Connection cn = ConectorBD.conexion();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuarioN = new Usuario(request);
        RegistroU registroU = new RegistroU();
        try {
            registroU.crearUsuario(usuarioN);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            dispatcher.forward(request, response);
        } catch (UserCreationException ex) {
            request.setAttribute("error", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
            dispatcher.forward(request, response);
        }
        //response.sendRedirect("resultado.jsp");
    }

}
