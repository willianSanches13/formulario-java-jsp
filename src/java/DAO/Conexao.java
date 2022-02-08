package DAO;
import java.io.FileInputStream;
import java.io.IOException; 
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties; 

public class Conexao {
    private static Connection conn = null; 
    
    public static Connection getConexao(){
        if(conn == null){
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                Properties propriedades = carregarPropriedades();
                final String url = propriedades.getProperty("url");
                conn = DriverManager.getConnection(url, propriedades);
            }catch(SQLException | ClassNotFoundException e){
                throw new DbException(e.getMessage()); 
            }
        }
        return conn; 
    }

    private static Properties carregarPropriedades(){
        String fileUrl = "C:\\Users\\Willian\\Documents\\NetBeansProjects\\avaliacao\\db.properties"; 
        try(FileInputStream fs = new FileInputStream(fileUrl)){
            Properties properties = new Properties(); 
            properties.load(fs); 
            return properties; 
        }catch(IOException e){
            throw new DbException(e.getMessage()); 
        }
    }
}
