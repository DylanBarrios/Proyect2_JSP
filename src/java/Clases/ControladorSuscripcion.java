/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(name = "ControladorSuscripcion", urlPatterns = {"/ControladorSuscripcion"})
public class ControladorSuscripcion extends HttpServlet {

    Connection cn = ConectorBD.conexion();
    int nombreS, revistaS;
    String name, rev;

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

        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        name = request.getParameter("nombreS");
        rev = request.getParameter("revistaS");
        try {
            ps2 = cn.prepareStatement("SELECT id_user FROM User WHERE name='" + name + "'");
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                nombreS = rs2.getInt("id_user");
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }

        try {
            ps1 = cn.prepareStatement("SELECT id_revista FROM Revistas WHERE nombreR='" + rev + "'");
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                String sql = "INSERT INTO Suscripcion VALUES(?,?,?,?,?)";
                PreparedStatement ps = null;
                try {
                    ps = cn.prepareStatement(sql);
                    ps.setInt(1, 0);
                    ps.setInt(2, rs1.getInt("id_revista"));
                    ps.setInt(3, nombreS);
                    ps.setString(4, request.getParameter("fechaSus"));
                    ps.setInt(5, 1);
                    ps.executeUpdate();
                } catch (SQLException m) {
                    System.err.println(m);
                }
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("PagoRevista.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            System.err.println(e);
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
