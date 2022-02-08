
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Professor"%>
<%@page import="DAO.DAOProfessor"%>
<%
    try{

        Professor professor  = new Professor();
        DAOProfessor daoProf = new DAOProfessor(); 
        professor.setNome(request.getParameter("nome")); 
        professor.setEmail(request.getParameter("email")); 
        professor.setId(Integer.parseInt(request.getParameter("id")));
        professor.setSenha(request.getParameter("senha"));
        daoProf.atualizarProfessor(professor); 
        out.print("Alterado com sucesso!");
        out.print("<meta http-equiv='refresh' content='3; url=consultar_professor.jsp'>"); 
    }catch(Exception e){
        throw new RuntimeException("Erro executar alterar "+e); 
    }
%>