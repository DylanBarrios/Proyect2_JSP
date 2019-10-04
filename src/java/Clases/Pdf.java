/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author jara
 */
public class Pdf {

    Connection cn = ConectorBD.conexion();
    String autorL;

    /*Metodo listar*/
    public ArrayList<Revista> Listar_Pdf() {
        autorL = ControladorLogin.nameL;
        ArrayList<Revista> list = new ArrayList<Revista>();
        String sql = "SELECT nombreR, autor, fechaC, pdf FROM Revista WHERE autor='" + autorL + "'";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Revista r = new Revista();
                r.setNombre(rs.getString("nombreR"));
                r.setAutor(rs.getString("autor"));
                r.setFechaCreacion(String.valueOf(rs.getDate("fechaC")));
                r.setPdf(rs.getBinaryStream("pdf"));
                list.add(r);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                ps.close();
                rs.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return list;
    }

    public ArrayList<Revista> Lector_Pdf() {
        ArrayList<Revista> listLector = new ArrayList<Revista>();
        String sql = "SELECT nombreR, autor, etiqueta, descripcionR, categoria, cuotaS, fechaC FROM Revista";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Revista a = new Revista();
                a.setNombre(rs.getString("nombreR"));
                a.setAutor(rs.getString("autor"));
                a.setEtiqueta(rs.getString("etiqueta"));
                a.setDescripcionR(rs.getString("descripcionR"));
                a.setCategoria(rs.getString("categoria"));
                a.setCuotaS(rs.getFloat("cuotaS"));
                a.setFechaCreacion(String.valueOf(rs.getDate("fechaC")));
                listLector.add(a);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                ps.close();
                rs.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return listLector;
    }

    public ArrayList<Revista> Suscripcion_Pdf() {
        ArrayList<Revista> listSuscripcion = new ArrayList<Revista>();
        String sql = "SELECT nombreR, autor, etiqueta, descripcionR, categoria, cuotaS, fechaC, pdf FROM Revista";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Revista a = new Revista();
                a.setNombre(rs.getString("nombreR"));
                a.setAutor(rs.getString("autor"));
                a.setEtiqueta(rs.getString("etiqueta"));
                a.setDescripcionR(rs.getString("descripcionR"));
                a.setCategoria(rs.getString("categoria"));
                a.setCuotaS(rs.getFloat("cuotaS"));
                a.setFechaCreacion(String.valueOf(rs.getDate("fechaC")));
                listLector.add(a);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                ps.close();
                rs.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return listLector;
    }
}
