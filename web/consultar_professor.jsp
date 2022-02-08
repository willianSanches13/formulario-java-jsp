<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Professor"%>
<%@page import="DAO.DAOProfessor"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Professores</title>
    </head>
    <body>
    <h1>Lista de Professores</h1><br>
    <form action="consultar_professor.jsp" method="post">
        <label>Pesquisar por Nome</label>
        <input type="text" name="nome"/>
        <input type="submit" value="Pesquisar"/>
    </form><br>
    <%
        out.print("<table border='1'>");
        out.print("<tr>");
            out.print("<th>ID</th>");  
            out.print("<th>NOME</th>");  
            out.print("<th>EMAIL</th>");  
            out.print("<th>Excluir</th>"); 
            out.print("<th>Editar</th>"); 
        out.print("</tr>"); 
        DAOProfessor professor = new DAOProfessor();
          if(request.getParameter("nome") == null){
                ArrayList<Professor> lista = professor.listarProfessores(); 
            for(Professor e: lista){
                out.print("<tr>");
                    out.print("<td>"+e.getId()+"</td>");
                    out.print("<td>"+e.getNome()+"</td>"); 
                    out.print("<td>"+e.getEmail()+"</td>");
                     out.print(
                        "<td><a href='excluir_professor.jsp?id="
                        +e.getId()
                        +"&nome="+e.getNome()
                        +"&email"+e.getEmail()
                        +"'>CLIQUE</a></td>"
                    );  
                     out.print(
                        "<td><a href='alterar_professor.jsp?id="
                        +e.getId()
                        +"&nome="+e.getNome()
                        +"&email="+e.getEmail()
                        +"&senha="+e.getSenha()
                        +"'>CLIQUE</a></td>"
                    );  
                out.print("</tr>"); 
            }
          }else{
            ArrayList<Professor> lista = professor.listarProfessorNome(request.getParameter("nome"));
            for(Professor e: lista){
                out.print("<tr>");
                    out.print("<td>"+e.getId()+"</td>");
                    out.print("<td>"+e.getNome()+"</td>"); 
                    out.print("<td>"+e.getEmail()+"</td>");
                out.print("</tr>");
            }
          }
      
        out.print("</table>");
    %>
    <a href="index.jsp">Início</a>
    </body>
</html>
