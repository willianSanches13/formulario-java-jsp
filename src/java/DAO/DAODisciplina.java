package DAO;

import MODEL.Disciplina;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DAODisciplina {

    private Connection conn; 
    private PreparedStatement stmt; 
    private Statement st; 
    private ResultSet rs; 
    private ArrayList lista = new ArrayList<>(); 
    
    public DAODisciplina(){
        conn = Conexao.getConexao(); 
    }
    
    public void inserirDisciplina(Disciplina disciplina){
        try{
            String sql = "INSERT INTO TB_DISCIPLINA (NOME_DISCIPLINA, CARGAHORARIA_DISCIPLINA)"
                          +"VALUES (?,?) ORDER BY NOME_DISCIPLINA";
            stmt = conn.prepareStatement(sql); 
            stmt.setString(1, disciplina.getNome()); 
            stmt.setInt(2, disciplina.getCargaHoraria());
            stmt.execute(); 
            stmt.close(); 
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage()); 
        }
    }
      
    public ArrayList<Disciplina> listarDisciplinas(){
        String sql = "SELECT * FROM TB_DISCIPLINA"; 
        try{
            st = conn.createStatement(); 
            rs = st.executeQuery(sql); 
            while(rs.next()){
                Disciplina disciplina = new Disciplina(); 
                disciplina.setId(rs.getInt("id_disciplina")); 
                disciplina.setNome(rs.getString("nome_disciplina")); 
                disciplina.setCargaHoraria(rs.getInt("cargahoraria_disciplina")); 
                lista.add(disciplina); 
            }
            st.close(); 
            rs.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
        return lista; 
    }
        
    public ArrayList<Disciplina> listarDisciplinaNome(String valor){
         String sql =  "SELECT * FROM TB_DISCIPLINA WHERE NOME_DISCIPLINA LIKE '%"+valor+"%'"; 
        try{
            st = conn.createStatement(); 
            rs = st.executeQuery(sql); 
            while(rs.next()){
                Disciplina disciplina = new Disciplina(); 
                disciplina.setId(rs.getInt("ID_DISCIPLINA")); 
                disciplina.setNome(rs.getString("NOME_DISCIPLINA")); 
                disciplina.setCargaHoraria(rs.getInt("CARGAHORARIA_DISCIPLINA")); 
                lista.add(disciplina); 
            }
            st.close(); 
            rs.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
        return lista; 
    }
        
    public void atualizarDisciplina(Disciplina disciplina){
        try{
            String sql = "UPDATE TB_DISCIPLINA SET NOME_DISCIPLINA = ?, CARGAHORARIA_DISCIPLINA = ? "
            + "WHERE ID_DISCIPLINA = ?"; 
            stmt = conn.prepareStatement(sql); 
            stmt.setString(1, disciplina.getNome());
            stmt.setInt(2, disciplina.getCargaHoraria());
            stmt.setInt(3, disciplina.getId());
            stmt.execute(); 
            stmt.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
  
    }
            
    public void excluirDisciplina(int valor){
        try{
            String sql = "DELETE FROM TB_DISCIPLINA WHERE ID_DISCIPLINA = "+valor; 
            st = conn.createStatement();
            st.execute(sql);  
            st.close(); 
        }catch(Exception e){
            throw new RuntimeException(e.getMessage()); 
        }
    }

}