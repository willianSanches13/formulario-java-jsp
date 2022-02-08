<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Disciplina"%>
<%@page import="DAO.DAODisciplina"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Disciplinas</title>
    </head>
    <body>
    <h1>Lista de Disciplinas</h1><br>
    <form action="consultar_disciplina.jsp" method="post">
        <label>Pesquisar por Nome</label>
        <input type="text" name="nome"/>
        <input type="submit" value="Pesquisar"/>
    </form><br>
    <%
        out.print("<table border='1'>");
        out.print("<tr>");
            out.print("<th>ID</th>");  
            out.print("<th>NOME</th>");  
            out.print("<th>CARGA HORARIA</th>");  
            out.print("<th>Excluir</th>"); 
            out.print("<th>Editar</th>"); 
        out.print("</tr>"); 
        DAODisciplina disciplina = new DAODisciplina();
          if(request.getParameter("nome") == null){
                ArrayList<Disciplina> lista = disciplina.listarDisciplinas(); 
            for(Disciplina e: lista){
                out.print("<tr>");
                    out.print("<td>"+e.getId()+"</td>");
                    out.print("<td>"+e.getNome()+"</td>"); 
                    out.print("<td>"+e.getCargaHoraria()+"</td>");
                     out.print(
                        "<td><a href='excluir_disciplina.jsp?id="
                        +e.getId()
                        +"&nome="+e.getNome()
                        +"&cargahoraria="+e.getCargaHoraria()
                        +"'>CLIQUE</a></td>"
                    );  
                     out.print(
                        "<td><a href='alterar_disciplina.jsp?id="
                        +e.getId()
                        +"&nome="+e.getNome()
                        +"&cargahoraria="+e.getCargaHoraria()
                        +"'>CLIQUE</a></td>"
                    );  
                out.print("</tr>"); 
            }
          }else{
            ArrayList<Disciplina> lista = disciplina.listarDisciplinaNome(request.getParameter("nome"));
           for(Disciplina e: lista){
                out.print("<tr>");
                    out.print("<td>"+e.getId()+"</td>");
                    out.print("<td>"+e.getNome()+"</td>"); 
                    out.print("<td>"+e.getCargaHoraria()+"</td>");
                    out.print(
                        "<td><a href='excluir_disciplina.jsp?id="
                        +e.getId()
                        +"&nome="+e.getNome()
                        +"&cargahoraria="+e.getCargaHoraria()
                        +"'>CLIQUE</a></td>"
                    ); 
                    out.print(
                        "<td><a href='alterar_disciplina.jsp?id="
                        +e.getId()
                        +"&nome="+e.getNome()
                        +"&cargahoraria="+e.getCargaHoraria()
                        +"'>CLIQUE</a></td>"
                    );  
                out.print("</tr>");
            }
          }
      
        out.print("</table>");
    %>
    <a href="index.jsp">Início</a>
    </body>
</html>
