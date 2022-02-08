
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Professor"%> 
<%@page import="DAO.DAOProfessor"%> 
        <%
            Professor professor = new Professor();
            DAOProfessor daoProf = new DAOProfessor();
            try{
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            if(nome.equals(null)||email.equals(null) || senha.equals(null)){

            }else{
                professor.setNome(nome);
                professor.setEmail(email);
                professor.setSenha(senha);
                daoProf.inserirProfessor(professor);
                out.print("Professor inserido com sucesso");
                out.print("<meta http-equiv='refresh' content='3; url=consultar_professor.jsp'>"); 
            }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
            %>
 