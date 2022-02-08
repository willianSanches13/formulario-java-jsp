
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Disciplina"%>
<%@page import="DAO.DAODisciplina"%>
<%
    try{
        Disciplina disciplina  = new Disciplina();
        DAODisciplina daoDisc = new DAODisciplina(); 
        disciplina.setId(Integer.parseInt(request.getParameter("id")));
  
        disciplina.setNome(request.getParameter("nome")); 
        disciplina.setCargaHoraria(Integer.parseInt(request.getParameter("cargahoraria"))); 
        daoDisc.atualizarDisciplina(disciplina); 
        out.print("Alterado com sucesso!");
        out.print("<meta http-equiv='refresh' content='3; url=consultar_disciplina.jsp'>"); 
    }catch(Exception e){
        throw new RuntimeException("Erro executar alterar "+e); 
    }
%>