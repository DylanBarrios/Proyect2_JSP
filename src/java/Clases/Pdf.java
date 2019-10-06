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
    public static int idU;
    
    /*Metodo listar*/
    public ArrayList<Revista> Listar_Pdf() {
        autorL = ControladorLogin.nameL;
        
        ArrayList<Revista> list = new ArrayList<Revista>();
        String sql = "SELECT id_revista, nombreR, autor, fechaC, pdf FROM Revistas WHERE autor='" + autorL + "' AND estado=0";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Revista r = new Revista();
                r.setCodigoR(rs.getInt("id_revista"));
                r.setNombre(rs.getString("nombreR"));
                r.setAutor(rs.getString("autor"));
                r.setFechaCreacion(rs.getString("fechaC"));
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
     public ArrayList<Revista> ListaAprobada_Pdf() {
         autorL = ControladorLogin.nameL;
        ArrayList<Revista> lista = new ArrayList<Revista>();
        String sql1 = "SELECT id_revista, nombreR, autor, fechaC, pdf FROM Revistas WHERE autor='" + autorL + "' AND estado=1";
        ResultSet rs1 = null;
        PreparedStatement ps1 = null;
        try {
            ps1 = cn.prepareStatement(sql1);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Revista r1 = new Revista();
                r1.setCodigoR(rs1.getInt("id_revista"));
                r1.setNombre(rs1.getString("nombreR"));
                r1.setAutor(rs1.getString("autor"));
                r1.setFechaCreacion(rs1.getString("fechaC"));
                r1.setPdf(rs1.getBinaryStream("pdf"));
                lista.add(r1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                ps1.close();
                rs1.close();
                cn.close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }
    public ArrayList<Revista> ListaAdmin_Pdf() {
        ArrayList<Revista> list = new ArrayList<Revista>();
        String sql = "SELECT id_revista, nombreR, autor, fechaC, pdf FROM Revistas WHERE estado='false'";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {               
                Revista r = new Revista();
                r.setCodigoR(rs.getInt("id_revista"));
                r.setNombre(rs.getString("nombreR"));
                r.setAutor(rs.getString("autor"));
                r.setFechaCreacion(rs.getString("fechaC"));
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
        String sql = "SELECT id_revista, nombreR, autor, etiqueta, descripcionR, categoria, cuotaS, fechaC FROM Revistas WHERE estado='1'";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Revista a = new Revista();
                a.setCodigoR(rs.getInt("id_revista"));
                a.setNombre(rs.getString("nombreR"));
                a.setAutor(rs.getString("autor"));
                a.setEtiqueta(rs.getString("etiqueta"));
                a.setDescripcionR(rs.getString("descripcionR"));
                a.setCategoria(rs.getString("categoria"));
                a.setCuotaS(rs.getFloat("cuotaS"));
                a.setFechaCreacion(rs.getString("fechaC"));
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
    
       public ArrayList<Revista> RevistaP_Pdf() {
        String sql1 ="SELECT id_user FROM User WHERE name='"+ControladorLogin.nameL+"'";
        
        PreparedStatement ps1 =null, ps2=null;
        ResultSet rs1 = null,rs2 = null;      
        ResultSet rs = null;
        PreparedStatement ps = null;
           try {
               ps1 = cn.prepareStatement(sql1);
               rs1 = ps1.executeQuery();
               if (rs1.next()) {
                   idU= rs1.getInt("id_user");
               }
           } catch (SQLException e) {
               System.out.println("Vales madre" +e);
           }
        
           
        ArrayList<Revista> listSus = new ArrayList<Revista>();
        
        try {
            ps = cn.prepareStatement("SELECT Revistas.id_revista, Revistas.nombreR, Revistas.autor, Revistas.etiqueta, Revistas.descripcionR, Revistas.categoria, Revistas.cuotaS,Revistas.fechaC, Revistas.pdf FROM Revistas INNER JOIN Suscripcion ON(Revistas.id_revista = Suscripcion.id_revista) INNER JOIN Pago ON (Pago.id_suscripcion = Suscripcion.id_suscripcion) WHERE Revistas.fechaC BETWEEN Pago.fecha_pago AND Pago.fecha_vencimiento;");
            rs = ps.executeQuery();
            while (rs.next()) {
                Revista s = new Revista();
                s.setCodigoR(rs.getInt("Revistas.id_revista"));
                s.setNombre(rs.getString("Revistas.nombreR"));
                s.setAutor(rs.getString("Revistas.autor"));
                s.setEtiqueta(rs.getString("Revistas.etiqueta"));
                s.setDescripcionR(rs.getString("Revistas.descripcionR"));
                s.setCategoria(rs.getString("Revistas.categoria"));
                s.setCuotaS(rs.getFloat("Revistas.cuotaS"));
                s.setFechaCreacion(rs.getString("Revistas.fechaC"));
                s.setPdf(rs.getBinaryStream("Revistas.pdf"));            
                listSus.add(s);
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
        return listSus;
    }

}
