<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAODisciplina"%>

<%
    try{
        DAODisciplina disciplina = new DAODisciplina(); 
        disciplina.excluirDisciplina(Integer.parseInt(request.getParameter("id")));
        out.print("Disciplina Excluida!"); 
        out.print("<meta http-equiv='refresh' content='3; url=consultar_disciplina.jsp'>"); 
    }catch(Exception e){
        throw new RuntimeException("Erro Executar Excluir: "+e); 
    }
%>