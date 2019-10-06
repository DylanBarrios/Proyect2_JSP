
package Clases;

import static Clases.ControladorLike.revista;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jara
 */
@WebServlet(name = "ControladorComentario", urlPatterns = {"/ControladorComentario"})
public class ControladorComentario extends HttpServlet {
    Connection cn = ConectorBD.conexion();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            PreparedStatement ps1 = cn.prepareStatement("SELECT descripcionR FROM Revistas WHERE id_revista='" + ControladorReacciones.idRevista + "'");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                revista = rs1.getString("descripcionR");
            }
        } catch (SQLException e) {
            System.err.println("Error al jalar nombre convirtiendolo" + e);
        }
        String sql = "INSERT INTO Reacciones VALUES(?,?,?,?,?,?)";
        PreparedStatement ps = null;

        Date now = new Date(System.currentTimeMillis());
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setString(2, ControladorReacciones.name);
            ps.setString(3, revista);
            ps.setInt(4, 0);
            ps.setString(5, request.getParameter("comentario"));
            ps.setString(6, date.format(now));
            ps.executeUpdate();
            RequestDispatcher dispatcher = request.getRequestDispatcher("Subscriber.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            System.err.println("Error al subir comentario" + e);
        } catch (Exception ex) {
            request.setAttribute("error", true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
            dispatcher.forward(request, response);
        }
        
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
