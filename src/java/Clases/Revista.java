package Clases;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author jara
 */
public class Revista {
    private int codigoR=0;
    private String nombre;
    private String autor;
    private String etiqueta;
    private String descripcionR;
    private String categoria;
    private float cuotaS;
    private String fechaCreacion;
    private InputStream pdf;
    Part part = null;
    
    public Revista(){       
    }
    
    public Revista(HttpServletRequest request) throws IOException, ServletException {
        nombre = request.getParameter("nombreR");
        autor = request.getParameter("autor");
        etiqueta = request.getParameter("etiqueta");
        descripcionR = request.getParameter("descripcionR");
        categoria = request.getParameter("categoria");
        cuotaS =Float.parseFloat(request.getParameter("cuotaS"));
        fechaCreacion = request.getParameter("fechaC");
        part = request.getPart("pdf");
        pdf= part.getInputStream();
    }

    public int getCodigoR() {
        return codigoR;
    }

    public void setCodigoR(int codigoR) {
        this.codigoR = codigoR;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getDescripcionR() {
        return descripcionR;
    }

    public void setDescripcionR(String descripcionR) {
        this.descripcionR = descripcionR;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public float getCuotaS() {
        return cuotaS;
    }

    public void setCuotaS(float cuotaS) {
        this.cuotaS = cuotaS;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public InputStream getPdf() {
        return pdf;
    }

    public void setPdf(InputStream pdf) {
        this.pdf = pdf;
    }
    
}
