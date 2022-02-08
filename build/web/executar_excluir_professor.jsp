<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOProfessor"%>

<%
    try{
        DAOProfessor professor = new DAOProfessor(); 
        professor.excluirProfessor(Integer.parseInt(request.getParameter("id")));
        out.print("Professor Excluido!"); 
        out.print("<meta http-equiv='refresh' content='3; url=consultar_professor.jsp'>"); 
    }catch(Exception e){
        throw new RuntimeException("Erro Executar Excluir: "+e); 
    }
%>