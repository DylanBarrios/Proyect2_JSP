package Clases;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author jara
 */
public class Usuario {
    private String nombre;
    private String pass;
    private String nivelUsuario;
    private String correo;
    private int telefono;
    private String hobbies;
    private String intereses;
    private String descripcion;
    private String gustos;
    private InputStream foto;
    Part filePart=null;
    
    public Usuario(HttpServletRequest request) throws IOException, ServletException {
        pass = request.getParameter("pass");
        nombre = request.getParameter("nombre");
        nivelUsuario = request.getParameter("nivelUsuario");
        correo = request.getParameter("correo");
        telefono = Integer.parseInt(request.getParameter("telefono"));
        hobbies = request.getParameter("hobbies");
        intereses = request.getParameter("intereses");
        descripcion = request.getParameter("descripcion");
        gustos = request.getParameter("gustos");
        filePart = request.getPart("foto");
        foto = filePart.getInputStream();
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getNivelUsuario() {
        return nivelUsuario;
    }

    public void setNivelUsuario(String nivelUsuario) {
        this.nivelUsuario = nivelUsuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getIntereses() {
        return intereses;
    }

    public void setIntereses(String intereses) {
        this.intereses = intereses;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getGustos() {
        return gustos;
    }

    public void setGustos(String gustos) {
        this.gustos = gustos;
    }
    
    
}
