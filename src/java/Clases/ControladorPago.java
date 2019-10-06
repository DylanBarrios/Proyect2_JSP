package Clases;

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
@WebServlet(name = "ControladorPago", urlPatterns = {"/ControladorPago"})
public class ControladorPago extends HttpServlet {
    Connection cn = ConectorBD.conexion();
    String namePago, revistaPago;
    int idUSER, idREVISTA, idSUS;
    float costoRevista;
    double porcentaje,costoServicio;
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
        
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        
        namePago = request.getParameter("nombrePAGO");
        revistaPago = request.getParameter("revistaPAGO");
        
        try {
            ps1 = cn.prepareStatement("SELECT id_revista, cuotaS FROM Revistas WHERE nombreR='" + revistaPago + "'");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                idREVISTA = rs1.getInt("id_revista");
                costoRevista = rs1.getFloat("cuotaS");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        
        try {
            ps2 = cn.prepareStatement("SELECT id_user FROM User WHERE name='" + namePago+"'");
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                idUSER = rs2.getInt("id_user");
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        try {
            ps3 = cn.prepareStatement("SELECT id_suscripcion FROM Suscripcion WHERE id_user='" + idUSER+"' AND id_revista='"+idREVISTA+"'");
            ResultSet rs3 = ps3.executeQuery();
            if (rs3.next()) {
                idSUS = rs3.getInt("id_suscripcion");
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        Date now = new Date(System.currentTimeMillis());
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

        String sql = "INSERT INTO Pago VALUES(?,?,?,?,?,?,?)";
        
        porcentaje= 0.10;
        costoServicio= costoRevista*porcentaje;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setInt(2, idSUS);
            ps.setString(3, date.format(now) );
            ps.setString(4, request.getParameter("fechaVen"));
            ps.setFloat(5,costoRevista);
            ps.setDouble(6, porcentaje);
            ps.setDouble(7,costoServicio);
            ps.executeUpdate();
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException m) {
            System.err.println(m);
        } catch (Exception n) {
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
