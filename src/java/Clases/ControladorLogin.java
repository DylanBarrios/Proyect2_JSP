package Clases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jara
 */
@WebServlet("/ControladorLogin")
public class ControladorLogin extends HttpServlet {
    
    Connection cn = ConectorBD.conexion();
    public static String nameL;
    String passL;
    String get;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        nameL = request.getParameter("nombreL");
        passL = request.getParameter("passL");
        HttpSession nuevaSesion = request.getSession();
        nuevaSesion.setAttribute("SesionU",nameL);
        try {
            PreparedStatement ps = cn.prepareStatement("SELECT name, pass, nivelUsuario FROM User WHERE name='" + nameL + "' AND pass='" +passL  + "'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                get = rs.getString("nivelUsuario");
                if ("Administrador".equals(get)) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
                    dispatcher.forward(request, response);
                } else if ("Editor".equals(get)) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Editor.jsp");
                    dispatcher.forward(request, response);
                } else if ("Suscriptor".equals(get)) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Subscriber.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (!rs.next()) {
                request.setAttribute("error", true);
                RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println("Error al comprobar Usuario");
            System.err.println(e);
        }
    }
}
