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
@WebServlet(name = "ControladorLike", urlPatterns = {"/ControladorLike"})
public class ControladorLike extends HttpServlet {

    Connection cn = ConectorBD.conexion();
    public static String revista;

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
            PreparedStatement ps1 = cn.prepareStatement("SELECT descripcionR FROM Revistas WHERE id_revista='" + ControladorReacciones.idRevistaL + "'");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                revista = rs1.getString("descripcionR");
            }
        } catch (SQLException e) {
            System.err.println("Error al jalar nombre convirtiendolo" + e);
        }

        Date now = new Date(System.currentTimeMillis());
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        
        String sql2 = "INSERT INTO Reacciones VALUES(?,?,?,?,?,?)";
        PreparedStatement ps2 = null;
        try {
            ps2 = cn.prepareStatement(sql2);
            ps2.setInt(1, 0);
            ps2.setString(2, ControladorReacciones.nameL);
            ps2.setString(3, revista);
            ps2.setInt(4, 1);
            ps2.setString(5, null);
            ps2.setString(6, date.format(now));
            ps2.executeUpdate();
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
