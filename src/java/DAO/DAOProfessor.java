package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import MODEL.Professor; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class DAOProfessor {
    private Connection conn; 
    private PreparedStatement stmt; 
    private Statement st; 
    private ResultSet rs; 
    private ArrayList lista = new ArrayList<>(); 
    
    public DAOProfessor(){
        conn = Conexao.getConexao(); 
    }
    
    public void inserirProfessor(Professor professor){
        try{
            String sql = "INSERT INTO TB_PROFESSOR (NOME_PROFESSOR, EMAIL_PROFESSOR, SENHA_PROFESSOR) "
                          +"VALUES (?,?,?)";
            stmt = conn.prepareStatement(sql); 
            stmt.setString(1, professor.getNome()); 
            stmt.setString(2, professor.getEmail());
            stmt.setString(3, professor.getSenha()); 
            stmt.execute(); 
            stmt.close(); 
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage()); 
        }
    }
      
    public ArrayList<Professor> listarProfessores(){
        String sql = "SELECT * FROM TB_PROFESSOR" ; 
        try{
            st = conn.createStatement(); 
            rs = st.executeQuery(sql); 
            while(rs.next()){
                Professor professor = new Professor(); 
                professor.setId(rs.getInt("id_professor")); 
                professor.setNome(rs.getString("nome_professor")); 
                professor.setEmail(rs.getString("email_professor")); 
                professor.setSenha(rs.getString("senha_professor"));
                lista.add(professor); 
            }
            st.close(); 
            rs.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
        return lista; 
    }
        
    public ArrayList<Professor> listarProfessorNome(String valor){
         String sql =  "SELECT * FROM TB_PROFESSOR WHERE NOME_PROFESSOR LIKE '%"+valor+"%'"; 
        try{
            st = conn.createStatement(); 
            rs = st.executeQuery(sql); 
            while(rs.next()){
                Professor professor = new Professor(); 
                professor.setId(rs.getInt("id_professor")); 
                professor.setNome(rs.getString("nome_professor")); 
                professor.setEmail(rs.getString("email_professor")); 
                professor.setSenha(rs.getString("senha_professor"));
                lista.add(professor); 
            }
            st.close(); 
            rs.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
        return lista; 
    }
        
    public void atualizarProfessor(Professor professor){
        try{
            String sql = "UPDATE TB_PROFESSOR SET NOME_PROFESSOR = ?, EMAIL_PROFESSOR = ?, SENHA_PROFESSOR = ? "
            + "WHERE ID_PROFESSOR = ?"; 
            stmt = conn.prepareStatement(sql); 
            stmt.setString(1, professor.getNome());
            stmt.setString(2, professor.getEmail());
            stmt.setString(3, professor.getSenha());
            stmt.setInt(4, professor.getId());
            stmt.execute(); 
            stmt.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
  
    }
            
    public void excluirProfessor(int valor){
        try{
            String sql = "DELETE FROM TB_PROFESSOR WHERE ID_PROFESSOR = "+valor; 
            st = conn.createStatement();
            st.execute(sql);  
            st.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
    }

}
