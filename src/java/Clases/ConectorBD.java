package Clases;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author jara
 */
public class ConectorBD {
    
    public static Connection conexion(){
        String user="jara";
        String password="skyfall007";
        String stringConnection = "jdbc:mysql://localhost:3306/Web";
        try{
            Connection cn = DriverManager.getConnection(stringConnection, user, password);           
            System.out.println("Entre");
            return cn;
        }
        catch (SQLException e) {
            System.out.println("Fallo la conexion.");
            System.out.println(e);
        }
        return (null);
    }
}

