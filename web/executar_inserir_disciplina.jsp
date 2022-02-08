
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Disciplina"%> 
<%@page import="DAO.DAODisciplina"%> 
        <%
            Disciplina disciplina = new Disciplina();
            DAODisciplina daoDisc = new DAODisciplina();
            try{
            String nome = request.getParameter("nome");
            String cargaHoraria = request.getParameter("cargahoraria");
            if(nome.equals(null)||cargaHoraria.equals(null)){

            }else{
                disciplina.setNome(nome);
                disciplina.setCargaHoraria(Integer.parseInt(cargaHoraria));
                daoDisc.inserirDisciplina(disciplina);
                out.print("Disciplina inserida com sucesso");
                out.print("<meta http-equiv='refresh' content='3; url=consultar_disciplina.jsp'>"); 
            }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
            %>
 