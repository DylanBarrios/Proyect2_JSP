package Clases;

import Clases.UserCreationException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.Part;
import javax.xml.transform.Source;

/**
 *
 * @author jara
 */
public class RegistroU {

    
    Connection cn = ConectorBD.conexion();

    public void crearUsuario(Usuario usuario) throws UserCreationException {
        try {
            PreparedStatement ps = cn.prepareStatement("INSERT INTO Exercise VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, 0);
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getPass());
            ps.setString(4, usuario.getNivelUsuario());
            ps.setString(5, usuario.getCorreo());
            ps.setString(6, usuario.getHobbies());
            ps.setString(7, usuario.getIntereses());
            ps.setString(8, usuario.getDescripcion());
            ps.setString(9, usuario.getGustos());
            ps.setInt(10, usuario.getTelefono());
            ps.setBlob(11,usuario.getFoto());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new UserCreationException("Error creando el usuario");
        }
    }
    
}
